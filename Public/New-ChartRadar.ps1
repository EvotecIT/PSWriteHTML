function New-ChartRadar {
    <#
    .SYNOPSIS
    Adds a radar series to a chart.

    .DESCRIPTION
    Adds an ApexCharts radar series. Use New-ChartAxisX to provide spoke labels.

    .EXAMPLE
    New-ChartRadar -Name 'Coverage' -Value 70, 85, 62 -Color Green
    #>
    [alias('ChartRadar')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string] $Name,
        [Parameter(Mandatory)][object] $Value,
        [string] $Color
    )

    [PSCustomObject] @{
        ObjectType = 'Radar'
        Color      = ConvertFrom-Color -Color $Color
        series     = [ordered] @{
            name = $Name
            data = @($Value)
        }
    }
}

Register-ArgumentCompleter -CommandName New-ChartRadar -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
