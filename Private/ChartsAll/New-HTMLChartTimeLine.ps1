function New-HTMLChartTimeLine {
    [CmdletBinding()]
    param(
        [nullable[int]] $Height = 350,
        [nullable[int]] $Width,

        [string] $Title,
        [ValidateSet('center', 'left', 'right', 'default')][string] $TitleAlignment = 'default',

        [Array] $Data,
        <#
        [Array] $DataNames,
        [string] $TitleText,
        [string] $SubTitleText,
        [int] $FontSizeTitle = 24,
        [int] $FontSizeSubtitle = 14,
        [string] $Color,
        #>
        [switch] $PatternedColors,
        [switch] $GradientColors,

        [System.Collections.IDictionary] $GridOptions,
        [System.Collections.IDictionary] $Toolbar,
        [System.Collections.IDictionary] $Theme,

        [System.Collections.IDictionary] $ChartAxisX,
        [System.Collections.IDictionary] $ChartAxisY,

        [System.Collections.IDictionary] $ChartToolTip

        
    )
    $Options = [ordered] @{}
    
    if ($ChartAxisX) {
        $ChartAxisX.type = "datetime"
        New-ChartInternalAxisX -Options $Options @ChartAxisX
    } else {
        $ChartAxisX = @{
            Type = "datetime"
        }
        New-ChartInternalAxisX -Options $Options @ChartAxisX
    }
    if ($ChartAxisY) {
        New-ChartInternalAxisY -Options $Options @ChartAxisY
    }
    if ($ChartToolTip) {
        New-ChartInternalToolTip -Options $Options @ChartToolTip
    }

    New-ChartInternalTimeLine -Options $Options -Color $Color -Title $TitleText -SubTitle $SubTitleText -FontSizeTitle $FontSizeTitle -FontSizeSubtitle $FontSizeSubtitle -Data $Data

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

Register-ArgumentCompleter -CommandName New-HTMLChartSpark -ParameterName Color -ScriptBlock $Script:ScriptBlockColors