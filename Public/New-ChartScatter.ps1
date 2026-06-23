function New-ChartScatter {
    <#
    .SYNOPSIS
    Adds a scatter series to a chart.

    .DESCRIPTION
    Adds an ApexCharts scatter series. Provide X and Y arrays for the common case,
    or pass raw ApexCharts-compatible points through Data.

    .EXAMPLE
    New-ChartScatter -Name 'Samples' -X 1, 2, 3 -Y 10, 25, 18 -Color Purple
    #>
    [alias('ChartScatter')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string] $Name,
        [object[]] $X,
        [object[]] $Y,
        [object] $Data,
        [string] $Color
    )

    [PSCustomObject] @{
        ObjectType = 'Scatter'
        Color      = ConvertFrom-Color -Color $Color
        series     = [ordered] @{
            name = $Name
            type = 'scatter'
            data = @(ConvertTo-ChartSeriesData -Data $Data -X $X -Y $Y)
        }
    }
}

Register-ArgumentCompleter -CommandName New-ChartScatter -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
