function New-ChartInternalSpark {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [string] $Color,
        [string] $Title,
        [string] $SubTitle,
        [int] $FontSizeTitle = 24,
        [int] $FontSizeSubtitle = 14,
        [Array] $Values
    )
    if ($Values.Count -eq 0) {
        Write-Warning 'Get-ChartSpark - Values Empty'
    }

    if ($null -ne $Color) {
        $ColorRGB = ConvertFrom-Color -Color $Color
        $Options.colors = @($ColorRGB)
    }
    $Options.chart = [ordered] @{
        type      = 'area'
        sparkline = @{
            enabled = $true
        }
    }
    $Options.stroke = @{
        curve = 'straight'
    }
    $Options.title = [ordered] @{
        text    = $Title
        offsetX = 0
        style   = @{
            fontSize = "$($FontSizeTitle)px"
            cssClass = 'apexcharts-yaxis-title'
        }
    }
    $Options.subtitle = [ordered] @{
        text    = $SubTitle
        offsetX = 0
        style   = @{
            fontSize = "$($FontSizeSubtitle)px"
            cssClass = 'apexcharts-yaxis-title'
        }
    }
    $Options.yaxis = @{
        min = 0
    }
    $Options.fill = @{
        opacity = 0.3
    }
    $Options.series = @(
        # Checks if it's multiple array passed or just one. If one it will draw one line, if more then one it will draw line per each array
        if ($Values[0] -is [Array]) {
            foreach ($Value in $Values) {
                @{
                    data = @($Value)
                }
            }
        } else {
            @{
                data = @($Values)
            }
        }
    )
}