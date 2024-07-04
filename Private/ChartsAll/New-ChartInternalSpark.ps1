function New-ChartInternalSpark {
    <#
    .SYNOPSIS
    Creates a sparkline chart with customizable options.

    .DESCRIPTION
    The New-ChartInternalSpark function creates a sparkline chart with customizable options such as colors, values, and chart type. It generates a sparkline chart that can be used to visualize data trends in a compact format.

    .PARAMETER Options
    A dictionary containing various options for customizing the sparkline chart.

    .PARAMETER Color
    An array of colors to be used in the sparkline chart.

    .PARAMETER Values
    An array of values to be plotted on the sparkline chart.

    .EXAMPLE
    $options = @{
        chart = @{
            type = 'area'
            sparkline = @{
                enabled = $true
            }
        }
        stroke = @{
            curve = 'straight'
        }
        fill = @{
            opacity = 0.3
        }
    }
    $color = @('red', 'blue', 'green')
    $values = @(
        @{
            Name = 'Series 1'
            Values = @(10, 20, 30, 40, 50)
        }
        @{
            Name = 'Series 2'
            Values = @(5, 15, 25, 35, 45)
        }
    )
    New-ChartInternalSpark -Options $options -Color $color -Values $values

    #>
    
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [string[]] $Color,
        [Array] $Values
    )
    if ($Values.Count -eq 0) {
        Write-Warning 'Get-ChartSpark - Values Empty'
    }

    if ($null -ne $Color) {
        $ColorRGB = ConvertFrom-Color -Color $Color
        $Options.colors = @($ColorRGB)
    }
    $Options.chart.type = 'area'
    $Options.chart.sparkline = @{
        enabled = $true
    }
    $Options.stroke = @{
        curve = 'straight'
    }
    $Options.fill = @{
        opacity = 0.3
    }
    $Options.series = @(
        # Checks if it's multiple array passed or just one. If one it will draw one line, if more then one it will draw line per each array
        foreach ($Data in $Values) {
            [ordered] @{
                name = $Data.Name
                data = @($Data.Values)
            }
        }
    )
}

Register-ArgumentCompleter -CommandName New-ChartInternalSpark -ParameterName Color -ScriptBlock $Script:ScriptBlockColors