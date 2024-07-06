function New-ChartRadialOptions {
    <#
    .SYNOPSIS
    Creates customizable options for a radial chart.

    .DESCRIPTION
    This function defines various customizable options for a radial chart, such as circle type, angles, colors, shadows, labels, gradients, and more.

    .PARAMETER CircleType
    Specifies the type of circle for the radial chart. Valid values are 'FullCircleTop', 'FullCircleBottom', 'FullCircleBottomLeft', 'FullCircleLeft', 'Speedometer', 'SemiCircleGauge'.

    .PARAMETER StartAngle
    Specifies the starting angle for the radial chart.

    .PARAMETER EndAngle
    Specifies the ending angle for the radial chart.

    .PARAMETER HollowBackGroundColor
    Specifies the color for the hollow background of the radial chart.

    .PARAMETER HollowMargin
    Specifies the margin for the hollow area of the radial chart.

    .PARAMETER HollowSize
    Specifies the size of the hollow area in the radial chart.

    .PARAMETER TrackDropShadow
    Specifies the drop shadow for the track of the radial chart.

    .PARAMETER TrackDropShadowTop
    Specifies the top shadow for the track of the radial chart.

    .PARAMETER TrackDropShadowLeft
    Specifies the left shadow for the track of the radial chart.

    .PARAMETER TrackDropShadowBlur
    Specifies the blur effect for the drop shadow of the track in the radial chart.

    .PARAMETER TrackDropShadowOpacity
    Specifies the opacity of the drop shadow for the track in the radial chart.

    .PARAMETER DataLabelNameOffsetY
    Specifies the Y-axis offset for the data label name in the radial chart.

    .PARAMETER DataLabelNameColor
    Specifies the color for the data label name in the radial chart.

    .PARAMETER DataLabelNameFontSize
    Specifies the font size for the data label name in the radial chart.

    .PARAMETER DataLabelValueShow
    Indicates whether to show the data label value in the radial chart.

    .PARAMETER DataLabelValueColor
    Specifies the color for the data label value in the radial chart.

    .PARAMETER DataLabelValueFontSize
    Specifies the font size for the data label value in the radial chart.

    .PARAMETER FillType
    Specifies the fill type for the radial chart.

    .PARAMETER GradientShade
    Specifies the shade for the gradient in the radial chart.

    .PARAMETER GradientType
    Specifies the type of gradient for the radial chart.

    .PARAMETER GradientToColors
    Specifies the colors for the gradient in the radial chart.

    .PARAMETER GraidentStops
    Specifies the gradient stops for the radial chart.

    .PARAMETER StrokeLineCap
    Specifies the line cap for the stroke in the radial chart.

    .PARAMETER Labels
    Specifies an array of labels for the radial chart.

    .EXAMPLE
    New-ChartRadialOptions -CircleType 'FullCircleTop' -StartAngle 0 -EndAngle 180 -HollowBackGroundColor 'white' -HollowMargin '10px' -HollowSize '50%' -TrackDropShadow 'black' -TrackDropShadowTop '2px' -TrackDropShadowLeft '2px' -TrackDropShadowBlur '5px' -TrackDropShadowOpacity '0.5' -DataLabelNameOffsetY '20px' -DataLabelNameColor 'black' -DataLabelNameFontSize '12px' -DataLabelValueShow -DataLabelValueColor 'red' -DataLabelValueFontSize '14px' -FillType 'solid' -GradientShade 'dark' -GradientType 'vertical' -GradientToColors @('red', 'blue') -GraidentStops @('0%', '100%') -StrokeLineCap 'round' -Labels @('Label1', 'Label2')

    Creates customizable options for a radial chart with specified parameters.

    #>
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