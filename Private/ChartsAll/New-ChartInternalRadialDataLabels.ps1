function New-ChartInternalRadialDataLabels {
    <#
    .SYNOPSIS
    Creates data labels for a radial chart with specified options.

    .DESCRIPTION
    The New-ChartInternalRadialDataLabels function creates data labels for a radial chart with the specified options. It allows customization of the data label appearance including the average label.

    .PARAMETER Options
    An IDictionary containing the options for the data labels.

    .PARAMETER LabelAverage
    Specifies the label to display for the average value.

    .EXAMPLE
    $options = @{}
    New-ChartInternalRadialDataLabels -Options $options -LabelAverage 'Average'
    # Creates data labels for a radial chart with the average label set to 'Average'.
    #>
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