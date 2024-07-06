function New-ChartInternalPie {
    <#
    .SYNOPSIS
    Creates a new internal pie chart.

    .DESCRIPTION
    This function creates a new internal pie chart based on the provided options, values, names, and type.

    .PARAMETER Options
    The options for the pie chart.

    .PARAMETER Values
    An array of values for the pie chart.

    .PARAMETER Names
    An array of names for the pie chart.

    .PARAMETER Type
    The type of the pie chart.

    .EXAMPLE
    New-ChartInternalPie -Options @{ chart = @{ type = "pie" } } -Values @(10, 20, 30) -Names @("A", "B", "C") -Type "pie"
    Creates a new internal pie chart with values 10, 20, 30 and names A, B, C.

    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [Array] $Values,
        [Array] $Names,
        [string] $Type
    )
    # Chart defintion type, size
    $Options.chart.type = $Type.ToLower()
    $Options.series = @($Values)
    $Options.labels = @($Names)
}