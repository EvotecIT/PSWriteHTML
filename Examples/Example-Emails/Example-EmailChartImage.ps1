# Requires ImagePlayground 3.2.7 or later. Install it with Install-Module ImagePlayground.
[CmdletBinding()]
param(
    [string] $OutputDirectory = (Join-Path ([IO.Path]::GetTempPath()) 'PSWriteHTML-ChartEmail')
)

$ErrorActionPreference = 'Stop'
Import-Module ImagePlayground -MinimumVersion 3.2.7
Import-Module (Join-Path $PSScriptRoot '../../PSWriteHTML.psd1') -Force

$null = New-Item -Path $OutputDirectory -ItemType Directory -Force
$ChartPath = Join-Path $OutputDirectory 'ServiceHealth.png'
$PreviewPath = Join-Path $OutputDirectory 'ServiceHealth-email.html'

# Render the PNG directly from the report data.
$null = New-ImageChart {
    New-ImageChartBar -Label 'Healthy' -Value 18 -Color MediumSeaGreen
    New-ImageChartBar -Label 'Warning' -Value 3 -Color Orange
    New-ImageChartBar -Label 'Failed' -Value 1 -Color IndianRed
} -FilePath $ChartPath -Width 720 -Height 420 -ShowGrid

# Use this HTML body with your mail transport. The example only saves a local preview.
$EmailHtml = EmailBody {
    EmailText -Text 'Service health summary'
    EmailImage -Source $ChartPath -Inline -Width 540 -Height 315 `
        -AlternativeText 'Service health: 18 healthy, 3 warnings, 1 failure'
    EmailText -Text '18 healthy, 3 warnings, 1 failure.'
}
Save-HTML -FilePath $PreviewPath -HTML $EmailHtml
