function New-ChartInternalToolbar {
    <#
    .SYNOPSIS
    Creates a new internal toolbar for a chart with specified options.

    .DESCRIPTION
    This function creates a new internal toolbar for a chart with the specified options. The toolbar can include tools for showing, downloading, selecting, zooming, panning, and resetting the chart.

    .PARAMETER Options
    The options for configuring the internal toolbar.

    .PARAMETER Show
    Indicates whether the toolbar should be shown. Default is $false.

    .PARAMETER Download
    Indicates whether the download tool should be included in the toolbar. Default is $false.

    .PARAMETER Selection
    Indicates whether the selection tool should be included in the toolbar. Default is $false.

    .PARAMETER Zoom
    Indicates whether the zoom tool should be included in the toolbar. Default is $false.

    .PARAMETER ZoomIn
    Indicates whether the zoom in tool should be included in the toolbar. Default is $false.

    .PARAMETER ZoomOut
    Indicates whether the zoom out tool should be included in the toolbar. Default is $false.

    .PARAMETER Pan
    Indicates whether the pan tool should be included in the toolbar. Default is $false.

    .PARAMETER Reset
    Indicates whether the reset tool should be included in the toolbar. Default is $false.

    .PARAMETER AutoSelected
    Specifies the default tool to be auto-selected. Valid values are 'zoom', 'selection', or 'pan'. Default is 'zoom'.

    .EXAMPLE
    New-ChartInternalToolbar -Options $Options -Show $true -Download $true -Selection $true -Zoom $true -ZoomIn $true -ZoomOut $true -Pan $true -Reset $true -AutoSelected 'zoom'
    Creates a new internal toolbar with all tools enabled and the zoom tool auto-selected.

    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [bool] $Show = $false,
        [bool] $Download = $false,
        [bool] $Selection = $false,
        [bool] $Zoom = $false,
        [bool] $ZoomIn = $false,
        [bool] $ZoomOut = $false,
        [bool] $Pan = $false,
        [bool] $Reset = $false,
        [ValidateSet('zoom', 'selection', 'pan')][string] $AutoSelected = 'zoom'
    )
    $Options.chart.toolbar = [ordered] @{
        show         = $show
        tools        = [ordered] @{
            download  = $Download
            selection = $Selection
            zoom      = $Zoom
            zoomin    = $ZoomIn
            zoomout   = $ZoomOut
            pan       = $Pan
            reset     = $Reset
        }
        autoSelected = $AutoSelected
    }
}