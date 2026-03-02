#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Git Release Tag Management Script
.DESCRIPTION
    Manages Git release tags (create patch/minor/major tags, show latest, push to remote)
.PARAMETER Action
    The action to perform: Patch, Minor, Major, ShowLatest, Push
#>
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('Patch', 'Minor', 'Major', 'ShowLatest', 'Push')]
    [string]$Action
)

$ErrorActionPreference = 'Stop'

function Get-CurrentVersion {
    $tag = (git describe --tags --abbrev=0 2>$null)
    if ($tag) {
        return $tag.TrimStart('v')
    }
    return '0.0.0'
}

function New-PatchTag {
    $current = Get-CurrentVersion
    $parts = $current -split '\.'
    $patch = [int]$parts[2] + 1
    $newVersion = "$($parts[0]).$($parts[1]).$patch"
    $tagName = "v$newVersion"
    
    Write-Host "Creating tag: $tagName" -ForegroundColor Cyan
    git tag -a "$tagName" -m "Release version $newVersion"
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Tag created successfully: $tagName" -ForegroundColor Green
    } else {
        Write-Host "Failed to create tag" -ForegroundColor Red
        exit 1
    }
}

function New-MinorTag {
    $current = Get-CurrentVersion
    $parts = $current -split '\.'
    $minor = [int]$parts[1] + 1
    $newVersion = "$($parts[0]).$minor.0"
    $tagName = "v$newVersion"
    
    Write-Host "Creating tag: $tagName" -ForegroundColor Cyan
    git tag -a "$tagName" -m "Release version $newVersion"
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Tag created successfully: $tagName" -ForegroundColor Green
    } else {
        Write-Host "Failed to create tag" -ForegroundColor Red
        exit 1
    }
}

function New-MajorTag {
    $current = Get-CurrentVersion
    $parts = $current -split '\.'
    $major = [int]$parts[0] + 1
    $newVersion = "$major.0.0"
    $tagName = "v$newVersion"
    
    Write-Host "Creating tag: $tagName" -ForegroundColor Cyan
    git tag -a "$tagName" -m "Release version $newVersion"
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Tag created successfully: $tagName" -ForegroundColor Green
    } else {
        Write-Host "Failed to create tag" -ForegroundColor Red
        exit 1
    }
}

function Show-LatestTag {
    $tag = git describe --tags --abbrev=0 2>$null
    if ($tag) {
        Write-Host "Latest tag: $tag" -ForegroundColor Green
    } else {
        Write-Host "No tags found" -ForegroundColor Yellow
    }
}

function Push-Tags {
    Write-Host "Pushing tags to remote..." -ForegroundColor Cyan
    git push origin --tags
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Tags pushed successfully!" -ForegroundColor Green
    } else {
        Write-Host "Failed to push tags" -ForegroundColor Red
        exit 1
    }
}

# Execute the requested action
switch ($Action) {
    'Patch'      { New-PatchTag }
    'Minor'      { New-MinorTag }
    'Major'      { New-MajorTag }
    'ShowLatest' { Show-LatestTag }
    'Push'       { Push-Tags }
}
