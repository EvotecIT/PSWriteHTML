function New-HTMLChartBar {
    [CmdletBinding()]
    param(
        [nullable[int]] $Height = 350,
        [nullable[int]] $Width,
        [ValidateSet('', 'central')][string] $Positioning,
        [ValidateSet('bar', 'barStacked', 'barStacked100Percent')] $Type = 'bar',
        [RGBColors[]] $Colors,

        [switch] $PatternedColors,

        [string] $Title,
        [ValidateSet('center', 'left', 'right', '')][string] $TitleAlignment = '',

        [bool] $Horizontal = $true,
        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [nullable[RGBColors]] $DataLabelsColor,

        [switch] $Distributed,

        [ValidateSet('top', 'topRight', 'left', 'right', 'bottom', '')][string] $LegendPosition = '',

        [Array] $Data,
        [Array] $DataNames,
        [Array] $DataLegend
    )
    $Options = [ordered] @{ }
    New-ChartInternalBar -Options $Options -Horizontal $Horizontal -DataLabelsEnabled $DataLabelsEnabled `
        -DataLabelsOffsetX $DataLabelsOffsetX -DataLabelsFontSize $DataLabelsFontSize -DataLabelsColor $DataLabelsColor `
        -Data $Data -DataNames $DataNames -DataLegend $DataLegend -Title $Title -TitleAlignment $TitleAlignment `
        -Type $Type -Colors $Colors `
        -PatternedColors:$PatternedColors -Distributed:$Distributed


    New-ChartInternalLegend -Options $Options -LegendPosition $LegendPosition
    New-ChartInternalSize -Options $Options -Height $Height -Width $Width
    New-ChartInternalToolbar -Options $Options
    New-ApexChart -Positioning $Positioning -Options $Options
}