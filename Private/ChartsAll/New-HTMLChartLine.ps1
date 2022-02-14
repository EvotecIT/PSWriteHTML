function New-HTMLChartLine {
    [CmdletBinding()]
    param(
        #[nullable[int]] $Height = 350,
        #[nullable[int]] $Width,

        #[bool] $DataLabelsEnabled = $true,
        #[int] $DataLabelsOffsetX = -6,
        #[string] $DataLabelsFontSize = '12px',
        #[string[]] $DataLabelsColor,
        # [ValidateSet('datetime', 'category', 'numeric')][string] $DataCategoriesType = 'category',

        #[int] $MarkerSize,
        [System.Collections.IDictionary] $Chart,
        [Array] $Stroke,
        [Array] $Series,

        [System.Collections.IDictionary] $DataLabel,
        [System.Collections.IDictionary] $Markers,
        #[Array] $DataLegend,
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

    $Options = [ordered] @{ }
    $Options.chart = $Chart
    $Options['chart']['type'] = 'line'

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
    if ($ChartAxisY) {
        $Options.yaxis = $ChartAxisY
    }

    #New-ChartInternalLine -Options $Options -Data $Data -DataNames $DataNames

    $Options.series = $DataSeries
    $Options.stroke = New-ChartInternalStroke -Stroke $Stroke
    if ($Stroke.Colors) {
        # if stroke colors are defined we can either push them to stroke only or globally
        # if we push them to stroke only we don't get proper colors for the legend
        # but if we push them to both we could in theory have different colors for strokes and legend if need arises in the future.
        # hence the choice to push them to both for now
        $Options['colors'] = $Stroke.Colors
    }
    $Options.dataLabels = $DataLabel
    $Options.markers = $Markers
    <#
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
        #>
    # line colors (stroke colors ) doesn't cover legend - we need to make sure it's the same even thou lines are already colored
    #New-ChartInternalColors -Options $Options -Colors $LineColor
    <#
    New-ChartInternalDataLabels -Options $Options `
        -DataLabelsEnabled $DataLabelsEnabled `
        -DataLabelsOffsetX $DataLabelsOffsetX `
        -DataLabelsFontSize $DataLabelsFontSize `
        -DataLabelsColor $DataLabelsColor

        #>
    #New-ChartInternalMarker -Options $Options -MarkerSize $MarkerSize

    # Default for all charts
    if ($PatternedColors) { New-ChartInternalPattern }
    if ($GradientColors) { New-ChartInternalGradient }

    #New-ChartInternalSize -Options $Options -Height $Height -Width $Width
    if ($GridOptions) { New-ChartInternalGrid -Options $Options @GridOptions }
    if ($Theme) { New-ChartInternalTheme -Options $Options @Theme }
    if ($Toolbar) { New-ChartInternalToolbar -Options $Options @Toolbar -Show $true }
    New-ApexChart -Options $Options -Events $Events
}

Register-ArgumentCompleter -CommandName New-HTMLChartLine -ParameterName DataLabelsColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLChartLine -ParameterName LineColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLChartLine -ParameterName GridColors -ScriptBlock $Script:ScriptBlockColors