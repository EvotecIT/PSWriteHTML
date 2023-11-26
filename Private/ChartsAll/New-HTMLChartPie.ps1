function New-HTMLChartPie {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Chart,
        [string] $Type,
        #[nullable[int]] $Height = 350,
        #[nullable[int]] $Width,

        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [string[]] $DataLabelsColor,
        [Array] $Data,
        [Array] $DataNames,

        [System.Collections.IDictionary] $Title,
        [System.Collections.IDictionary] $SubTitle,
        [System.Collections.IDictionary] $Legend,

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
    New-ChartInternalPie -Options $Options -Names $DataNames -Values $Data -Type $Type
    New-ChartInternalColors -Options $Options -Colors $Colors
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
    New-ChartInternalSize -Options $Options -Height $Height -Width $Width
    if ($GridOptions) { New-ChartInternalGrid -Options $Options @GridOptions }
    if ($Theme) { New-ChartInternalTheme -Options $Options @Theme }
    if ($Toolbar) { New-ChartInternalToolbar -Options $Options @Toolbar -Show $true }
    New-ApexChart -Options $Options -Events $Events
}

Register-ArgumentCompleter -CommandName New-HTMLChartPie -ParameterName DataLabelsColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLChartPie -ParameterName Colors -ScriptBlock $Script:ScriptBlockColors