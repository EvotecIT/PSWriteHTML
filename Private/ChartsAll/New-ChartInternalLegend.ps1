function New-ChartInternalLegend {
    <#
    .SYNOPSIS
    Creates a new internal legend configuration for a chart with the specified position settings.

    .DESCRIPTION
    This function creates a new internal legend configuration for a chart with the provided position options. It allows customization of the legend position and alignment.

    .PARAMETER Options
    Specifies the options for configuring the internal legend. This should be a dictionary containing the necessary settings for the legend.

    .PARAMETER LegendPosition
    Specifies the position of the legend on the chart. Valid values are 'top', 'topRight', 'left', 'right', 'bottom', or 'default'.

    .EXAMPLE
    $legendOptions = @{
        LegendPosition = 'right'
    }
    New-ChartInternalLegend -Options $legendOptions

    Creates a new internal legend configuration with the legend positioned on the right side of the chart with specific offset and height settings.
    #>
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