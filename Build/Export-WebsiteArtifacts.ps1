[CmdletBinding()]
param(
    [switch]$SkipBuild,
    [string]$ArtifactsRoot = (Join-Path $PSScriptRoot '..\WebsiteArtifacts')
)

$ErrorActionPreference = 'Stop'

$repoRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$moduleName = 'PSWriteHTML'
$slug = 'pswritehtml'
$helpCandidates = @(
    (Join-Path $repoRoot "en-US\$moduleName-help.xml"),
    (Join-Path $repoRoot "Artefacts\Unpacked\$moduleName\en-US\$moduleName-help.xml")
)
$examplesSource = Join-Path $repoRoot 'Examples'
$placeholderMarkers = @(
    '{{ Fill in the Synopsis }}',
    '{{ Fill in the Description }}',
    '{{ Add example code here }}',
    '{{ Add example description here }}'
)

function Find-HelpFile {
    foreach ($candidate in $helpCandidates) {
        if (Test-Path -LiteralPath $candidate -PathType Leaf) {
            return [System.IO.Path]::GetFullPath($candidate)
        }
    }

    return $null
}

function Test-PlaceholderContent {
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    foreach ($marker in $placeholderMarkers) {
        $match = Select-String -Path $Path -Pattern ([regex]::Escape($marker)) -SimpleMatch -List -ErrorAction SilentlyContinue
        if ($match) {
            throw "Placeholder API content detected in '$Path' ($marker)."
        }
    }
}

$helpPath = Find-HelpFile
if (-not $helpPath -and -not $SkipBuild) {
    $previousRefresh = $env:RefreshPSD1Only
    try {
        $env:RefreshPSD1Only = 'false'
        & (Join-Path $PSScriptRoot 'Build-Module.ps1')
    } finally {
        if ($null -eq $previousRefresh) {
            Remove-Item Env:RefreshPSD1Only -ErrorAction SilentlyContinue
        } else {
            $env:RefreshPSD1Only = $previousRefresh
        }
    }
    $helpPath = Find-HelpFile
}

if (-not $helpPath) {
    throw "Unable to find $moduleName external help. Run .\Build\Build-Module.ps1 first."
}

Test-PlaceholderContent -Path $helpPath

$resolvedArtifactsRoot = [System.IO.Path]::GetFullPath($ArtifactsRoot)
$apiRoot = Join-Path $resolvedArtifactsRoot 'apidocs\powershell'
$examplesTarget = Join-Path $apiRoot 'examples'

if (Test-Path -LiteralPath $apiRoot) {
    Remove-Item -LiteralPath $apiRoot -Recurse -Force
}

New-Item -ItemType Directory -Path $apiRoot -Force | Out-Null
Copy-Item -LiteralPath $helpPath -Destination (Join-Path $apiRoot "$moduleName-help.xml") -Force

if (Test-Path -LiteralPath $examplesSource -PathType Container) {
    Copy-Item -LiteralPath $examplesSource -Destination $examplesTarget -Recurse -Force
}

$psd1Path = Join-Path $repoRoot "$moduleName.psd1"
$version = $null
if (Test-Path -LiteralPath $psd1Path -PathType Leaf) {
    $version = (Import-PowerShellDataFile -Path $psd1Path).ModuleVersion.ToString()
}

$commit = (& git -C $repoRoot rev-parse HEAD).Trim()
$manifest = [ordered]@{
    slug = $slug
    name = $moduleName
    description = 'PSWriteHTML website artifacts for the Evotec multi-project hub.'
    mode = 'hub-full'
    contentMode = 'hybrid'
    status = 'active'
    listed = $true
    version = $version
    generatedAt = (Get-Date).ToString('o')
    commit = $commit
    links = [ordered]@{
        source = 'https://github.com/EvotecIT/PSWriteHTML'
    }
    surfaces = [ordered]@{
        docs = $true
        apiPowerShell = $true
        apiDotNet = $false
        examples = $false
    }
    artifacts = [ordered]@{
        api = 'WebsiteArtifacts/apidocs'
        docs = 'Website/content/project-docs'
        examples = 'Examples'
    }
}

$manifestPath = Join-Path $resolvedArtifactsRoot 'project-manifest.json'
New-Item -ItemType Directory -Path $resolvedArtifactsRoot -Force | Out-Null
$manifest | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $manifestPath -Encoding UTF8

Write-Host "Exported website artifacts -> $resolvedArtifactsRoot" -ForegroundColor Green
