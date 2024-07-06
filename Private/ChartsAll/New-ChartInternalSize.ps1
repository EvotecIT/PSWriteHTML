function New-ChartInternalSize {
    <#
    .SYNOPSIS
    Creates a new chart with specified height and width.

    .DESCRIPTION
    This function creates a new chart with the specified height and width values.

    .PARAMETER Options
    The options for the chart.

    .PARAMETER Height
    The height of the chart. Default is 350.

    .PARAMETER Width
    The width of the chart.

    .EXAMPLE
    $chartOptions = @{
        chart = @{
            type = 'bar'
        }
    }
    New-ChartInternalSize -Options $chartOptions -Height 400 -Width 600
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [nullable[int]] $Height = 350,
        [nullable[int]] $Width
    )
    if ($null -ne $Height) {
        $Options.chart.height = $Height
    }
    if ($null -ne $Width) {
        $Options.chart.width = $Width
    }
}