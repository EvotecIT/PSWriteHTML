
function New-ChartInternalRadialType2 {
    <#
    .SYNOPSIS
    Creates a radial type 2 chart with customizable options.

    .DESCRIPTION
    The New-ChartInternalRadialType2 function creates a radial type 2 chart based on the provided values and names. It allows customization of various options such as plot angles, hollow settings, and more.

    .PARAMETER Options
    A dictionary containing options for the chart.

    .PARAMETER Values
    An array of values to be displayed on the chart.

    .PARAMETER Names
    An array of names corresponding to the values.

    .EXAMPLE
    New-ChartInternalRadialType2 -Options @{ plotOptions = @{ radialBar = @{ startAngle = -135; endAngle = 135; hollow = @{ margin = 0; size = '70%'; background = '#fff'; image = 'undefined'; imageOffsetX = 0; imageOffsetY = 0; position = 'front'; dropShadow = @{ enabled = $true; top = 3; left = 0; blur = 4; opacity = 0.24; } } } } } -Values @(10, 20, 30) -Names @('A', 'B', 'C')
    Creates a radial type 2 chart with values 10, 20, and 30 displayed as A, B, and C respectively.

    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [Array] $Values,
        [Array] $Names
    )
    $Options.plotOptions = @{
        radialBar = [ordered] @{

            #startAngle = -135
            #endAngle   = 225

            #startAngle = -135
            #endAngle   = 135


            hollow = [ordered] @{
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
            <#
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
            #>
        }
    }
}
