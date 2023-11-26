function New-ChartInternalGradient {
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
