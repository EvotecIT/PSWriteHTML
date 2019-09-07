function New-ChartLegend {
    [alias('ChartLegend')]
    [CmdletBinding()]
    param(
        [Array] $Names,
        [ValidateSet('top', 'topRight', 'left', 'right', 'bottom', 'default')][string] $LegendPosition = 'default',
        [RGBColors[]] $Color
    )

    #$Colors = [System.Collections.Generic.List[RGBColors]]::new()
    #foreach ($_ in $Color) {
    #    $Colors.Add($Color)
    #}
    [PSCustomObject] @{
        ObjectType     = 'Legend'
        Names          = $Names
        LegendPosition = $LegendPosition
        Color          = $Color
    }
}