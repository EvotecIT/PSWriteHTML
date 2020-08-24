function New-ChartInternalTimeLine {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [string] $Color,
        [string] $Title,
        [string] $SubTitle,
        [int] $FontSizeTitle = 24,
        [int] $FontSizeSubtitle = 14,
        [Array] $Data
    )
    if ($Data.Count -eq 0) {
        Write-Warning 'New-ChartInternalTimeLine - Data Empty'
    }

    if ($null -ne $Color) {
        $ColorRGB = ConvertFrom-Color -Color $Color
        $Options.colors = @($ColorRGB)
    }
    $Options.chart = [ordered] @{
        type = 'rangeBar'
    }
    #$Options.stroke = @{
    #    curve = 'straight'
    #}
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
    #$Options.yaxis = @{
    #    min = 0
    #}
    #$Options.fill = @{
    #    opacity = 0.3
    #}
    $Options.plotOptions = @{
        bar = @{
            horizontal  = $true
            distributed = $true
            dataLabels  = @{
                hideOverflowingLabels = $false
            }
        }
    }
    $Options.xaxis = @{
        type = 'datetime'
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