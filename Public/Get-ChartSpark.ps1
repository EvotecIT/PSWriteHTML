function Get-ChartSpark {
    param(
        [System.Collections.IDictionary] $Options,
        [nullable[RGBColors]] $Color,
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


function Get-ChartSize {
    param(
        [System.Collections.IDictionary] $Options,
        [nullable[int]] $Height = 350,
        [nullable[int]] $Width
    )
    if ($null -ne $Height) {
        $Options.chart.height = $Height
    }
    if ($null -ne $Width) {
        $Options.chart.width = $Width
    }
}

function Get-ChartToolbar {
    param(
        [System.Collections.IDictionary] $Options,
        [bool] $Show = $true,
        [bool] $Download = $true,
        [bool] $Selection = $true,
        [bool] $Zoom = $true,
        [bool] $ZoomIn = $true,
        [bool] $ZoomOut = $true,
        [bool] $Pan = $true,
        [bool] $Reset = $true
    )
    $Options.chart.toolbar = [ordered] @{
        show         = $show
        tools        = [ordered] @{
            download  = $Download
            selection = $Selection
            zoom      = $Zoom
            zoomin    = $ZoomIn
            zoomout   = $ZoomOut
            pan       = $Pan
            reset     = $Reset
        }
        autoSelected = 'zoom'
    }
}


function Get-ChartTypeSpark {
    param(
        [int[]] $Values
    )

}