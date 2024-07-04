function New-ChartInternalTimeLine {
    <#
    .SYNOPSIS
    Creates a time-based line chart with customizable options.

    .DESCRIPTION
    The New-ChartInternalTimeLine function creates a time-based line chart with customizable options such as colors, data points, and axis limits. It generates a line chart that visualizes data trends over time.

    .PARAMETER Options
    A dictionary containing various options for customizing the line chart.

    .PARAMETER Color
    The color to be used in the line chart.

    .PARAMETER Data
    An array of data points to be plotted on the line chart.

    .PARAMETER Min
    The minimum value for the y-axis.

    .PARAMETER Max
    The maximum value for the y-axis.

    .EXAMPLE
    $options = @{
        chart = @{
            type = 'line'
        }
    }
    $color = 'blue'
    $data = @(10, 20, 30, 40, 50)
    $min = 0
    $max = 60
    New-ChartInternalTimeLine -Options $options -Color $color -Data $data -Min $min -Max $max
    # Creates a time-based line chart with blue color, data points, and specified axis limits.
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [string] $Color,
        [Array] $Data,
        [Int64] $Min,
        [Int64] $Max
    )

    if ($Data.Count -eq 0) {
        Write-Warning 'New-ChartInternalTimeLine - Data Empty'
    }

    if ($null -ne $Color) {
        $ColorRGB = ConvertFrom-Color -Color $Color
        $Options.colors = @($ColorRGB)
    }
    $Options.plotOptions = @{
        bar = @{
            horizontal  = $true
            distributed = $true
            dataLabels  = @{
                hideOverflowingLabels = $false
            }
        }
    }
    $Options.series = @(
        @{
            data = @(
                foreach ($Value in $Data) {
                    $Value
                }
            )

        }
    )
}

Register-ArgumentCompleter -CommandName New-ChartInternalSpark -ParameterName Color -ScriptBlock $Script:ScriptBlockColors