function New-ChartInternalToolbar {
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