function New-ChartToolbar {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [bool] $Show = $true,
        [bool] $Download = $true,
        [bool] $Selection = $true,
        [bool] $Zoom = $true,
        [bool] $ZoomIn = $true,
        [bool] $ZoomOut = $true,
        [bool] $Pan = $true,
        [bool] $Reset = $true
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
        autoSelected = 'zoom'
    }
}