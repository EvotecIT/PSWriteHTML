function New-ChartAxisY {
    [alias('ChartAxisY')]
    [CmdletBinding()]
    param(
        [switch] $Show,
        [switch] $ShowAlways,
        [string] $TitleText,
        [ValidateSet('90', '270')][string] $TitleRotate = '90',
        [int] $TitleOffsetX = 0,
        [int] $TitleOffsetY = 0,
        [string] $TitleStyleColor = "",
        [int] $TitleStyleFontSize = 12,
        [string] $TitleStylefontFamily = 'Helvetica, Arial, sans-serif',
        [int] $MinValue,
        [int] $MaxValue
        #[ValidateSet('top', 'topRight', 'left', 'right', 'bottom', '')][string] $LegendPosition = '',
        # [RGBColors[]] $Color
    )
    [PSCustomObject] @{
        ObjectType = 'ChartAxisY'
        ChartAxisY = @{
            Show                 = $Show.IsPresent
            ShowAlways           = $ShowAlways.IsPresent
            TitleText            = $TitleText
            TitleRotate          = $TitleRotate
            TitleOffsetX         = $TitleOffsetX
            TitleOffsetY         = $TitleOffsetY
            TitleStyleColor      = $TitleStyleColor
            TitleStyleFontSize   = $TitleStyleFontSize
            TitleStylefontFamily = $TitleStylefontFamily
            Min                  = $MinValue
            Max                  = $MaxValue
        }
    }

    # https://apexcharts.com/docs/options/yaxis/
}

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