function New-ChartInternalZoom {
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