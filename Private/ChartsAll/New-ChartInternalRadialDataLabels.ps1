function New-ChartInternalRadialDataLabels {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [string] $LabelAverage = 'Average'
    )
    if ($LabelAverage -ne '') {
        $Options.plotOptions.radialBar.dataLabels = @{
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
                show  = $true
                label = $LabelAverage
            }

        }
    }
}