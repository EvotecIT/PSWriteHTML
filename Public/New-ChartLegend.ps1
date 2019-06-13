function New-ChartLegend {
    [alias('ChartLegend')]
    [CmdletBinding()]
    param(
        [Array] $Names,
        [ValidateSet('top', 'topRight', 'left', 'right', 'bottom', '')][string] $LegendPosition = ''
    )
    [PSCustomObject] @{
        ObjectType     = 'Legend'
        Names          = $Names
        LegendPosition = $LegendPosition
    }
}
