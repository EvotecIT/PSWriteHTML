function New-HTMLChartSpark {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Chart,
        [System.Collections.IDictionary] $ChartAxisX,
        #[nullable[int]] $Height = 350,
        #[nullable[int]] $Width,

        [System.Collections.IDictionary] $Title,
        [System.Collections.IDictionary] $SubTitle,
        [System.Collections.IDictionary] $Legend,

        # Data to display in Spark
        [Array] $Data,

        [string[]] $Colors,

        [switch] $PatternedColors,
        [switch] $GradientColors,
        [System.Collections.IDictionary] $GridOptions,
        [System.Collections.IDictionary] $Toolbar,
        [System.Collections.IDictionary] $Theme,
        [Object] $Events,
        [System.Collections.IDictionary] $Design
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
    if ($ChartAxisX) {
        New-ChartInternalAxisX -Options $Options @ChartAxisX
    }
    New-ChartInternalSpark -Options $Options -Color $Colors -Values $Data


    # Default for all charts
    if ($Design.fill.pattern) {
        $Options.fill = [ordered] @{
            type    = 'pattern'
            pattern = $Design.fill.pattern
        }
    } elseif ($Design.fill.gradient) {
        $Options.fill = [ordered] @{
            type     = 'gradient'
            gradient = $Design.fill.gradient
        }
    } elseif ($PatternedColors) {
        New-ChartInternalPattern
    } elseif ($GradientColors) {
        New-ChartInternalGradient
    }
    #New-ChartInternalSize -Options $Options -Height $Height -Width $Width
    if ($GridOptions) { New-ChartInternalGrid -Options $Options @GridOptions }
    if ($Theme) { New-ChartInternalTheme -Options $Options @Theme }
    if ($Toolbar) { New-ChartInternalToolbar -Options $Options @Toolbar -Show $true }
    New-ApexChart -Options $Options -Events $Events
}

Register-ArgumentCompleter -CommandName New-HTMLChartSpark -ParameterName Color -ScriptBlock $Script:ScriptBlockColors