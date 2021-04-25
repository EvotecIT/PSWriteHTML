function New-ChartRadialOptions {
    [CmdletBinding()]
    param(
        [parameter(ParameterSetName = 'CircleType')][ValidateSet('FullCircleTop', 'FullCircleBottom', 'FullCircleBottomLeft', 'FullCircleLeft', 'Speedometer', 'SemiCircleGauge')] $CircleType,
        [parameter(ParameterSetName = 'CustomAngle')][nullable[int]] $StartAngle,
        [parameter(ParameterSetName = 'CustomAngle')][nullable[int]] $EndAngle
    )

    $Object = [PSCustomObject]@{
        ObjectType  = 'RadialOptions'
        plotOptions = @{
            radialBar = [ordered] @{

            }
        }
    }
    if ($null -ne $StartAngle -and $null -ne $EndAngle) {
        $Object.plotOptions.radialBar = [ordered] @{
            startAngle = $StartAngle
            endAngle   = $EndAngle
        }
    } else {
        if ($CircleType -eq 'SemiCircleGauge') {
            $Object.plotOptions.radialBar = [ordered] @{
                startAngle = -90
                endAngle   = 90
            }
        } elseif ($CircleType -eq 'FullCircleBottom') {
            $Object.plotOptions.radialBar = [ordered] @{
                startAngle = -180
                endAngle   = 180
            }
        } elseif ($CircleType -eq 'FullCircleLeft') {
            $Object.plotOptions.radialBar = [ordered] @{
                startAngle = -90
                endAngle   = 270
            }
        } elseif ($CircleType -eq 'FullCircleBottomLeft') {
            $Object.plotOptions.radialBar = [ordered] @{
                startAngle = -135
                endAngle   = 225
            }
        } elseif ($CircleType -eq 'Speedometer') {
            $Object.plotOptions.radialBar = [ordered] @{
                startAngle = -135
                endAngle   = 135
            }
        }
    }
    $Object
}