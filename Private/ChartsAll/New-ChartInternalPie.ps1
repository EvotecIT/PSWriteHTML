function New-ChartInternalPie {
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