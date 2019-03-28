function New-ChartRadialCircleType {
    param(
        [System.Collections.IDictionary] $Options,
        [ValidateSet('FullCircleTop', 'FullCircleBottom', 'FullCircleBottomLeft', 'FullCircleLeft', 'Speedometer')] $CircleType
    )
    if ($CircleType -eq 'FullCircleTop') {

    } elseif ($CircleType -eq 'FullCircleBottom') {
        $Options.plotOptions.radialBar = @{
            startAngle = -180
            endAngle   = 180
        }
    } elseif ($CircleType -eq 'FullCircleLeft') {
        $Options.plotOptions.radialBar = @{
            startAngle = -90
            endAngle   = 270
        }
    } elseif ($CircleType -eq 'FullCircleBottomLeft') {
        $Options.plotOptions.radialBar = @{
            startAngle = -135
            endAngle   = 225
        }
    } elseif ($CircleType -eq 'Speedometer') {
        $Options.plotOptions.radialBar = @{
            startAngle = -135
            endAngle   = 135
        }
    } else {

    }
}