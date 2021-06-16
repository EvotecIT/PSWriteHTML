function New-ChartDesign {
    <#
    .SYNOPSIS
    Configures charts gradient, image, pattern and dropShadow options

    .DESCRIPTION
    Long description

    .PARAMETER GradientShade
    Available options for gradient shade

    .PARAMETER GradientType
    Available options for gradient type

    .PARAMETER GradientShadeIntensity
    Intensity of the gradient shade

    .PARAMETER GradientGradientToColors
    Optional colors that ends the gradient to.
    The main colors array becomes the gradientFromColors and this array becomes the end colors of the gradient.
    Each index in the array corresponds to the series-index.

    .PARAMETER GradientInverseColors
    Inverse the start and end colors of the gradient.

    .PARAMETER GradientOpacityFrom
    Start color's opacity. If you want different opacity for different series, you can pass an array of numbers.

    .PARAMETER GradientOpacityTo
    End color's opacity. If you want different opacity for different series, you can pass an array of numbers.

    .PARAMETER GradientStops
    Stops defines the ramp of colors to use on a gradient

    .PARAMETER ImageSource
    Accepts an array of image paths which will correspond to each series.

    .PARAMETER ImageWidth
    Width of each image for all the series

    .PARAMETER ImageHeight
    Height of each image for all the series

    .PARAMETER PatternStyle
    Available pattern styles

    .PARAMETER PatternWidth
    Pattern width which will be repeated at this interval

    .PARAMETER PatternHeight
    Pattern height which will be repeated at this interval

    .PARAMETER PatternStrokeWidth
    Pattern lines width indicates the thickness of the stroke of pattern.

    .PARAMETER DropShadowEnabled
    Enable a dropshadow for paths of the SVG

    .PARAMETER DropShadowEnabledOnSries
    Provide series index on which the dropshadow should be enabled.

    .PARAMETER DropShadowTop
    Set top offset for shadow

    .PARAMETER DropShadowLeft
    Set left offset for shadow

    .PARAMETER DropShadowColor
    Give a color to the shadow. If array is provided, each series can have different shadow color

    .PARAMETER DropShadowBlur
    Set blur distance for shadow

    .PARAMETER DropShadowOpacity
    Set the opacity of shadow

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [alias('New-ChartFill')]
    [CmdletBinding()]
    param(
        [string][ValidateSet('light', 'dark')]$GradientShade,
        [string][ValidateSet('horizontal', 'vertical', 'diagonal1', 'diagonal2')]$GradientType,
        [nullable[float]] $GradientShadeIntensity,
        $GradientGradientToColors,
        [switch] $GradientInverseColors,
        [float[]] $GradientOpacityFrom,
        [float[]] $GradientOpacityTo,
        $GradientStops,
        [string[]] $ImageSource,
        [string[]] $ImageWidth,
        [string[]] $ImageHeight,
        [string][ValidateSet('verticalLines', 'horizontalLines', 'slantedLines', 'squares', 'circles')] $PatternStyle,
        [string] $PatternWidth,
        [string] $PatternHeight,
        [string] $PatternStrokeWidth,
        [switch] $DropShadowEnabled,
        [Array] $DropShadowEnabledOnSries,
        [nullable[int]]$DropShadowTop,
        [string[]] $DropShadowColor,
        [nullable[int]] $DropShadowLeft,
        [nullable[int]] $DropShadowBlur,
        [nullable[float]] $DropShadowOpacity
    )


    $Object = [PSCustomObject] @{
        ObjectType = 'Fill'
        Design     = @{
            fill       = [ordered] @{
                gradient = [ordered] @{

                }
                image    = [ordered] @{

                }
                pattern  = [ordered] @{

                }
            }
            dropShadow = [ordered] @{

            }
        }
    }




    # DropShadow
    if ($DropShadowEnabled) {
        $Object.Design.dropShadow.enabled = $true
    }
    if ($DropShadowEnabledOnSries) {
        $Object.Design.dropShadow.enabledOnSeries = $DropShadowEnabledOnSries
    }
    if ($null -ne $DropShadowTop) {
        $Object.Design.dropShadow.top = $DropShadowTop
    }
    if ($null -ne $DropShadowLeft) {
        $Object.Design.dropShadow.left = $DropShadowLeft
    }
    if ($DropShadowColor) {
        $Object.Design.dropShadow.color = $DropShadowColor
    }
    if ($null -ne $DropShadowBlur) {
        $Object.Design.dropShadow.blur = $DropShadowBlur
    }
    if ($null -ne $DropShadowOpacity) {
        $Object.Design.dropShadow.opacity = $DropShadowOpacity
    }
    $Object
}

Register-ArgumentCompleter -CommandName New-ChartDesign -ParameterName DropShadowColor -ScriptBlock $Script:ScriptBlockColors

<#
fill: {
  type: 'gradient',
  gradient: {
    shade: 'dark',
    type: "horizontal",
    shadeIntensity: 0.5,
    gradientToColors: undefined, // optional, if not defined - uses the shades of same color in series
    inverseColors: true,
    opacityFrom: 1,
    opacityTo: 1,
    stops: [0, 50, 100],
    colorStops: []
  }
}

fill: {
  type: 'image',
  image: {
    src: ['/path/to/image1.png', 'path/to/image2.jpg'],
    width: undefined,  // optional
    height: undefined  //optional
  }
}

fill: {
  type: 'pattern',
  pattern: {
    style: 'verticalLines',
    width: 6,
    height: 6,
    strokeWidth: 2
  }
}

dropShadow: {
  enabled: true,
  top: 0,
  left: 0,
  blur: 3,
  opacity: 0.5
}
#>
