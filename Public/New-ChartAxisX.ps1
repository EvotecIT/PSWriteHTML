function New-ChartAxisX {
    [alias('ChartCategory', 'ChartAxisX', 'New-ChartCategory')]
    [CmdletBinding()]
    param(
        [alias('Name')][Array] $Names,
        [alias('Title')][string] $TitleText,
        [ValidateSet('datetime', 'category', 'numeric')][string] $Type = 'category',
        [object] $MinValue,
        [object] $MaxValue,

        [string] $TimeZoneOffset
        #[ValidateSet('top', 'topRight', 'left', 'right', 'bottom', '')][string] $LegendPosition = '',
        # [string[]] $Color
    )

    $offsetMilliseconds = 0
    if ($TimeZoneOffset) {
        $offsetMilliseconds = ([System.TimeSpan]::Parse($TimeZoneOffset)).TotalMilliseconds
    }
    # if Dates are given, lets auto change type to DateTime
    if ($MinValue -is [DateTime] -or $MaxValue -is [DateTime]) {
        $Type = 'datetime'
    }
    switch ($Type) {
        'datetime' {
            if ($MinValue -is [System.DateTime]) {
                $MinValue = [int64]([System.DateTimeOffset]$MinValue).ToUnixTimeMilliseconds() + $offsetMilliseconds
            }

            if ($MaxValue -is [System.DateTime]) {
                $MaxValue = [int64]([System.DateTimeOffset]$MaxValue).ToUnixTimeMilliseconds() + $offsetMilliseconds
            }
        }
        Default {
            $MinValue = [int]$MinValue
            $MaxValue = [int]$MaxValue
        }
    }
    [PSCustomObject] @{
        ObjectType = 'ChartAxisX'
        ChartAxisX = @{
            Names     = $Names
            Type      = $Type
            TitleText = $TitleText
            Min       = $MinValue
            Max       = $MaxValue
        }

        #   LegendPosition = $LegendPosition
        #   Color          = $Color
    }

    # https://apexcharts.com/docs/options/xaxis/
}

<# We can build this:
   xaxis: {
        type: 'category',
        categories: [],
        labels: {
            show: true,
            rotate: -45,
            rotateAlways: false,
            hideOverlappingLabels: true,
            showDuplicates: false,
            trim: true,
            minHeight: undefined,
            maxHeight: 120,
            style: {
                colors: [],
                fontSize: '12px',
                fontFamily: 'Helvetica, Arial, sans-serif',
                cssClass: 'apexcharts-xaxis-label',
            },
            offsetX: 0,
            offsetY: 0,
            format: undefined,
            formatter: undefined,
            datetimeFormatter: {
                year: 'yyyy',
                month: "MMM 'yy",
                day: 'dd MMM',
                hour: 'HH:mm',
            },
        },
        axisBorder: {
            show: true,
            color: '#78909C',
            height: 1,
            width: '100%',
            offsetX: 0,
            offsetY: 0
        },
        axisTicks: {
            show: true,
            borderType: 'solid',
            color: '#78909C',
            height: 6,
            offsetX: 0,
            offsetY: 0
        },
        tickAmount: undefined,
        tickPlacement: 'between',
        min: undefined,
        max: undefined,
        range: undefined,
        floating: false,
        position: 'bottom',
        title: {
            text: undefined,
            offsetX: 0,
            offsetY: 0,
            style: {
                color: undefined,
                fontSize: '12px',
                fontFamily: 'Helvetica, Arial, sans-serif',
                cssClass: 'apexcharts-xaxis-title',
            },
        },
        crosshairs: {
            show: true,
            width: 1,
            position: 'back',
            opacity: 0.9,
            stroke: {
                color: '#b6b6b6',
                width: 0,
                dashArray: 0,
            },
            fill: {
                type: 'solid',
                color: '#B1B9C4',
                gradient: {
                    colorFrom: '#D8E3F0',
                    colorTo: '#BED1E6',
                    stops: [0, 100],
                    opacityFrom: 0.4,
                    opacityTo: 0.5,
                },
            },
            dropShadow: {
                enabled: false,
                top: 0,
                left: 0,
                blur: 1,
                opacity: 0.4,
            },
        },
        tooltip: {
            enabled: true,
            formatter: undefined,
            offsetY: 0,
        },
    }

#>