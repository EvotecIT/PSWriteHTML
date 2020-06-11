function New-HTMLChartLine {
    [CmdletBinding()]
    param(
        [nullable[int]] $Height = 350,
        [nullable[int]] $Width,

        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [string[]] $DataLabelsColor,
        # [ValidateSet('datetime', 'category', 'numeric')][string] $DataCategoriesType = 'category',

        [ValidateSet('straight', 'smooth', 'stepline')][string[]] $LineCurve,
        [int[]] $LineWidth,
        [string[]] $LineColor,
        [int[]] $LineDash,
        [ValidateSet('butt', 'square', 'round')][string[]] $LineCap,

        #[string[]] $GridColors,
        #[double] $GridOpacity,

        [ValidateSet('top', 'topRight', 'left', 'right', 'bottom', 'default')][string] $LegendPosition = 'default',

        #[string] $TitleX,
        #[string] $TitleY,

        [int] $MarkerSize,

        [Array] $Data,
        [Array] $DataNames,
        #[Array] $DataLegend,
        [System.Collections.IDictionary] $ChartAxisX,
        [System.Collections.IDictionary] $ChartAxisY,



        [string] $Title,
        [ValidateSet('center', 'left', 'right', 'default')][string] $TitleAlignment = 'default',
        [switch] $PatternedColors,
        [switch] $GradientColors,
        [System.Collections.IDictionary] $GridOptions,
        [System.Collections.IDictionary] $Toolbar,
        [System.Collections.IDictionary] $Theme
    )

    $Options = [ordered] @{ }

    New-ChartInternalLine -Options $Options -Data $Data -DataNames $DataNames

    if ($LineCurve.Count -eq 0 -or ($LineCurve.Count -ne $DataNames.Count)) {
        $LineCurve = for ($i = $LineCurve.Count; $i -le $DataNames.Count; $i++) {
            'straight'
        }
    }

    if ($LineCap.Count -eq 0 -or ($LineCap.Count -ne $DataNames.Count)) {
        $LineCap = for ($i = $LineCap.Count; $i -le $DataNames.Count; $i++) {
            'butt'
        }
    }
    if ($LineDash.Count -eq 0) {

    }

    New-ChartInternalStrokeDefinition -Options $Options `
        -LineShow $true `
        -LineCurve $LineCurve `
        -LineWidth $LineWidth `
        -LineColor $LineColor `
        -LineCap $LineCap `
        -LineDash $LineDash
    # line colors (stroke colors ) doesn't cover legend - we need to make sure it's the same even thou lines are already colored
    New-ChartInternalColors -Options $Options -Colors $LineColor
    New-ChartInternalDataLabels -Options $Options `
        -DataLabelsEnabled $DataLabelsEnabled `
        -DataLabelsOffsetX $DataLabelsOffsetX `
        -DataLabelsFontSize $DataLabelsFontSize `
        -DataLabelsColor $DataLabelsColor
    if ($ChartAxisX) {
        New-ChartInternalAxisX -Options $Options @ChartAxisX
    }
    if ($ChartAxisY) {
        New-ChartInternalAxisY -Options $Options @ChartAxisY
    }
    New-ChartInternalMarker -Options $Options -MarkerSize $MarkerSize
    New-ChartInternalLegend -Options $Options -LegendPosition $LegendPosition



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

Register-ArgumentCompleter -CommandName New-HTMLChartLine -ParameterName DataLabelsColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLChartLine -ParameterName LineColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLChartLine -ParameterName GridColors -ScriptBlock $Script:ScriptBlockColors