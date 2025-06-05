﻿function New-HTMLGage {
    <#
    .SYNOPSIS
    Creates a new HTML gauge with customizable options.

    .DESCRIPTION
    This function creates a new HTML gauge with various customizable options such as type, colors, fonts, values, and more.

    .PARAMETER GageContent
    The content of the gauge.

    .PARAMETER Type
    Specifies the type of gauge to create. Valid values are 'Gage' and 'Donut'. Default is 'Gage'.

    .PARAMETER BackgroundGaugageColor
    The background color of the gauge.

    .PARAMETER Value
    The value to display on the gauge. This parameter is mandatory.

    .PARAMETER ValueSymbol
    The symbol to display with the value.

    .PARAMETER ValueColor
    The color of the value displayed on the gauge.

    .PARAMETER ValueFont
    The font of the value displayed on the gauge.

    .PARAMETER MinValue
    The minimum value of the gauge.

    .PARAMETER MinText
    The text to display for the minimum value.

    .PARAMETER MaxValue
    The maximum value of the gauge.

    .PARAMETER MaxText
    The text to display for the maximum value.

    .PARAMETER Reverse
    Indicates whether the gauge should be displayed in reverse.

    .PARAMETER DecimalNumbers
    The number of decimal places to display.

    .PARAMETER GaugageWidth
    The width of the gauge.

    .PARAMETER Label
    The label to display on the gauge.

    .PARAMETER LabelColor
    The color of the label.

    .PARAMETER Counter
    Indicates whether a counter should be displayed.

    .PARAMETER ShowInnerShadow
    Indicates whether an inner shadow should be displayed.

    .PARAMETER NoGradient
    Indicates whether gradient should be disabled.

    .PARAMETER ShadowOpacity
    The opacity of the shadow.

    .PARAMETER ShadowSize
    The size of the shadow.

    .PARAMETER ShadowVerticalOffset
    The vertical offset of the shadow.

    .PARAMETER Pointer
    Indicates whether a pointer should be displayed.

    .PARAMETER PointerTopLength
    The length of the top of the pointer.

    .PARAMETER PointerBottomLength
    The length of the bottom of the pointer.

    .PARAMETER PointerBottomWidth
    The width of the bottom of the pointer.

    .PARAMETER StrokeColor
    The color of the stroke.

    .PARAMETER PointerStrokeWidth
    The width of the pointer stroke.

    .PARAMETER PointerStrokeLinecap
    The linecap style of the pointer stroke. Valid values are 'none', 'square', 'round'.

    .PARAMETER PointerColor
    The color of the pointer.

    .PARAMETER HideValue
    Indicates whether the value should be hidden.

    .PARAMETER HideMinMax
    Indicates whether the min/max values should be hidden.

    .PARAMETER FormatNumber
    Indicates whether the number should be formatted.

    .PARAMETER DisplayRemaining
    Indicates whether the remaining value should be displayed.

    .PARAMETER HumanFriendly
    Indicates whether the value should be displayed in a human-friendly format.

    .PARAMETER HumanFriendlyDecimal
    The number of decimal places to display in human-friendly format.

    .PARAMETER SectorColors
    An array of colors to use for different sectors of the gauge.

    .PARAMETER UseAbsoluteValues
    Indicates whether to use absolute values for custom sectors.
    By default, it uses percentage values.

    .EXAMPLE
    New-HTMLGage -Value 75 -Label "Progress" -Type "Donut" -MinValue 0 -MaxValue 100 -SectorColors @("red", "yellow", "green")

    Creates a new donut gauge with a value of 75, labeled as "Progress", with a range from 0 to 100, and sector colors red, yellow, and green.

    #>
    [CmdletBinding()]
    param (
        [scriptblock] $GageContent,
        [validateSet('Gage', 'Donut')][string] $Type = 'Gage',
        [string] $BackgroundGaugageColor,
        [parameter(Mandatory)][decimal] $Value,
        [string] $ValueSymbol,
        [string] $ValueColor,
        [string] $ValueFont,
        [nullable[int]] $MinValue,
        [string] $MinText,
        [nullable[int]] $MaxValue,
        [string] $MaxText,
        [switch] $Reverse,
        [int] $DecimalNumbers,
        [decimal] $GaugageWidth,
        [string] $Label,
        [string] $LabelColor,
        [switch] $Counter,
        [switch] $ShowInnerShadow,
        [switch] $NoGradient,
        [nullable[decimal]] $ShadowOpacity,
        [nullable[int]] $ShadowSize,
        [nullable[int]] $ShadowVerticalOffset,
        [switch] $Pointer,
        [nullable[int]]  $PointerTopLength,
        [nullable[int]] $PointerBottomLength,
        [nullable[int]] $PointerBottomWidth,
        [string] $StrokeColor,
        #[validateSet('none')][string] $PointerStroke,
        [nullable[int]] $PointerStrokeWidth,
        [validateSet('none', 'square', 'round')] $PointerStrokeLinecap,
        [string] $PointerColor,
        [switch] $HideValue,
        [switch] $HideMinMax,
        [switch] $FormatNumber,
        [switch] $DisplayRemaining,
        [switch] $HumanFriendly,
        [int] $HumanFriendlyDecimal,
        [string[]] $SectorColors,
        [switch] $UseAbsoluteValues
    )
    # Make sure JustGage JS is added to source
    $Script:HTMLSchema.Features.MainFlex = $true
    $Script:HTMLSchema.Features.Raphael = $true
    $Script:HTMLSchema.Features.JustGage = $true

    # Build Options
    [string] $ID = "Gage" + (Get-RandomStringName -Size 8)
    $Gage = [ordered] @{
        id    = $ID
        value = $Value
    }

    # When null it will be removed as part of cleanup Remove-EmptyValue
    $Gage.shadowSize = $ShadowSize
    $Gage.shadowOpacity = $ShadowOpacity
    $Gage.shadowVerticalOffset = $ShadowVerticalOffset

    if ($DecimalNumbers) {
        $Gage.decimals = $DecimalNumbers
    }
    if ($ValueColor) {
        $Gage.valueFontColor = $ValueColor
    }
    if ($ValueColor) {
        $Gage.valueFontFamily = $ValueFont
    }
    if ($MinText) {
        $Gage.minText = $MinText
    }
    if ($MaxText) {
        $Gage.maxText = $MaxText
    }

    $Gage.min = $MinValue
    $Gage.max = $MaxValue

    if ($Label) {
        $Gage.label = $Label
    }
    if ($LabelColor) {
        $Gage.labelFontColor = ConvertFrom-Color -Color $LabelColor
    }
    if ($Reverse) {
        $Gage.reverse = $Reverse.IsPresent
    }
    if ($Type -eq 'Donut') {
        $Gage.donut = $true
    }
    if ($GaugageWidth) {
        $Gage.gaugageWidthScale = $GaugageWidthScale
    }
    if ($Counter) {
        $Gage.counter = $Counter.IsPresent
    }
    if ($showInnerShadow) {
        $Gage.showInnerShadow = $ShowInnerShadow.IsPresent
    }
    if ($BackgroundGaugageColor) {
        $Gage.gaugeColor = ConvertFrom-Color -Color $BackgroundGaugageColor
    }
    if ($NoGradient) {
        $Gage.noGradient = $NoGradient.IsPresent
    }

    if ($HideMinMax) {
        $Gage.hideMinMax = $HideMinMax.IsPresent
    }
    if ($HideValue) {
        $Gage.hideValue = $HideValue.IsPresent
    }
    if ($FormatNumber) {
        $Gage.formatNumber = $FormatNumber.IsPresent
    }
    if ($DisplayRemaining) {
        $Gage.displayRemaining = $DisplayRemaining.IsPresent
    }
    if ($HumanFriendly) {
        $Gage.humanFriendly = $HumanFriendly.IsPresent
        if ($HumanFriendlyDecimal) {
            $Gage.humanFriendlyDecimal = $HumanFriendlyDecimal
        }
    }
    if ($ValueSymbol) {
        $Gage.symbol = $ValueSymbol
    }

    if ($GageContent) {
        [Array] $GageOutput = & $GageContent
        if ($GageOutput.Count -gt 0) {
            $Gage.customSectors = @{
                percents = -not $UseAbsoluteValues
                ranges   = $GageOutput
            }
        }
    }



    if ($Pointer) {
        $Gage.pointer = $Pointer.IsPresent

        $Gage.pointerOptions = @{ }
        #if ($PointerToplength) {
        $Gage.pointerOptions.toplength = $PointerTopLength
        #}
        #if ($PointerBottomLength) {
        $Gage.pointerOptions.bottomlength = $PointerBottomLength
        #}
        #if ($PointerBottomWidth) {
        $Gage.pointerOptions.bottomwidth = $PointerBottomWidth
        #}
        #if ($PointerStroke) {

        #}
        #if ($PointerStrokeWidth) {
        $Gage.pointerOptions.stroke_width = $PointerStrokeWidth
        #}
        #if ($PointerStrokeLinecap) {
        $Gage.pointerOptions.stroke_linecap = $PointerStrokeLinecap
        #}
        #if ($PointerColor) {
        $Gage.pointerOptions.color = ConvertFrom-Color -Color $PointerColor
        #}
        #if ($StrokeColor) {
        $Gage.pointerOptions.stroke = ConvertFrom-Color -Color $StrokeColor
        #}
    }
    $gage.relativeGaugeSize = $true
    Remove-EmptyValue -Hashtable $Gage -Rerun 1 -Recursive

    # Build HTML
    $Div = New-HTMLTag -Tag 'div' -Attributes @{ id = $Gage.id; }

    $Script = New-HTMLTag -Tag 'script' -Value {
        # Convert Dictionary to JSON and return chart within SCRIPT tag
        # Make sure to return with additional empty string
        $JSON = $Gage | ConvertTo-Json -Depth 5 | ForEach-Object { [System.Text.RegularExpressions.Regex]::Unescape($_) }
        "document.addEventListener(`"DOMContentLoaded`", function (event) {"
        "var g1 = new JustGage( $JSON );"
        "});"
    } -NewLine

    # Return Data
    $Div
    $Script
}
Register-ArgumentCompleter -CommandName New-HTMLGage -ParameterName GaugageColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLGage -ParameterName LabelColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLGage -ParameterName ValueColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLGage -ParameterName PointerColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLGage -ParameterName StrokeColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLGage -ParameterName SectorColors -ScriptBlock $Script:ScriptBlockColors

<#
| | Name                 | Default                           | Description                                                                         |
|-| -------------------- | --------------------------------- | ----------------------------------------------------------------------------------- |
|+| id                   | (required)                        | The HTML container element id                                                       |
|+| value                | 0                                 | Value Gauge is showing                                                              |
| | parentNode           | null                              | The HTML container element object. Used if id is not present                        |
| | defaults             | false                             | Defaults parameters to use globally for gauge objects                               |
| | width                | null                              | The Gauge width in pixels (Integer)                                                 |
| | height               | null                              | The Gauge height in pixels                                                          |
|+| valueFontColor       | #010101                           | Color of label showing current value                                                |
|+| valueFontFamily      | Arial                             | Font of label showing current value                                                 |
|+| symbol               | ''                                | Special symbol to show next to value                                                |
|+| min                  | 0                                 | Min value                                                                           |
|+| minTxt               | false                             | Min value text, overrides min if specified                                          |
|+| max                  | 100                               | Max value                                                                           |
|+| maxTxt               | false                             | Max value text, overrides max if specified                                          |
|+| reverse              | false                             | Reverse min and max                                                                 |
|+| humanFriendlyDecimal | 0                                 | Number of decimal places for our human friendly number to contain                   |
| | textRenderer         | null                              | Function applied before redering text (value) => value                              |
| | onAnimationEnd       | null                              | Function applied after animation is done                                            |
|+| gaugeWidthScale      | 1.0                               | Width of the gauge element                                                          |
|+| gaugeColor           | #edebeb                           | Background color of gauge element                                                   |
|+| label                | ''                                | Text to show below value                                                            |
|+| labelFontColor       | #b3b3b3                           | Color of label showing label under value                                            |
|+| shadowOpacity        | 0.2                               | Shadow opacity 0 ~ 1                                                                |
|+| shadowSize           | 5                                 | Inner shadow size                                                                   |
|+| shadowVerticalOffset | 3                                 | How much shadow is offset from top                                                  |
|+| levelColors          | ["#a9d70b", "#f9c802", "#ff0000"] | Colors of indicator, from lower to upper, in RGB format                             |
| | startAnimationTime   | 700                               | Length of initial animation in milliseconds                                         |
| | startAnimationType   | >                                 | Type of initial animation (linear, >, <, <>, bounce)                                |
| | refreshAnimationTime | 700                               | Length of refresh animation in milliseconds                                         |
| | refreshAnimationType | >                                 | Type of refresh animation (linear, >, <, <>, bounce)                                |
| | donutStartAngle      | 90                                | Angle to start from when in donut mode                                              |
| | valueMinFontSize     | 16                                | Absolute minimum font size for the value label                                      |
| | labelMinFontSize     | 10                                | Absolute minimum font size for the label                                            |
| | minLabelMinFontSize  | 10                                | Absolute minimum font size for the min label                                        |
| | maxLabelMinFontSize  | 10                                | Absolute minimum font size for the man label                                        |
|+| hideValue            | false                             | Hide value text                                                                     |
|+| hideMinMax           | false                             | Hide min/max text                                                                   |
|+| showInnerShadow      | false                             | Show inner shadow                                                                   |
|+| humanFriendly        | false                             | convert large numbers for min, max, value to human friendly (e.g. 1234567 -> 1.23M) |
|+| noGradient           | false                             | Whether to use gradual color change for value, or sector-based                      |
|+| donut                | false                             | Show donut gauge                                                                    |
|*| relativeGaugeSize    | false                             | Whether gauge size should follow changes in container element size                  |
|+| counter              | false                             | Animate text value number change                                                    |
|+| decimals             | 0                                 | Number of digits after floating point                                               |
| | customSectors        | {}                                | Custom sectors colors. Expects an object                                            |
|+| formatNumber         | false                             | Formats numbers with commas where appropriate                                       |
|x| pointer              | false                             | Show value pointer                                                                  |
|x| pointerOptions       | {}                                | Pointer options. Expects an object                                                  |
|+| displayRemaining     | false                             | Replace display number with the value remaining to reach max value                  |
#>

<#
pointerOptions: {
  toplength: null,
  bottomlength: null,
  bottomwidth: null,
  stroke: 'none',
  stroke_width: 0,
  stroke_linecap: 'square',
  color: '#000000'
}
#>
<#
customSectors: {
  percents: true, // lo and hi values are in %
  ranges: [{
    color : "#43bf58",
    lo : 0,
    hi : 50
  },
  {
    color : "#ff3b30",
    lo : 51,
    hi : 100
  }]
}
#>