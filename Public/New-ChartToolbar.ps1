function New-ChartToolbar {
    [alias('ChartToolbar')]
    [CmdletBinding()]
    param(
        [switch] $Download,
        [switch] $Selection,
        [switch] $Zoom,
        [switch] $ZoomIn,
        [switch] $ZoomOut,
        [switch] $Pan,
        [switch] $Reset,
        [ValidateSet('zoom', 'selection', 'pan')][string] $AutoSelected = 'zoom'
    )

    [PSCustomObject] @{
        ObjectType = 'Toolbar'
        Toolbar    = @{
            #Show         = $Show.IsPresent
            #tools        = [ordered] @{
            download     = $Download.IsPresent
            selection    = $Selection.IsPresent
            zoom         = $Zoom.IsPresent
            zoomin       = $ZoomIn.IsPresent
            zoomout      = $ZoomOut.IsPresent
            pan          = $Pan.IsPresent
            reset        = $Reset.IsPresent
            #}
            autoSelected = $AutoSelected
        }
    }
}