#!/usr/bin/env pwsh
<#
.SYNOPSIS
Scans markdown documentation to detect broken external URLs and missing relative file paths.

.DESCRIPTION
Processes all `.md` files recursively from the repo root. Extracts markdown links based on the 
`[text](target)` pattern, identifies broken external URLs (via HTTP status codes), and validates internal 
relative paths against the file system by resolving them from the source file location. 
Outputs a structured table of link metadata and a summary of broken references.

.AUTHOR
ITByteEnthusiast

.LICENSE
MIT License

.NOTES
File Name : BrokenLink_Finder.ps1
Module Path : devops-guide/scripts/
Tags       : Documentation Automation, Link Validation, CI Linting
#>


# Function to test external HTTP links
function Test-LinkStatus {
    param ([string]$LinkTarget)

    try {
        $response = Invoke-WebRequest -Uri $LinkTarget -Method Head -UseBasicParsing -TimeoutSec 5
        return $response.StatusCode
    }
    catch {
        return "404"
    }
}

# Manual repo root path
$scriptDir = if ($PSScriptRoot) { $PSScriptRoot } else { Get-Location }
$repoRoot = Resolve-Path (Join-Path $scriptDir "..") | Select-Object -ExpandProperty Path
$mdFiles = Get-ChildItem -Path $repoRoot -Recurse -Filter *.md

# Collection to track broken links
$brokenLinks = @()

# Print Markdown table header
Write-Output "`n| **Filename** | **Link Text** | **Link Target** | **Status** |"
Write-Output "|--------------|---------------|------------------|-----------|"

foreach ($file in $mdFiles) {
    $lines = Get-Content $file.FullName
    $relativePath = $file.FullName.Substring($repoRoot.Length).TrimStart("\","/")

    foreach ($line in $lines) {
        if ($line -like "*`](`*") {
            $trimmedLine = $line.Trim()
            $startBracket = $trimmedLine.IndexOf("[")
            $middle = $trimmedLine.IndexOf("](")
            $endParen = $trimmedLine.IndexOf(")", $middle)

            if ($startBracket -ge 0 -and $middle -gt $startBracket -and $endParen -gt $middle) {
                $linkText   = $trimmedLine.Substring($startBracket + 1, $middle - $startBracket - 1)
                $linkTarget = $trimmedLine.Substring($middle + 2, $endParen - $middle - 2)

                # Resolve status: external or relative
                if ($linkTarget -like "http*") {
                    $status = Test-LinkStatus $linkTarget
                } else {
                    $fullPath = Join-Path $file.Directory.FullName $linkTarget
                    $status = if (Test-Path $fullPath) { "OK" } else { "Missing" }
                }

                # Track broken links
                if ($status -eq "404" -or $status -eq "Missing") {
                    $brokenLinks += [PSCustomObject]@{
                        File       = $relativePath
                        LinkText   = $linkText
                        LinkTarget = $linkTarget
                        Status     = $status
                    }
                }

                Write-Output "| $relativePath | $linkText | $linkTarget | $status |"
            } else {
                Write-Output "| $relativePath | *Unable to parse* | $line | - |"
            }
        }
    }
}

# 🔎 Broken Link Summary
Write-Output "`n### Broken Link Summary"

if ($brokenLinks.Count -eq 0) {
    Write-Output "**✅ No broken links found — all targets are healthy.**"
} else {
    Write-Output "**❌ $($brokenLinks.Count) broken link(s) detected:**"

    foreach ($item in $brokenLinks) {
        $file   = $item.File
        $text   = $item.LinkText
        $target = $item.LinkTarget
        $status = $item.Status
        Write-Output "$status in file: $file - [$text]($target)"

    }
}
