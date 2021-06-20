function New-HTMLChartBar {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Chart,
        [ValidateSet('bar', 'barStacked', 'barStacked100Percent')] $Type = 'bar',
        [string[]] $Colors,

        [bool] $Horizontal = $true,
        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [string] $DataLabelsColor,

        [switch] $Distributed,
        [Array] $Data,
        [Array] $DataNames,
        [Array] $DataLegend,
        [Array] $DataSeries,

        [Array] $Categories,
        [System.Collections.IDictionary] $ChartToolTip,
        [System.Collections.IDictionary] $ChartAxisX,
        [Array] $ChartAxisY,
        [System.Collections.IDictionary] $Title,
        [System.Collections.IDictionary] $SubTitle,
        [System.Collections.IDictionary] $Legend,

        [switch] $PatternedColors,
        [switch] $GradientColors,
        [System.Collections.IDictionary] $GridOptions,
        [System.Collections.IDictionary] $Toolbar,
        [System.Collections.IDictionary] $Theme,
        [Object] $Events
    )
    # Defaults
    $Options = [ordered] @{ }
    $Options.chart = $Chart
    if ($Title) {
        $Options.title = $Title
    }
    if ($SubTitle) {
        $Options.subtitle = $SubTitle
    }
    if ($Legend) {
        $Options.legend = $Legend
    }

    # Set bar
    if ($Type -eq 'bar') {
        $Options.chart.type = 'bar'
    } elseif ($Type -eq 'barStacked') {
        $Options.chart.type = 'bar'
        $Options.chart.stacked = $true
    } else {
        $Options.chart.type = 'bar'
        $Options.chart.stacked = $true
        $Options.chart.stackType = '100%'
    }

    $Options.plotOptions = @{
        bar = @{
            horizontal = $Horizontal
        }
    }
    if ($Distributed) {
        $Options.plotOptions.bar.distributed = $Distributed.IsPresent
    }
    $Options.dataLabels = [ordered] @{
        enabled = $DataLabelsEnabled
        offsetX = $DataLabelsOffsetX
        style   = @{
            fontSize = $DataLabelsFontSize
        }
    }
    if ($null -ne $DataLabelsColor) {
        $RGBColorLabel = ConvertFrom-Color -Color $DataLabelsColor
        $Options.dataLabels.style.colors = @($RGBColorLabel)
    }

    if (-not $Options.Contains('xaxis')) {
        $Options.xaxis = [ordered] @{ }
    }

    #if ($ChartAxisX) {
    New-ChartInternalAxisX -Options $Options @ChartAxisX -Names $Categories
    #}



    if ($ChartAxisY) {
        # ChartAxisY in Bar charts doesn't support multiple AxisY
        # So we force it to use first one
        $Options.yaxis = $ChartAxisY[0]
    }

    if ($DataSeries) {
        $Options.series = @(
            @{
                #name = 'test', 'test2','test3'
                data = $DataSeries
            }
        )

    }



    <#
    New-ChartInternalBar -Options $Options -Horizontal $Horizontal -DataLabelsEnabled $DataLabelsEnabled `
        -DataLabelsOffsetX $DataLabelsOffsetX -DataLabelsFontSize $DataLabelsFontSize -DataLabelsColor $DataLabelsColor `
        -Data $Data -DataNames $DataNames -DataLegend $DataLegend `
        -Type $Type -Distributed:$Distributed
    #>

    #if ($ChartToolTip) {
       # New-ChartInternalToolTip -Options $Options @ChartToolTip
    #}

    New-ChartInternalColors -Options $Options -Colors $Colors
    # Default for all charts
    if ($PatternedColors) { New-ChartInternalPattern }
    if ($GradientColors) { New-ChartInternalGradient }
    if ($GridOptions) { New-ChartInternalGrid -Options $Options @GridOptions }
    if ($Theme) { New-ChartInternalTheme -Options $Options @Theme }
    if ($Toolbar) { New-ChartInternalToolbar -Options $Options @Toolbar -Show $true }
    New-ApexChart -Options $Options -Events $Events
}

Register-ArgumentCompleter -CommandName New-HTMLChartBar -ParameterName Colors -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLChartBar -ParameterName DataLabelsColor -ScriptBlock $Script:ScriptBlockColors