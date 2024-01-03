function New-ChartInternalSpark {
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