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
        [ValidateSet('datetime', 'category', 'numeric')][string] $DataCategoriesType = 'category',

        [ValidateSet('straight', 'smooth', 'stepline')] $LineCurve = 'straight',
        [int] $LineWidth,
        [RGBColors[]] $LineColor,

        [RGBColors[]] $GridColors,
        [double] $GridOpacity,

        [string] $Title,
        [ValidateSet('center', 'left', 'right', 'default')][string] $TitleAlignment = 'default',

        [ValidateSet('top', 'topRight', 'left', 'right', 'bottom', 'default')][string] $LegendPosition = 'default',

        [string] $TitleX,
        [string] $TitleY,

        [int] $MarkerSize,

        [Array] $Data,
        [Array] $DataNames,
        [Array] $DataLegend
    )

    $Options = [ordered] @{ }

    New-ChartInternalLine -Options $Options -Data $Data -DataNames $DataNames

    New-ChartInternalStrokeDefinition -Options $Options `
        -LineShow $true `
        -LineCurve $LineCurve `
        -LineWidth $LineWidth `
        -LineColor $LineColor

    # line colors (stroke colors ) doesn't cover legend - we need to make sure it's the same even thou lines are already colored
    New-ChartInternalColors -Options $Options -Colors $LineColor

    New-ChartInternalDataLabels -Options $Options `
        -DataLabelsEnabled $DataLabelsEnabled `
        -DataLabelsOffsetX $DataLabelsOffsetX `
        -DataLabelsFontSize $DataLabelsFontSize `
        -DataLabelsColor $DataLabelsColor

    New-ChartInternalAxisX -Options $Options `
        -Title $TitleX `
        -DataCategoriesType $DataCategoriesType `
        -DataCategories $DataLegend

    New-ChartInternalAxisY -Options $Options `
        -Title $TitleY

    New-ChartInternalMarker -Options $Options -MarkerSize $MarkerSize

    New-ChartInternalTitle -Options $Options -Title $Title -TitleAlignment $TitleAlignment
    New-ChartInternalGridColors -Options $Options -GridColors $GridColors -GridOpacity $GridOpacity

    New-ChartInternalLegend -Options $Options -LegendPosition $LegendPosition

    New-ChartInternalSize -Options $Options -Height $Height -Width $Width
    New-ChartInternalToolbar -Options $Options
    New-ApexChart -Positioning $Positioning -Options $Options
}
