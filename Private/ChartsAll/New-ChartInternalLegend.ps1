function New-ChartInternalLegend {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [ValidateSet('top', 'topRight', 'left', 'right', 'bottom', 'default')][string] $LegendPosition = 'default'
    )
    # legend
    if ($LegendPosition -eq 'default' -or $LegendPosition -eq 'bottom') {
        # Do nothing
    } elseif ($LegendPosition -eq 'right') {
        $Options.legend = [ordered]@{
            position = 'right'
            offsetY  = 100
            height   = 230
        }
    } elseif ($LegendPosition -eq 'top') {
        $Options.legend = [ordered]@{
            position        = 'top'
            horizontalAlign = 'left'
            offsetX         = 40
        }
    } elseif ($LegendPosition -eq 'topRight') {
        $Options.legend = [ordered]@{
            position        = 'top'
            horizontalAlign = 'right'
            floating        = $true
            offsetY         = -25
            offsetX         = -5
        }
    }
}