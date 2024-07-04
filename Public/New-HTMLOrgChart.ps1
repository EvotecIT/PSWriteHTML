function New-HTMLOrgChart {
    <#
    .SYNOPSIS
    Creates an HTML organizational chart based on the provided nodes and options.

    .DESCRIPTION
    This function generates an interactive HTML organizational chart based on the specified nodes and customization options. Users can define the layout direction, initial visibility level, vertical alignment, and various interactive features like panning, zooming, dragging, and exporting.

    .PARAMETER ChartNodes
    Specifies the nodes to be displayed on the chart. This parameter should contain a script block defining the organizational structure.

    .PARAMETER Direction
    Specifies the layout direction of the chart. Available values are "TopToBottom" (default), "BottomToTop", "LeftToRight", and "RightToLeft".

    .PARAMETER VisileLevel
    Sets the initial visibility level of the org chart.

    .PARAMETER VerticalLevel
    Aligns the nodes vertically starting from the specified level.

    .PARAMETER ToggleSiblings
    Enables the ability to show/hide left and right sibling nodes by clicking arrows.

    .PARAMETER NodeTitle
    Sets the text content of the title section of each org chart node.

    .PARAMETER Pan
    Enables panning the org chart by mouse drag and drop.

    .PARAMETER Zoom
    Enables zooming in and out of the org chart using the mouse wheel.

    .PARAMETER ZoomInLimit
    Sets the maximum zoom-in limit.

    .PARAMETER ZoomOutLimit
    Sets the maximum zoom-out limit.

    .PARAMETER Draggable
    Enables dragging and dropping nodes within the org chart. Note: This feature is not supported on Internet Explorer.

    .PARAMETER AllowExport
    Enables the export button for the org chart.

    .PARAMETER ExportFileName
    Specifies the filename when exporting the org chart as an image.

    .PARAMETER ExportExtension
    Specifies the format for exporting the org chart. Available values are "png" and "pdf".

    .PARAMETER ChartID
    Specifies a custom ID for the org chart. If not provided, a random ID will be generated.

    .EXAMPLE
    New-HTML {
        New-HTMLOrgChart {
            New-OrgChartNode -Name 'CEO' -Title 'Chief Executive Officer' {
                New-OrgChartNode -Name 'Manager' -Title 'Manager'
                New-OrgChartNode -Name 'Supervisor' -Title 'Supervisor'
                New-OrgChartNode -Name 'Employee' -Title 'Employee' {
                    New-OrgChartNode -Name 'Assistant' -Title 'Assistant'
                }
            }
        } -AllowExport -ExportExtension pdf -Draggable
    } -FilePath $PSScriptRoot\OrgChart.html -ShowHTML -Online

    .NOTES
    This function requires the PSWriteHTML module to be installed. For more information, visit: https://github.com/EvotecIT/PSWriteHTML
    #>
    [cmdletBinding()]
    param(
        [ScriptBlock] $ChartNodes,
        [ValidateSet("TopToBottom", "BottomToTop", "LeftToRight", "RightToLeft")][string] $Direction,
        [int] $VisileLevel,
        [int] $VerticalLevel,
        [string] $NodeTitle,
        [switch] $ToggleSiblings,
        [switch] $Pan,
        [switch] $Zoom,
        [double] $ZoomInLimit,
        [double] $ZoomOutLimit,
        [switch] $Draggable,
        [switch] $AllowExport,
        [string] $ExportFileName = 'PSWriteHTML-OrgChart',
        [ValidateSet('png', 'pdf')] $ExportExtension = 'png',
        [string] $ChartID
    )

    $DirectionDictionary = @{
        "TopToBottom" = 't2b'
        "BottomToTop" = 'b2t'
        "LeftToRight" = 'l2r'
        "RightToLeft" = 'r2l'
    }
    $Script:HTMLSchema.Features.MainFlex = $true
    $Script:HTMLSchema.Features.Jquery = $true
    $Script:HTMLSchema.Features.ChartsOrg = $true
    if ($ExportExtension -eq 'png' -and $AllowExport) {
        $Script:HTMLSchema.Features.ES6Promise = $true
        $Script:HTMLSchema.Features.ChartsOrgExportPNG = $true
    }
    if ($ExportExtension -eq 'pdf' -and $AllowExport) {
        $Script:HTMLSchema.Features.ES6Promise = $true
        $Script:HTMLSchema.Features.ChartsOrgExportPDF = $true
        $Script:HTMLSchema.Features.ChartsOrgExportPNG = $true
    }

    if (-not $ChartID) {
        $ChartID = "OrgChart-$(Get-RandomStringName -Size 8 -LettersOnly)"
    }

    if ($ChartNodes) {
        $DataSource = & $ChartNodes
    }

    $OrgChart = [ordered] @{
        data                = $DataSource
        nodeContent         = 'title'
        exportButton        = $AllowExport.IsPresent
        exportFileName      = $ExportFileName
        exportFileextension = $ExportExtension
    }
    if ($NodeTitle) {
        $OrgChart['nodeTitle'] = $NodeTitle
    }
    if ($Direction) {
        $OrgChart['direction'] = $DirectionDictionary[$Direction]
    }
    if ($Draggable) {
        $OrgChart['draggable'] = $Draggable.IsPresent
    }
    if ($VisileLevel) {
        # It indicates the level that at the very beginning orgchart is expanded to.
        $OrgChart['visibleLevel'] = $VisileLevel
    }
    if ($VerticalLevel) {
        # Users can make use of this option to align the nodes vertically from the specified level.
        $OrgChart['verticalLevel'] = $VerticalLevel
    }
    if ($ToggleSiblings) {
        # Once enable this option, users can show/hide left/right sibling nodes respectively by clicking left/right arrow.
        $OrgChart['toggleSiblingsResp'] = $ToggleSiblings.IsPresent
    }
    if ($Pan) {
        # Users could pan the orgchart by mouse drag&drop if they enable this option.
        $OrgChart['pan'] = $Pan.IsPresent
    }
    if ($Zoom) {
        # Users could zoomin/zoomout the orgchart by mouse wheel if they enable this option.
        $OrgChart['zoom'] = $Zoom.IsPresent
        if ($ZoomInLimit) {
            $OrgChart['zoominLimit'] = $ZoomInLimit
        }
        if ($ZoomOutLimit) {
            $OrgChart['zoomoutLimit'] = $ZoomOutLimit
        }
    }
    $JsonOrgChart = $OrgChart | ConvertTo-Json -Depth 100

    New-HTMLTag -Tag 'script' {
        "`$(function () {"
        "`$(`"#$ChartID`").orgchart($JsonOrgChart);"
        "});"
    }
    New-HTMLTag -Tag 'div' -Attributes @{ id = $ChartID; class = 'orgchartWrapper flexElement' }
}