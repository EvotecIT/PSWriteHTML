function New-ChartAxisY {
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