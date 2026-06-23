function New-ChartHeatmap {
    <#
    .SYNOPSIS
    Adds a heatmap row series to a chart.

    .DESCRIPTION
    Adds one ApexCharts heatmap row. Use X and Y arrays for category/value pairs,
    a dictionary for category/value data, or raw ApexCharts-compatible points.

    .EXAMPLE
    New-ChartHeatmap -Name 'Monday' -X 'AM', 'PM' -Y 12, 18
    #>
    [alias('ChartHeatmap')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string] $Name,
        [object[]] $X,
        [object[]] $Y,
        [object] $Data,
        [string] $Color
    )

    [PSCustomObject] @{
        ObjectType = 'Heatmap'
        Color      = ConvertFrom-Color -Color $Color
        series     = [ordered] @{
            name = $Name
            data = @(ConvertTo-ChartSeriesData -Data $Data -X $X -Y $Y -Heatmap)
        }
    }
}

Register-ArgumentCompleter -CommandName New-ChartHeatmap -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
