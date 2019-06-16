function New-HTMLChartRadial {
    [CmdletBinding()]
    param(
        [nullable[int]] $Height = 350,
        [nullable[int]] $Width,
        [ValidateSet('default', 'central')][string] $Positioning,
        [Array] $Names,
        [Array] $Values,
        $Type,
        [ValidateSet('FullCircleTop', 'FullCircleBottom', 'FullCircleBottomLeft', 'FullCircleLeft', 'Speedometer', 'SemiCircleGauge')] $CircleType = 'FullCircleTop',
        [string] $LabelAverage
    )

    $Options = [ordered] @{}

    New-ChartInternalRadial -Options $Options -Names $Names -Values $Values -Type $Type
    # This controls how the circle starts / left , right and so on
    New-ChartInternalRadialCircleType -Options $Options -CircleType $CircleType
    # This added label. It's useful if there's more then one data
    New-ChartInternalRadialDataLabels -Options $Options -Label $LabelAverage
    New-ChartInternalSize -Options $Options -Height $Height -Width $Width
    New-ChartInternalToolbar -Options $Options
    New-ApexChart -Positioning $Positioning -Options $Options
}