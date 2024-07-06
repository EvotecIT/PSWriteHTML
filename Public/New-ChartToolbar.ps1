function New-ChartToolbar {
    <#
    .SYNOPSIS
    Creates a new chart toolbar object with customizable options.

    .DESCRIPTION
    This function defines a chart toolbar object with various tools such as download, selection, zoom, zoom in, zoom out, pan, and reset. It allows customization of the toolbar appearance and behavior.

    .PARAMETER Download
    Switch parameter to enable the download tool in the toolbar.

    .PARAMETER Selection
    Switch parameter to enable the selection tool in the toolbar.

    .PARAMETER Zoom
    Switch parameter to enable the zoom tool in the toolbar.

    .PARAMETER ZoomIn
    Switch parameter to enable the zoom in tool in the toolbar.

    .PARAMETER ZoomOut
    Switch parameter to enable the zoom out tool in the toolbar.

    .PARAMETER Pan
    Switch parameter to enable the pan tool in the toolbar.

    .PARAMETER Reset
    Switch parameter to enable the reset tool in the toolbar.

    .PARAMETER AutoSelected
    Specifies the default tool to be auto-selected when the toolbar is loaded. Valid values are 'zoom', 'selection', or 'pan'. Default is 'zoom'.

    .EXAMPLE
    New-ChartToolbar -Download -Selection -Zoom -ZoomIn -ZoomOut -Pan -Reset -AutoSelected 'zoom'
    Creates a new chart toolbar object with all tools enabled and the default tool set to zoom.

    .EXAMPLE
    New-ChartToolbar -Download -Zoom -ZoomOut -Pan -AutoSelected 'pan'
    Creates a new chart toolbar object with download, zoom, zoom out, and pan tools enabled, and the default tool set to pan.
    #>
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