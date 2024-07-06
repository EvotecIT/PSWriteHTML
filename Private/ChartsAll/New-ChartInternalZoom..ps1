function New-ChartInternalZoom {
    <#
    .SYNOPSIS
    Creates a new internal zoom feature for a chart.

    .DESCRIPTION
    This function creates a new internal zoom feature for a chart with the specified options. The zoom feature allows users to zoom in on specific areas of the chart for a closer look.

    .PARAMETER Options
    Specifies the options for the zoom feature.

    .PARAMETER Enabled
    Indicates whether the zoom feature is enabled.

    .EXAMPLE
    $zoomOptions = @{}
    New-ChartInternalZoom -Options $zoomOptions -Enabled $true
    # Enables the zoom feature for the chart.

    .EXAMPLE
    $zoomOptions = @{}
    New-ChartInternalZoom -Options $zoomOptions -Enabled $false
    # Disables the zoom feature for the chart.
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [switch] $Enabled
    )
    if ($Enabled) {
        $Options.chart.zoom = @{
            type    = 'x'
            enabled = $Enabled.IsPresent
        }
    }
}