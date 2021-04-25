function New-HTMLChartRadial {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Chart,
        #[nullable[int]] $Height = 350,
        #[nullable[int]] $Width,

        [Array] $DataNames,
        [Array] $Data,
        [string] $Type,

        [string] $LabelAverage,


        [System.Collections.IDictionary] $PlotOptions,


        [System.Collections.IDictionary] $Title,
        [System.Collections.IDictionary] $SubTitle,
        [System.Collections.IDictionary] $Legend,

        [string[]] $Colors,
        [switch] $PatternedColors,
        [switch] $GradientColors,
        [System.Collections.IDictionary] $GridOptions,
        [System.Collections.IDictionary] $Toolbar,
        [System.Collections.IDictionary] $Theme,
        [Object] $Events
    )

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
    New-ChartInternalRadial -Options $Options -Names $DataNames -Values $Data -Type $Type
    if ($PlotOptions) {
        $Options.plotOptions = $PlotOptions
    }
    # This added label. It's useful if there's more then one data
    New-ChartInternalRadialDataLabels -Options $Options -Label $LabelAverage


    New-ChartInternalColors -Options $Options -Colors $Colors
    # Default for all charts
    if ($PatternedColors) { New-ChartInternalPattern }
    if ($GradientColors) { New-ChartInternalGradient }
    #New-ChartInternalSize -Options $Options -Height $Height -Width $Width
    if ($GridOptions) { New-ChartInternalGrid -Options $Options @GridOptions }
    if ($Theme) { New-ChartInternalTheme -Options $Options @Theme }
    if ($Toolbar) { New-ChartInternalToolbar -Options $Options @Toolbar -Show $true }
    New-ApexChart -Options $Options -Events $Events
}

#Register-ArgumentCompleter -CommandName New-HTMLChartRadial -ParameterName Colors -ScriptBlock $Script:ScriptBlockColors