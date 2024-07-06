function New-ChartAxisY {
    <#
    .SYNOPSIS
    Creates a new Y-axis for a chart with customizable parameters.

    .DESCRIPTION
    This function creates a new Y-axis for a chart with the provided parameters. It allows customization of the axis visibility, title, labels, range, style, and other options.

    .PARAMETER Show
    Indicates whether the Y-axis should be displayed.

    .PARAMETER ShowAlways
    Indicates whether the Y-axis should always be visible.

    .PARAMETER TitleText
    The text to be displayed as the title of the Y-axis.

    .PARAMETER TitleRotate
    The rotation angle of the Y-axis title. Accepted values are '90' or '270'.

    .PARAMETER TitleOffsetX
    The horizontal offset of the Y-axis title.

    .PARAMETER TitleOffsetY
    The vertical offset of the Y-axis title.

    .PARAMETER TitleFontWeight
    The font weight of the Y-axis title.

    .PARAMETER TitleColor
    The color of the Y-axis title.

    .PARAMETER TitleFontSize
    The font size of the Y-axis title.

    .PARAMETER TitleFontFamily
    The font family of the Y-axis title.

    .PARAMETER MinValue
    The minimum value of the Y-axis.

    .PARAMETER MaxValue
    The maximum value of the Y-axis.

    .PARAMETER LabelMinWidth
    The minimum width of the Y-axis labels.

    .PARAMETER LabelMaxWidth
    The maximum width of the Y-axis labels.

    .PARAMETER LabelAlign
    The alignment of the Y-axis labels. Accepted values are 'left', 'center', or 'right'.

    .PARAMETER LabelFontSize
    The font size of the Y-axis labels.

    .PARAMETER LabelFontFamily
    The font family of the Y-axis labels.

    .PARAMETER LabelFontWeight
    The font weight of the Y-axis labels.

    .PARAMETER LabelFontColor
    The color of the Y-axis labels.

    .PARAMETER Reversed
    Indicates whether the Y-axis should be reversed.

    .PARAMETER Opposite
    Indicates whether the Y-axis should be positioned on the opposite side.

    .PARAMETER Logarithmic
    Indicates whether the Y-axis should have a logarithmic scale.

    .PARAMETER ForceNiceScale
    Indicates whether the Y-axis should have a nice scale.

    .PARAMETER Floating
    Indicates whether the Y-axis should be floating.

    .PARAMETER SeriesName
    The name of the series associated with the Y-axis.

    .EXAMPLE
    New-ChartAxisY -Show -TitleText 'Sales' -MinValue 0 -MaxValue 1000 -LabelAlign 'center'

    Creates a new Y-axis with the title 'Sales', range from 0 to 1000, and center-aligned labels.

    .EXAMPLE
    New-ChartAxisY -Show -ShowAlways -TitleText 'Temperature' -TitleColor 'red' -LabelAlign 'right'

    Creates a new Y-axis with the title 'Temperature', always visible, red-colored title, and right-aligned labels.
    #>
    [alias('ChartAxisY')]
    [CmdletBinding()]
    param(
        [switch] $Show,
        [switch] $ShowAlways,
        [string] $TitleText,
        [ValidateSet('90', '270')][string] $TitleRotate,
        [int] $TitleOffsetX = 0,
        [int] $TitleOffsetY = 0,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $TitleFontWeight,
        [alias('TitleStyleColor')][string] $TitleColor,
        [alias('TitleStyleFontSize')][int] $TitleFontSize, # = 12,
        [alias('TitleStyleFontFamily')][string] $TitleFontFamily, # = 'Helvetica, Arial, sans-serif',
        [int] $MinValue,
        [int] $MaxValue,
        [int] $LabelMinWidth = -1,
        [int] $LabelMaxWidth,
        [ValidateSet('left', 'center', 'right')][string] $LabelAlign,
        [object] $LabelFontSize,
        [string] $LabelFontFamily,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $LabelFontWeight,
        [string[]] $LabelFontColor,
        [switch] $Reversed,
        [switch] $Opposite,
        [switch] $Logarithmic,
        [switch] $ForceNiceScale,
        [switch] $Floating,
        [string] $SeriesName
    )
    $Object = [PSCustomObject] @{
        ObjectType = 'ChartAxisY'
        ChartAxisY = @{
            show       = $Show.IsPresent
            showAlways = $ShowAlways.IsPresent
            seriesName = $SeriesName
        }
    }
    if ($Reversed) {
        $Object.ChartAxisY.reversed = $true
    }
    if ($Opposite) {
        $Object.ChartAxisY.opposite = $true
    }
    if ($Logarithmic) {
        $Object.ChartAxisY.logarithmic = $true
    }
    if ($ForceNiceScale) {
        $Object.ChartAxisY.forceNiceScale = $true
    }
    if ($Floating) {
        $Object.ChartAxisY.floating = $true
    }
    if ($MinValue) {
        $Object.ChartAxisY.min = $MinValue
    }
    if ($MaxValue) {
        $Object.ChartAxisY.max = $MaxValue
    }

    $Object.ChartAxisY.title = @{}
    if ($TitleText) {
        $Object.ChartAxisY.title.text = $TitleText
    }
    if ($TitleRotate) {
        $Object.ChartAxisY.title.rotate = [int] $TitleRotate
    }
    if ($TitleOffsetX) {
        $Object.ChartAxisY.title.offsetX = $TitleOffsetX
    }
    if ($TitleOffsetY) {
        $Object.ChartAxisY.title.offsetY = $TitleOffsetY
    }
    if ($TitleColor -or $TitleFontSize -or $TitleFontFamily) {
        $Object.ChartAxisY.title.style = @{}
        if ($TitleColor) {
            $Object.ChartAxisY.title.style.color = ConvertFrom-Color -Color $TitleColor
        }
        if ($TitleFontSize) {
            $Object.ChartAxisY.title.style.fontSize = ConvertFrom-Size -Size $TitleFontSize
        }
        if ($TitleFontFamily) {
            $Object.ChartAxisY.title.style.fontFamily = $TitleFontFamily
        }
        if ($TitleFontWeight) {
            $Object.ChartAxisY.title.style.fontWeight = $TitleFontWeight
        }
    }

    $Object.ChartAxisY.labels = @{}
    if ($LabelAlign) {
        $Object.ChartAxisY.labels.align = $LabelAlign
    }
    if ($LabelMinWidth -ne -1) {
        $Object.ChartAxisY.labels.minWidth = $LabelMinWidth
    }
    if ($LabelMaxWidth) {
        $Object.ChartAxisY.labels.maxWidth = $LabelMaxWidth
    }
    if ($LabelFontSize -or $LabelFontFamily -or $LabelFontWeight -or $LabelFontColor) {
        $Object.ChartAxisY.labels.style = @{}

        if ($LabelFontSize) {
            $Object.ChartAxisY.labels.style.fontSize = ConvertFrom-Size -Size $LabelFontSize
        }
        if ($LabelFontFamily) {
            $Object.ChartAxisY.labels.style.fontFamily = $LabelFontFamily
        }
        if ($LabelFontWeight) {
            $Object.ChartAxisY.labels.style.fontWeight = $LabelFontWeight
        }
        if ($LabelFontColor) {
            $Object.ChartAxisY.labels.style.colors = @($LabelFontColor)
        }
    }
    Remove-EmptyValue -Hashtable $Object.ChartAxisY -Recursive -Rerun 2
    $Object

    # https://apexcharts.com/docs/options/yaxis/
}
Register-ArgumentCompleter -CommandName New-ChartAxisY -ParameterName TitleColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-ChartAxisY -ParameterName LabelFontColor -ScriptBlock $Script:ScriptBlockColors
<# We can build this
    yaxis: {
        show: true,
        showAlways: true,
        seriesName: undefined,
        opposite: false,
        reversed: false,
        logarithmic: false,
        tickAmount: 6,
        min: 6,
        max: 6,
        forceNiceScale: false,
        floating: false,
        decimalsInFloat: undefined,
        labels: {
            show: true,
            align: 'right',
            minWidth: 0,
            maxWidth: 160,
            style: {
                color: undefined,
                fontSize: '12px',
                fontFamily: 'Helvetica, Arial, sans-serif',
                cssClass: 'apexcharts-yaxis-label',
            },
            offsetX: 0,
            offsetY: 0,
            rotate: 0,
            formatter: (value) => { return val },
        },
        axisBorder: {
            show: true,
            color: '#78909C',
            offsetX: 0,
            offsetY: 0
        },
        axisTicks: {
            show: true,
            borderType: 'solid',
            color: '#78909C',
            width: 6,
            offsetX: 0,
            offsetY: 0
        },
        title: {
            text: undefined,
            rotate: -90,
            offsetX: 0,
            offsetY: 0,
            style: {
                color: undefined,
                fontSize: '12px',
                fontFamily: 'Helvetica, Arial, sans-serif',
                cssClass: 'apexcharts-yaxis-title',
            },
        },
        crosshairs: {
            show: true,
            position: 'back',
            stroke: {
                color: '#b6b6b6',
                width: 1,
                dashArray: 0,
            },
        },
        tooltip: {
            enabled: true,
            offsetX: 0,
        },

    }

#>