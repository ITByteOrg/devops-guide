#!/usr/bin/env pwsh
<#
.SYNOPSIS
Generates markdown badge and job tables for CI workflows.

.DESCRIPTION
Scans GitHub Actions workflow files to extract job IDs and purpose metadata. 
Generates badge tables for `workflow-routes.md` and job overview tables for `job-manifest.md`. 
Uses markdown comment blocks for safe injection into documentation.

.AUTHOR
ITByteEnthusiast

.LICENSE
MIT License

.NOTES
File Name : CITableGenerator.ps1
Module Path : devops-guide/scripts/
#>

# Resolve dynamic paths
$base = $PSScriptRoot
$repo = "ITByteOrg/devops-world"
$workflowFolder      = Join-Path $base ".." ".." "devops-world" ".github" "workflows"
$jobManifestPath     = Join-Path $base ".." "docs" "ci-reference" "job-manifest.md"
$workflowRoutesPath  = Join-Path $base ".." "docs" "ci-reference" "workflow-routes.md"

# Validate paths before execution
@(
    @{ Name = "Workflow Folder";      Path = $workflowFolder }
    @{ Name = "Job Manifest Path";    Path = $jobManifestPath }
    @{ Name = "Workflow Routes Path"; Path = $workflowRoutesPath }
) | ForEach-Object {
    if (!(Test-Path $_.Path)) {
        Write-Warning "⚠️ [$($_.Name)] not found → $($_.Path)"
    }
}

function Get-PurposeFromYaml {
    param ($filePath)
    $lines = Get-Content $filePath | Select-Object -First 6
    foreach ($line in $lines) {
        if ($line -match "^\s*#?\s*Purpose\s*:\s*(.+)$") {
            return $matches[1].Trim()
        }
    }
    return "—"
}

function Get-AllJobIds {
    param ($filePath)
    $jobIds = @()
    $lines = Get-Content $filePath
    $jobsSectionFound = $false
    foreach ($line in $lines) {
        if ($line -match "^\s*jobs:\s*$") {
            $jobsSectionFound = $true
            continue
        }
        if ($jobsSectionFound -and $line -match "^\s{2}(\w[\w-]+):") {
            $jobIds += $matches[1]
        }
    }
    return $jobIds
}

# Build job-manifest rows
$jobManifestRows = @()
$jobManifestRows += "| Job ID         | Workflow File          | Purpose |"
$jobManifestRows += "|----------------|------------------------|---------|"

# Build workflow-routes badge rows
$workflowRoutesRows = @()
$workflowRoutesRows += "| Workflow File          | Job ID         | Status Badge                                                |"
$workflowRoutesRows += "|------------------------|----------------|-------------------------------------------------------------|"

# Parse workflow files and populate rows
Get-ChildItem -Path $workflowFolder -Filter *.yml | ForEach-Object {
    $fileName = $_.Name
    $filePath = $_.FullName
    $badgeURL = "https://github.com/$repo/actions/workflows/$fileName/badge.svg"
    $purpose = Get-PurposeFromYaml -filePath $filePath
    $jobIds = Get-AllJobIds -filePath $filePath

    foreach ($jobId in $jobIds) {
        $jobManifestRows += "| $jobId | $fileName | $purpose |"
        $workflowRoutesRows += "| $fileName | $jobId | ![status]($badgeURL) |"
    }
}

# Inject badge block into workflow-routes.md
$routesOriginal = Get-Content $workflowRoutesPath -Raw
$badgeBlock = "<!-- badges-start -->`n" + ($workflowRoutesRows -join "`n") + "`n<!-- badges-end -->"

if ($routesOriginal -match "(?s)<!-- badges-start -->.*?<!-- badges-end -->") {
    $routesUpdated = $routesOriginal -replace "(?s)(<!-- badges-start -->).*?(<!-- badges-end -->)", $badgeBlock
    Set-Content -Path $workflowRoutesPath -Value $routesUpdated
    Write-Host "✅ Injected badge block into: workflow-routes.md"
} else {
    Write-Host "⚠️ Could not find badge placeholders in workflow-routes.md"
}

# Inject job table block into job-manifest.md
$manifestOriginal = Get-Content $jobManifestPath -Raw
$manifestBlock = "<!-- badges-start -->`n" + ($jobManifestRows -join "`n") + "`n<!-- badges-end -->"

if ($manifestOriginal -match "(?s)<!-- badges-start -->.*?<!-- badges-end -->") {
    $manifestUpdated = $manifestOriginal -replace "(?s)(<!-- badges-start -->).*?(<!-- badges-end -->)", $manifestBlock
    Set-Content -Path $jobManifestPath -Value $manifestUpdated
    Write-Host "✅ Injected job table into: job-manifest.md"
} else {
    Write-Host "⚠️ Could not find badge placeholders in job-manifest.md"
}
