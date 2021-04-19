function New-ChartInternalRadial {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [Array] $Values,
        [Array] $Names,
        $Type
    )
    # Chart defintion type, size
    $Options.chart.type = 'radialBar'


    if ($Type -eq '1') {
        New-ChartInternalRadialType1 -Options $Options
    } elseif ($Type -eq '2') {
        New-ChartInternalRadialType2 -Options $Options
    }

    $Options.series = @($Values)
    $Options.labels = @($Names)


}