function New-HTMLChart {
    [CmdletBinding()]
    param(
        [nullable[int]] $Height = 350,
        [nullable[int]] $Width,
        [string] $Type = 'bar',
        [bool] $Horizontal = $true,
        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [RGBColors] $DataLabelsColor,
        [Array] $Data = @(),
        [Array] $DataNames = @(),
        [Array] $DataCategories = @(),
        [ValidateSet('datetime', 'category', 'numeric')][string] $DataCategoriesType = 'category',
        [string] $TitleText,
        [ValidateSet('center', 'left', 'right', '')][string] $TitleAlignment = '',

        [bool] $LineShow = $true,
        [ValidateSet('straight', 'smooth')] $LineCurve = 'straight',
        $LineWidth = 2,
        [RGBColors[]] $LineColor,
        [ValidateSet('', 'central')][string] $Positioning
    )
    $Script:HTMLSchema.Features.ChartsApex = $true


    $ID = "ChartID-" + (Get-RandomStringName -Size 8)

    $Div = New-HTMLTag -Tag 'div' -Attributes @{ id = $ID; class = $Positioning }
    $Script = New-HTMLTag -Tag 'script' -Value {

        $Options = [ordered] @{}

        # Chart defintion type, size
        $Options.chart = @{
            type = $Type
        }
        if ($null -ne $Height) {
            $Options.chart.height = $Height
        }
        if ($null -ne $Width) {
            $Options.chart.width = $Width
        }
        $Options.chart.toolbar = [ordered] @{
            show         = $true
            tools        = [ordered] @{
                download  = $true
                selection = $true
                zoom      = $true
                zoomin    = $true
                zoomout   = $true
                pan       = $true
                reset     = $true
            }
            autoSelected = 'zoom'
        }



        $Options.plotOptions = @{
            bar = @{
                horizontal = $Horizontal
            }
        }
        $Options.dataLabels = [ordered] @{
            enabled = $DataLabelsEnabled
            offsetX = $DataLabelsOffsetX
            style   = @{
                fontSize = $DataLabelsFontSize
                colors   = @($DataLabelsColor)
            }
        }
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

        # title
        $Options.title = [ordered] @{}
        if ($TitleText -ne '') {
            $Options.title.text = $TitleText
        }
        if ($TitleAlignment -ne '') {
            $Options.title.align = $TitleAlignment
        }

        # Convert Dictionary to JSON and return chart within SCRIPT tag
        # Make sure to return with additional empty string
        $JSON = $Options | ConvertTo-Json -Depth 5
        "var options = $JSON"
        ""
        "var chart = new ApexCharts(document.querySelector('#$ID'),
            options
        );"
        "chart.render();"
    }
    $Div
    # we need to move it to the end of the code therefore using additional vesel
    $Script:HTMLSchema.Charts.Add($Script)
}