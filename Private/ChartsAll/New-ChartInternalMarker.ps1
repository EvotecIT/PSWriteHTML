function New-ChartInternalMarker {
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