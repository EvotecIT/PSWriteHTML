function New-HTMLChartTimeLine {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Chart,

        [System.Collections.IDictionary] $Title,
        [System.Collections.IDictionary] $SubTitle,
        [System.Collections.IDictionary] $Legend,

        [Array] $Data,
        [switch] $PatternedColors,
        [switch] $GradientColors,

        [System.Collections.IDictionary] $GridOptions,
        [System.Collections.IDictionary] $Toolbar,
        [System.Collections.IDictionary] $Theme,

        [System.Collections.IDictionary] $ChartAxisX,
        [Array] $ChartAxisY,

        [System.Collections.IDictionary] $ChartToolTip,
        [System.Collections.IDictionary] $DataLabel,
        [Object] $Events
    )
    # Defaults
    $Options = [ordered] @{}
    $Options.chart = $Chart
    $Options['chart']['type'] = 'rangeBar'

    if ($Title) {
        $Options.title = $Title
    }
    if ($SubTitle) {
        $Options.subtitle = $SubTitle
    }
    if ($Legend) {
        $Options.legend = $Legend
    }

    if (-not $ChartAxisX) {
        $ChartAxisX = [ordered] @{}
    }
    $ChartAxisX.type = "datetime"
    New-ChartInternalAxisX -Options $Options @ChartAxisX

    if ($ChartAxisY) {
        # ChartAxisY in TimeLine charts doesn't support multiple AxisY
        # So we force it to use first one
        $Options.yaxis = $ChartAxisY[0]
    }

    if ($ChartToolTip) {
        New-ChartInternalToolTip -Options $Options @ChartToolTip
    }
    if ($DataLabel) {
        $Options.dataLabels = $DataLabel
    }

    New-ChartInternalTimeLine -Options $Options -Color $Color -Data $Data

    # Default for all charts
    if ($PatternedColors) { New-ChartInternalPattern }
    if ($GradientColors) { New-ChartInternalGradient }
    if ($GridOptions) { New-ChartInternalGrid -Options $Options @GridOptions }
    if ($Theme) { New-ChartInternalTheme -Options $Options @Theme }
    if ($Toolbar) { New-ChartInternalToolbar -Options $Options @Toolbar -Show $true }
    New-ApexChart -Options $Options -Events $Events
}

Register-ArgumentCompleter -CommandName New-HTMLChartSpark -ParameterName Color -ScriptBlock $Script:ScriptBlockColors