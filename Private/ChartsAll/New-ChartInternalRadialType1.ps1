
function New-ChartInternalRadialType1 {
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
            track  = [ordered] @{
                background  = '#fff'
                strokeWidth = '70%'
                margin      = 0  #// margin is in pixels
                dropShadow  = [ordered] @{
                    enabled = $true
                    top     = -3
                    left    = 0
                    blur    = 4
                    opacity = 0.35
                }
            }
            <#
            dataLabels = @{
                showOn = 'always'

                name   = @{
                    # fontSize = '16px'
                    # color    = 'undefined'
                    #offsetY = 120
                }
                value  = @{
                    #offsetY = 76
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

    $Options.fill = [ordered] @{
        type     = 'gradient'
        gradient = [ordered] @{
            shade            = 'dark'
            type             = 'horizontal'
            shadeIntensity   = 0.5
            #gradientToColors = @('#ABE5A1')
            inverseColors    = $true
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
            inverseColors  = $false
            opacityFrom    = 1
            opacityTo      = 1
            stops          = @(0, 50, 65, 91)
        }
    }
    #>
    $Options.stroke = [ordered] @{
        dashArray = 4
    }
}
