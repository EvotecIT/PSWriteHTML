function New-HTMLChartRadial {
    [CmdletBinding()]
    param(
        [nullable[int]] $Height = 350,
        [nullable[int]] $Width,
        [ValidateSet('', 'central')][string] $Positioning,
        [Array] $Names,
        [Array] $Values,
        $Type,
        [ValidateSet('FullCircleTop', 'FullCircleBottom', 'FullCircleBottomLeft', 'FullCircleLeft', 'Speedometer', 'SemiCircleGauge')] $CircleType = 'FullCircleTop',
        [string] $LabelAverage
    )

    $Options = [ordered] @{}

    New-ChartRadial -Options $Options -Names $Names -Values $Values -Type $Type
    # This controls how the circle starts / left , right and so on
    New-ChartRadialCircleType -Options $Options -CircleType $CircleType
    # This added label. It's useful if there's more then one data
    New-ChartRadialDataLabels -Options $Options -Label $LabelAverage
    New-ChartSize -Options $Options -Height $Height -Width $Width
    New-ChartToolbar -Options $Options
    New-ApexChart -Positioning $Positioning -Options $Options
}