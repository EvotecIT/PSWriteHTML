function New-ChartBubble {
    <#
    .SYNOPSIS
    Adds a bubble series to a chart.

    .DESCRIPTION
    Adds an ApexCharts bubble series. Provide X, Y, and Z arrays for the common
    case, or pass raw ApexCharts-compatible points through Data.

    .EXAMPLE
    New-ChartBubble -Name 'Risk' -X 1, 2, 3 -Y 20, 30, 15 -Z 5, 12, 8 -Color Orange
    #>
    [alias('ChartBubble')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string] $Name,
        [object[]] $X,
        [object[]] $Y,
        [object[]] $Z,
        [object] $Data,
        [string] $Color
    )

    [PSCustomObject] @{
        ObjectType = 'Bubble'
        Color      = ConvertFrom-Color -Color $Color
        series     = [ordered] @{
            name = $Name
            type = 'bubble'
            data = @(ConvertTo-ChartSeriesData -Data $Data -X $X -Y $Y -Z $Z -Bubble)
        }
    }
}

Register-ArgumentCompleter -CommandName New-ChartBubble -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
