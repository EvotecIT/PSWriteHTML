function New-ChartCategory {
    [alias('ChartCategory','ChartAxisX', 'New-ChartAxisX')]
    [CmdletBinding()]
    param(
        [Array] $Names
        #[ValidateSet('top', 'topRight', 'left', 'right', 'bottom', '')][string] $LegendPosition = '',
        # [RGBColors[]] $Color
    )
    [PSCustomObject] @{
        ObjectType = 'Category'
        Names      = $Names
        #   LegendPosition = $LegendPosition
        #   Color          = $Color
    }
}