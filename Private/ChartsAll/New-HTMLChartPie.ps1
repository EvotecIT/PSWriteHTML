function New-HTMLChartPie {
    [CmdletBinding()]
    param(
        [string] $Type,
        [nullable[int]] $Height = 350,
        [nullable[int]] $Width,


        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [string[]] $DataLabelsColor,
        [Array] $Data,
        [Array] $DataNames,


        [ValidateSet('top', 'topRight', 'left', 'right', 'bottom', 'default')][string] $LegendPosition = 'default',


        [string[]] $Colors,
        [string] $Title,
        [ValidateSet('center', 'left', 'right', 'default')][string] $TitleAlignment = 'default',
        [switch] $PatternedColors,
        [switch] $GradientColors,
        [System.Collections.IDictionary] $GridOptions,
        [System.Collections.IDictionary] $Toolbar,
        [System.Collections.IDictionary] $Theme

    )

    $Options = [ordered] @{ }
    New-ChartInternalPie -Options $Options -Names $DataNames -Values $Data -Type $Type


    New-ChartInternalColors -Options $Options -Colors $Colors
    # Default for all charts
    if ($PatternedColors) { New-ChartInternalPattern }
    if ($GradientColors) { New-ChartInternalGradient }
    New-ChartInternalTitle -Options $Options -Title $Title -TitleAlignment $TitleAlignment
    New-ChartInternalSize -Options $Options -Height $Height -Width $Width
    if ($GridOptions) { New-ChartInternalGrid -Options $Options @GridOptions }
    if ($Theme) { New-ChartInternalTheme -Options $Options @Theme }
    if ($Toolbar) { New-ChartInternalToolbar -Options $Options @Toolbar -Show $true }
    New-ApexChart -Options $Options
}

Register-ArgumentCompleter -CommandName New-HTMLChartPie -ParameterName DataLabelsColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLChartPie -ParameterName Colors -ScriptBlock $Script:ScriptBlockColors