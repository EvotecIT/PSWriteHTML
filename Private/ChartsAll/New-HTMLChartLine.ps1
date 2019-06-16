function New-HTMLChartLine {
    [CmdletBinding()]
    param(
        [nullable[int]] $Height = 350,
        [nullable[int]] $Width,
        [ValidateSet('default', 'central')][string] $Positioning = 'default',

        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [RGBColors[]] $DataLabelsColor,
        # [ValidateSet('datetime', 'category', 'numeric')][string] $DataCategoriesType = 'category',

        [ValidateSet('straight', 'smooth', 'stepline')][string[]] $LineCurve,
        [int[]] $LineWidth,
        [RGBColors[]] $LineColor,
        [int[]] $LineDash,
        [ValidateSet('butt', 'square', 'round')][string[]] $LineCap,

        #[RGBColors[]] $GridColors,
        #[double] $GridOpacity,

        [string] $Title,
        [ValidateSet('center', 'left', 'right', 'default')][string] $TitleAlignment = 'default',

        [ValidateSet('top', 'topRight', 'left', 'right', 'bottom', 'default')][string] $LegendPosition = 'default',

        #[string] $TitleX,
        #[string] $TitleY,

        [int] $MarkerSize,

        [Array] $Data,
        [Array] $DataNames,
        #[Array] $DataLegend,
        [System.Collections.IDictionary] $GridOptions,
        [System.Collections.IDictionary] $ChartAxisX,
        [System.Collections.IDictionary] $ChartAxisY
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
    } else {
        #New-ChartInternalAxisX -Options $Options
        #   -Title $TitleX `
        #  -DataCategoriesType $DataCategoriesType `
        # -DataCategories $DataLegend
    }

    if ($ChartAxisY) {
        New-ChartInternalAxisY -Options $Options @ChartAxisY
    } else {
        #New-ChartInternalAxisY -Options $Options
    }

    New-ChartInternalMarker -Options $Options -MarkerSize $MarkerSize

    New-ChartInternalTitle -Options $Options -Title $Title -TitleAlignment $TitleAlignment

    if ($GridOptions) {
        New-ChartInternalGrid -Options $Options @GridOptions #-GridColors $GridColors -GridOpacity $GridOpacity
    } else {
        New-ChartInternalGrid -Options $Options
    }
    New-ChartInternalLegend -Options $Options -LegendPosition $LegendPosition

    New-ChartInternalSize -Options $Options -Height $Height -Width $Width
    New-ChartInternalToolbar -Options $Options
    New-ApexChart -Positioning $Positioning -Options $Options
}
