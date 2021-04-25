function New-ChartRadialOptions {
    [CmdletBinding()]
    param(
        [parameter(ParameterSetName = 'CircleType')][ValidateSet('FullCircleTop', 'FullCircleBottom', 'FullCircleBottomLeft', 'FullCircleLeft', 'Speedometer', 'SemiCircleGauge')] $CircleType,
        [parameter(ParameterSetName = 'CustomAngle')][nullable[int]] $StartAngle,
        [parameter(ParameterSetName = 'CustomAngle')][nullable[int]] $EndAngle,
        [string] $HollowBackGroundColor,
        [string] $HollowMargin,
        [string] $HollowSize,
        [string] $TrackDropShadow,
        [string] $TrackDropShadowTop,
        [string] $TrackDropShadowLeft,
        [string] $TrackDropShadowBlur,
        [string] $TrackDropShadowOpacity,
        [string] $DataLabelNameOffsetY,
        [string] $DataLabelNameColor,
        [string] $DataLabelNameFontSize,
        [switch] $DataLabelValueShow,
        [string] $DataLabelValueColor,
        [string] $DataLabelValueFontSize,
        [string] $FillType,
        [string] $GradientShade,
        [string] $GradientType,
        [string] $GradientToColors,
        [Array] $GraidentStops,
        [string] $StrokeLineCap,
        [string[]] $Labels
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

<# https://apexcharts.com/docs/options/plotoptions/radialbar/
 plotOptions: {
      radialBar: {
          inverseOrder: false,
          startAngle: 0,
          endAngle: 360,
          offsetX: 0,
          offsetY: 0,
          hollow: {
              margin: 5,
              size: '50%',
              background: 'transparent',
              image: undefined,
              imageWidth: 150,
              imageHeight: 150,
              imageOffsetX: 0,
              imageOffsetY: 0,
              imageClipped: true,
              position: 'front',
              dropShadow: {
                enabled: false,
                top: 0,
                left: 0,
                blur: 3,
                opacity: 0.5
              }
          },
          track: {
              show: true,
              startAngle: undefined,
              endAngle: undefined,
              background: '#f2f2f2',
              strokeWidth: '97%',
              opacity: 1,
              margin: 5,
              dropShadow: {
                  enabled: false,
                  top: 0,
                  left: 0,
                  blur: 3,
                  opacity: 0.5
              }
          },
          dataLabels: {
              show: true,
              name: {
                  show: true,
                  fontSize: '16px',
                  fontFamily: undefined,
                  fontWeight: 600,
                  color: undefined,
                  offsetY: -10
                },
                value: {
                  show: true,
                  fontSize: '14px',
                  fontFamily: undefined,
                  fontWeight: 400,
                  color: undefined,
                  offsetY: 16,
                  formatter: function (val) {
                    return val + '%'
                  }
                },
                total: {
                  show: false,
                  label: 'Total',
                  color: '#373d3f',
                  fontSize: '16px',
                  fontFamily: undefined,
                  fontWeight: 600,
                  formatter: function (w) {
                    return w.globals.seriesTotals.reduce((a, b) => {
                      return a + b
                    }, 0) / w.globals.series.length + '%'
                  }
                }
          }
      }
  }
#>