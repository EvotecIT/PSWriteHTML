function New-ChartRadialCircleType {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [ValidateSet('FullCircleTop', 'FullCircleBottom', 'FullCircleBottomLeft', 'FullCircleLeft', 'Speedometer', 'SemiCircleGauge')] $CircleType
    )
    if ($CircleType -eq 'SemiCircleGauge') {
        $Options.plotOptions.radialBar = [ordered] @{
            startAngle = -90
            endAngle   = 90
        }
    } elseif ($CircleType -eq 'FullCircleBottom') {
        $Options.plotOptions.radialBar = [ordered] @{
            startAngle = -180
            endAngle   = 180
        }
    } elseif ($CircleType -eq 'FullCircleLeft') {
        $Options.plotOptions.radialBar = [ordered] @{
            startAngle = -90
            endAngle   = 270
        }
    } elseif ($CircleType -eq 'FullCircleBottomLeft') {
        $Options.plotOptions.radialBar = [ordered] @{
            startAngle = -135
            endAngle   = 225
        }
    } elseif ($CircleType -eq 'Speedometer') {
        $Options.plotOptions.radialBar = [ordered] @{
            startAngle = -135
            endAngle   = 135
        }
    } else {
        #FullCircleTop
    }
}