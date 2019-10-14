function New-ChartInternalAxisY {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [string] $TitleText,
        [int] $Min,
        [int] $Max,
        [bool] $Show,
        [bool] $ShowAlways,
        [ValidateSet('90', '270')][string] $TitleRotate = '90',
        [int] $TitleOffsetX = 0,
        [int] $TitleOffsetY = 0,
        [string] $TitleStyleColor = "Black",
        [int] $TitleStyleFontSize = 12,
        [string] $TitleStylefontFamily = 'Helvetica, Arial, sans-serif'
    )
    if (-not $Options.Contains('yaxis')) {
        $Options.yaxis = @{ }
    }

    #if ($Show) {
    $Options.yaxis.show = $Show
    $Options.yaxis.showAlways = $ShowAlways
    # }

    if ($TitleText -ne '') {
        $Options.yaxis.title = [ordered] @{ }
        $Options.yaxis.title.text = $TitleText
        $Options.yaxis.title.rotate = [int] $TitleRotate
        $Options.yaxis.title.offsetX = $TitleOffsetX
        $Options.yaxis.title.offsetY = $TitleOffsetY
        $Options.yaxis.title.style = [ordered] @{ }

        $Color = ConvertFrom-Color -Color $TitleStyleColor
        if ($null -ne $Color) {
            $Options.yaxis.title.style.color = $Coor
        }
        $Options.yaxis.title.style.fontSize = $TitleStyleFontSize
        $Options.yaxis.title.style.fontFamily = $TitleStylefontFamily
    }
    if ($Min -gt 0) {
        $Options.yaxis.min = $Min
    }
    if ($Min -gt 0) {
        $Options.yaxis.max = $Max
    }


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