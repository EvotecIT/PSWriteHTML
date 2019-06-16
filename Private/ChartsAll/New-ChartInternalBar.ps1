Function New-ChartInternalBar {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [bool] $Horizontal = $true,
        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [RGBColors[]] $DataLabelsColor,

        [string] $Title,
        [ValidateSet('center', 'left', 'right', 'default')][string] $TitleAlignment = 'default',

        [string] $Formatter,
        [ValidateSet('bar', 'barStacked', 'barStacked100Percent')] $Type = 'bar',

        [RGBColors[]] $Colors,

        [switch] $PatternedColors,
        [switch] $Distributed,

        [Array] $Data,
        [Array] $DataNames,
        [Array] $DataLegend
    )

    if ($Type -eq 'bar') {
        $Options.chart = [ordered] @{
            type = 'bar'
        }
    } elseif ($Type -eq 'barStacked') {
        $Options.chart = [ordered] @{
            type    = 'bar'
            stacked = $true
        }
    } else {
        $Options.chart = [ordered] @{
            type      = 'bar'
            stacked   = $true
            stackType = '100%'
        }
    }

    if ($Colors.Count -gt 0) {
        $RGBColor = ConvertFrom-Color -Color $Colors
        $Options.colors = @($RGBColor)
    }

    $Options.plotOptions = @{
        bar = @{
            horizontal = $Horizontal
        }
    }
    if ($Distributed) {
        $Options.plotOptions.bar.distributed = $Distributed.IsPresent
    }
    $Options.dataLabels = [ordered] @{
        enabled = $DataLabelsEnabled
        offsetX = $DataLabelsOffsetX
        style   = @{
            fontSize = $DataLabelsFontSize
        }
    }
    if ($null -ne $DataLabelsColor) {
        $RGBColorLabel = ConvertFrom-Color -Color $DataLabelsColor
        $Options.dataLabels.style.colors = @($RGBColorLabel)
    }
    $Options.series = @(New-ChartInternalDataSet -Data $Data -DataNames $DataLegend)

    # X AXIS - CATEGORIES
    $Options.xaxis = [ordered] @{}
    # if ($DataCategoriesType -ne '') {
    #    $Options.xaxis.type = $DataCategoriesType
    #}
    if ($DataNames.Count -gt 0) {
        $Options.xaxis.categories = $DataNames
        # Need to figure out how to conver to json and leave function without ""
        #if ($Formatter -ne '') {
        #$Options.xaxis.labels = @{
        #formatter = "function(val) { return val + `"$Formatter`" }"
        #}
        #}
    }

    New-ChartInternalTitle -Options $Options -Title $Title -TitleAlignment $TitleAlignment

     if ($PatternedColors) {
        $Options.fill = @{
            type    = 'pattern'
            opacity = 1
            pattern = @{
                style = @('circles', 'slantedLines', 'verticalLines', 'horizontalLines')
            }
        }
    }
}