function New-HTMLChartBar {
    [CmdletBinding()]
    param(
        [nullable[int]] $Height = 350,
        [nullable[int]] $Width,
        [ValidateSet('bar', 'barStacked', 'barStacked100Percent')] $Type = 'bar',
        [string[]] $Colors,

        [bool] $Horizontal = $true,
        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [string] $DataLabelsColor,

        [switch] $Distributed,

        #[ValidateSet('top', 'topRight', 'left', 'right', 'bottom', 'default')][string] $LegendPosition = 'default',

        [Array] $Data,
        [Array] $DataNames,
        [Array] $DataLegend,

        [System.Collections.IDictionary] $ChartAxisX,
        [System.Collections.IDictionary] $ChartAxisY,
        [System.Collections.IDictionary] $Legend,

        [string] $Title,
        [ValidateSet('center', 'left', 'right', 'default')][string] $TitleAlignment = 'default',
        [switch] $PatternedColors,
        [switch] $GradientColors,
        [System.Collections.IDictionary] $GridOptions,
        [System.Collections.IDictionary] $Toolbar,
        [System.Collections.IDictionary] $Theme,
        [Object] $Events
    )

    $Options = [ordered] @{ }
    if ($ChartAxisX) {
        New-ChartInternalAxisX -Options $Options @ChartAxisX
    }
    if ($ChartAxisY) {
        $Options.yaxis = $ChartAxisY
    }
    if ($Legend) {
        $Options.legend = $Legend
    }
    New-ChartInternalBar -Options $Options -Horizontal $Horizontal -DataLabelsEnabled $DataLabelsEnabled `
        -DataLabelsOffsetX $DataLabelsOffsetX -DataLabelsFontSize $DataLabelsFontSize -DataLabelsColor $DataLabelsColor `
        -Data $Data -DataNames $DataNames -DataLegend $DataLegend `
        -Type $Type -Distributed:$Distributed

    New-ChartInternalColors -Options $Options -Colors $Colors
    # Default for all charts
    if ($PatternedColors) { New-ChartInternalPattern }
    if ($GradientColors) { New-ChartInternalGradient }
    New-ChartInternalTitle -Options $Options -Title $Title -TitleAlignment $TitleAlignment
    New-ChartInternalSize -Options $Options -Height $Height -Width $Width
    if ($GridOptions) { New-ChartInternalGrid -Options $Options @GridOptions }
    if ($Theme) { New-ChartInternalTheme -Options $Options @Theme }
    if ($Toolbar) { New-ChartInternalToolbar -Options $Options @Toolbar -Show $true }
    New-ApexChart -Options $Options -Events $Events
}

Register-ArgumentCompleter -CommandName New-HTMLChartBar -ParameterName Colors -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLChartBar -ParameterName DataLabelsColor -ScriptBlock $Script:ScriptBlockColors