function New-ChartInternalGradient {
    <#
    .SYNOPSIS
    Creates a new internal gradient configuration for a chart with the specified settings.

    .DESCRIPTION
    This function creates a new internal gradient configuration for a chart with the provided options. It allows customization of the gradient appearance and behavior.

    .PARAMETER Options
    Specifies the options for configuring the internal gradient. This should be a dictionary containing the necessary settings for the gradient.

    .EXAMPLE
    $gradientOptions = @{
        fill = @{
            type = 'gradient'
            gradient = @{
                shade = 'dark'
                type = 'horizontal'
                shadeIntensity = 0.5
                #gradientToColors = @('#ABE5A1')
                inverseColors = $false
                opacityFrom = 1
                opacityTo = 1
                stops = @(0, 100)
            }
        }
    }
    New-ChartInternalGradient -Options $gradientOptions

    Creates a new internal gradient configuration with a dark horizontal gradient, shade intensity of 0.5, and opacity from 1 to 1.
    #>
    [CmdletBinding()]
    param(

    )
    $Options.fill = [ordered] @{
        type     = 'gradient'
        gradient = [ordered] @{
            shade            = 'dark'
            type             = 'horizontal'
            shadeIntensity   = 0.5
            #gradientToColors = @('#ABE5A1')
            inverseColors    = $false
            opacityFrom      = 1
            opacityTo        = 1
            stops            = @(0, 100)
        }
    }
}
