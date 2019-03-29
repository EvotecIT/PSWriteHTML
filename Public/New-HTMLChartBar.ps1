function New-HTMLChartBar {
    [CmdletBinding()]
    param(
        [nullable[int]] $Height = 350,
        [nullable[int]] $Width,
        [ValidateSet('', 'central')][string] $Positioning,
        [ValidateSet('bar', 'barStacked', 'barStacked100Percent')] $Type = 'bar',
        <#

        [Array] $DataCategories = @(),
        [ValidateSet('datetime', 'category', 'numeric')][string] $DataCategoriesType = 'category',


        [bool] $LineShow = $true,
        [ValidateSet('straight', 'smooth')] $LineCurve = 'straight',
        $LineWidth = 2,
        [RGBColors[]] $LineColor,
        #>

        [RGBColors[]] $Colors,

        [switch] $PatternedColors,

        [string] $Title,
        [ValidateSet('center', 'left', 'right', '')][string] $TitleAlignment = '',

        [bool] $Horizontal = $true,
        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [nullable[RGBColors]] $DataLabelsColor,

        [switch] $Distributed,

        #[string] $Formatter,

        [ValidateSet('top', 'right', 'bottom', '')][string] $LegendPosition = '',

        [Array] $Data,
        [Array] $DataNames,
        [Array] $DataLegend

    )




    $Options = [ordered] @{}
    New-ChartBar -Options $Options -Horizontal $Horizontal -DataLabelsEnabled $DataLabelsEnabled `
        -DataLabelsOffsetX $DataLabelsOffsetX -DataLabelsFontSize $DataLabelsFontSize -DataLabelsColor $DataLabelsColor `
        -Data $Data -DataNames $DataNames -DataLegend $DataLegend -Title $Title -TitleAlignment $TitleAlignment `
        -LegendPosition $LegendPosition -Type $Type -Colors $Colors `
        -PatternedColors:$PatternedColors -Distributed:$Distributed
    #-Formatter $Formatter


    <#
    if ('bar', 'line' -contains $Type) {
        # Some types require a more complicated dataset
        $Options.series = @( New-HTMLChartDataSet -Data $Data -DataNames $DataNames )
    } else {
        # Some types of charts require simple data sets - in particular just array
        $Options.series = $Data
        if ($null -ne $DataCategories) {
            $Options.labels = $DataCategories
        } else {
            $Options.labels = $DataNames
        }
    }

    # X AXIS - CATEGORIES
    $Options.xaxis = [ordered] @{}
    if ($DataCategoriesType -ne '') {
        $Options.xaxis.type = $DataCategoriesType
    }
    if ($DataCategories.Count -gt 0) {
        $Options.xaxis.categories = $DataCategories
    }

    # LINE Definition
    $Options.stroke = [ordered] @{
        show   = $LineShow
        curve  = $LineCurve
        width  = $LineWidth
        colors = @(ConvertFrom-Color -Color $LineColor)
    }


    $Options.legend = @{
        position = 'right'
        offsetY  = 100
        height   = 230
    }



#>
    New-ChartSize -Options $Options -Height $Height -Width $Width
    New-ChartToolbar -Options $Options
    New-ApexChart -Positioning $Positioning -Options $Options
}