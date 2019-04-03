function New-HTMLChartLine {
    [CmdletBinding()]
    param(
        [nullable[int]] $Height = 350,
        [nullable[int]] $Width,
        [ValidateSet('', 'central')][string] $Positioning,

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
        [ValidateSet('center', 'left', 'right', '')][string] $TitleAlignment = '',

        [ValidateSet('top', 'topRight', 'left', 'right', 'bottom', '')][string] $LegendPosition = '',

        [string] $TitleX,
        [string] $TitleY,

        [int] $MarkerSize,

        [Array] $Data,
        [Array] $DataNames,
        [Array] $DataLegend
    )

    $Options = [ordered] @{}

    New-ChartLine -Options $Options -Data $Data -DataNames $DataNames -DataLegend $DataLegend

    New-ChartStrokeDefinition -Options $Options `
        -LineShow $true `
        -LineCurve $LineCurve `
        -LineWidth $LineWidth `
        -LineColor $LineColor

    New-ChartDataLabels -Options $Options `
        -DataLabelsEnabled $DataLabelsEnabled `
        -DataLabelsOffsetX $DataLabelsOffsetX `
        -DataLabelsFontSize $DataLabelsFontSize `
        -DataLabelsColor $DataLabelsColor

    New-ChartAxisX -Options $Options `
        -Title $TitleX `
        -DataCategoriesType $DataCategoriesType `
        -DataCategories $DataLegend

    New-ChartAxisY -Options $Options `
        -Title $TitleY

    New-ChartMarker -Options $Options -MarkerSize $MarkerSize

    New-ChartTitle -Options $Options -Title $Title -TitleAlignment $TitleAlignment
    New-ChartGridColors -Options $Options -GridColors $GridColors -GridOpacity $GridOpacity

    New-ChartLegend -Options $Options -LegendPosition $LegendPosition

    New-ChartSize -Options $Options -Height $Height -Width $Width
    New-ChartToolbar -Options $Options
    New-ApexChart -Positioning $Positioning -Options $Options
}
