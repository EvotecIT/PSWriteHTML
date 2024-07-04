function New-ChartInternalMarker {
    <#
    .SYNOPSIS
    Creates a new internal marker for a chart.

    .DESCRIPTION
    This function creates a new internal marker for a chart based on the specified options.

    .PARAMETER Options
    Specifies the options for the internal marker.

    .PARAMETER MarkerSize
    Specifies the size of the marker.

    .EXAMPLE
    $markerOptions = @{
        color = 'red'
    }
    New-ChartInternalMarker -Options $markerOptions -MarkerSize 10
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [int] $MarkerSize
    )
    if ($MarkerSize -gt 0) {
        $Options.markers = @{
            size = $MarkerSize
        }
    }
}