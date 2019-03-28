function New-HTMLChartRadial {
    [CmdletBinding()]
    param(
        [nullable[int]] $Height = 350,
        [nullable[int]] $Width,
        [string] $Type = 'radialBar',
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
            radialBar = @{
                #startAngle = -135
                #endAngle   = 225

                startAngle = -135
                endAngle   = 135


                hollow     = @{
                    margin       = 0
                    size         = '70%'
                    background   = '#fff'
                    image        = 'undefined'
                    imageOffsetX = 0
                    imageOffsetY = 0
                    position     = 'front'
                    dropShadow   = @{
                        enabled = $true
                        top     = 3
                        left    = 0
                        blur    = 4
                        opacity = 0.24
                    }
                }
                track      = @{
                    background  = '#fff'
                    strokeWidth = '70%'
                    margin      = 0  #// margin is in pixels
                    dropShadow  = @{
                        enabled = $true
                        top     = -3
                        left    = 0
                        blur    = 4
                        opacity = 0.35
                    }
                }
                dataLabels = @{
                    showOn = 'always'

                    name   = @{
                        # fontSize = '16px'
                        # color    = 'undefined'
                        offsetY = 120
                    }
                    value  = @{
                        offsetY = 76
                        #  fontSize  = '22px'
                        #  color     = 'undefined'
                        # formatter = 'function (val) { return val + "%" }'
                    }

                    total  = @{
                        show  = $false
                        label = 'Average'
                    }
                }
            }
        }

        $Options.fill = @{
            type     = 'gradient'
            gradient = @{
                shade            = 'dark'
                type             = 'horizontal'
                shadeIntensity   = 0.5
                gradientToColors = @('#ABE5A1')
                inverseColors    = true
                opacityFrom      = 1
                opacityTo        = 1
                stops            = @(0, 100)
            }
        }
        <# Gradient
            $Options.stroke = @{
            lineCap = 'round'
        }
        #>
        <#
        $Options.fill = @{
            type     = 'gradient'
            gradient = @{
                shade          = 'dark'
                shadeIntensity = 0.15
                inverseColors  = false
                opacityFrom    = 1
                opacityTo      = 1
                stops          = @(0, 50, 65, 91)
            }
        }
        #>
        $Options.stroke = @{
            dashArray = 4
        }

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
        #>
        $Options.series = @(95)
        $Options.labels = @('Cricket', 'ello')

        <#
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