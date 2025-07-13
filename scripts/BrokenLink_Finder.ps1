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

.SYNTAX
BrokenLink_Finder.ps1 [-ShowAllLinks]

.PARAMETER ShowAllLinks
If specified, displays a table of all links (broken and good ones)
If not specified, only shows a summary of broken links if there are any.

#>

param (
    [switch]$ShowAllLinks
)


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
$tableHeaderPrinted = $false

# Print Markdown table header
Write-Output "Searching for broken links in Markdown files..."

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
                
                # Valid markdown link format
                $linkText   = $trimmedLine.Substring($startBracket + 1, $middle - $startBracket - 1)
                $linkTarget = $trimmedLine.Substring($middle + 2, $endParen - $middle - 2)

                # Resolve status: external or relative
                if ($linkTarget -like "http*") {
                    $status = Test-LinkStatus $linkTarget
                    if ($status -eq "200") {
                        $status = "OK"
                    } else {
                        $status = "Unknown HTTP Status: $status"
                    }
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

                # Output link details if ShowAllLinks is enabled
                if ($ShowAllLinks -and -not $tableHeaderPrinted) {        
                    Write-Output "`n| **Filename** | **Link Text** | **Link Target** | **Status** |"
                    Write-Output "|--------------|---------------|------------------|-----------|"
                    $tableHeaderPrinted = $true
                }
                
                if ($ShowAllLinks) {
                    Write-Output "| $relativePath | $linkText | $linkTarget | $status |"
                }
            } else {
                Write-Host "Debug: Invalid link format in file "$($file.FullName)"": $
            }
        }
    }
}


# 🔎 Broken Link Summary
Write-Output "Broken link scan completed.`n"
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
