<#
.SYNOPSIS
Checks chart-to-table filtering when donut slices have equal values.
.DESCRIPTION
Serve ReportDirectory through BaseUri on loopback before running the test.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string] $ReportDirectory,
    [Parameter(Mandatory)][uri] $BaseUri,
    [ValidateSet('Edge', 'Firefox')][string] $Browser = 'Edge'
)

$ErrorActionPreference = 'Stop'
if ($BaseUri.Scheme -ne 'http' -or $BaseUri.Host -ne '127.0.0.1') {
    throw 'BaseUri must point to the loopback HTTP server serving ReportDirectory.'
}
Import-Module (Join-Path $PSScriptRoot '../../PSWriteHTML.psd1') -Force
Import-Module PSParseHTML -MinimumVersion 3.0.9
$null = New-Item -ItemType Directory -Path $ReportDirectory -Force
$Icon = Join-Path $ReportDirectory 'icon.svg'
[IO.File]::WriteAllText($Icon, '<svg xmlns="http://www.w3.org/2000/svg" width="1" height="1"/>')

$Rows = @(
    [pscustomobject]@{ Team = 'Operations'; Requests = 2 }
    [pscustomobject]@{ Team = 'Support'; Requests = 2 }
    [pscustomobject]@{ Team = 'Sales'; Requests = 3 }
)
$null = New-HTML -FilePath (Join-Path $ReportDirectory 'chart-table-filter.html') -FavIcon $Icon {
    Add-HTMLScript -Placement Header -Content 'window.Apex = { chart: { animations: { enabled: false } } };'
    New-HTMLTable -DataTable $Rows -DataTableID 'teams'
    foreach ($ChartId in 'requests', 'summary') {
        New-HTMLChart -Id $ChartId {
            foreach ($Row in $Rows) {
                New-ChartDonut -Name $Row.Team -Value $Row.Requests
            }
            New-ChartEvent -DataTableID 'teams' -ColumnID 0
        }
    }
}

function Assert-ChartClickRows {
    param([string] $ChartId, [int] $Slice, [string] $Expected)

    $Selector = "#$ChartId .apexcharts-pie-area"
    $null = $Session.Page.Locator("#$ChartId").ScrollIntoViewIfNeededAsync().GetAwaiter().GetResult()
    $null = $Session.Page.Locator($Selector).Nth($Slice).WaitForAsync().GetAwaiter().GetResult()
    $Point = Invoke-HtmlBrowserScript -Session $Session -Script @"
() => {
    const slice = document.querySelectorAll('$Selector')[$Slice];
    const bounds = slice.getBoundingClientRect();
    // The center of a donut slice's bounding box can fall outside the painted arc.
    const margin = 12;
    for (let y = Math.max(0, bounds.top) + margin; y < Math.min(innerHeight, bounds.bottom) - margin; y += 4) {
        for (let x = Math.max(0, bounds.left) + margin; x < Math.min(innerWidth, bounds.right) - margin; x += 4) {
            const points = [[x, y], [x - margin, y], [x + margin, y], [x, y - margin], [x, y + margin]];
            if (points.every(([left, top]) => document.elementFromPoint(left, top) === slice)) return JSON.stringify({ x, y });
        }
    }
    throw new Error('No clickable point on the donut slice');
}
"@ | ConvertFrom-Json
    $null = $Session.Page.Mouse.ClickAsync($Point.x, $Point.y).GetAwaiter().GetResult()
    $Actual = Invoke-HtmlBrowserScript -Session $Session -Script '() => [...document.querySelectorAll("#teams tbody tr td:first-child")].map(cell => cell.textContent.trim()).sort().join(",")'
    if ($Actual -ne $Expected) {
        throw "Clicking slice $Slice on '$ChartId' showed [$Actual]. Expected [$Expected]."
    }
}

$Options = @{ Browser = 'Firefox'; Visible = $false; ViewportWidth = 1100; ViewportHeight = 900 }
if ($Browser -eq 'Edge') {
    $Options.Browser = 'Chromium'
    $Options.BrowserChannel = 'msedge'
}
$Session = Start-HtmlBrowserSession -Url ([uri]::new($BaseUri, 'chart-table-filter.html')).AbsoluteUri @Options
try {
    $Session.Page.SetDefaultTimeout(10000)
    $null = $Session.Page.WaitForFunctionAsync('() => jQuery.fn.dataTable.isDataTable("#teams") && document.querySelectorAll(".apexcharts-pie-area").length === 6').GetAwaiter().GetResult()
    Assert-ChartClickRows -ChartId 'requests' -Slice 0 -Expected 'Operations'
    Assert-ChartClickRows -ChartId 'requests' -Slice 1 -Expected 'Support'
    Assert-ChartClickRows -ChartId 'requests' -Slice 1 -Expected 'Operations,Sales,Support'
    Assert-ChartClickRows -ChartId 'requests' -Slice 1 -Expected 'Support'
    Assert-ChartClickRows -ChartId 'summary' -Slice 1 -Expected 'Support'
    Assert-ChartClickRows -ChartId 'summary' -Slice 1 -Expected 'Operations,Sales,Support'
    "PASS: $Browser switches between equal-value slices and clears the filter on a second click of the same slice"
} finally {
    Close-HtmlBrowserSession -Session $Session -ErrorAction Stop
}
