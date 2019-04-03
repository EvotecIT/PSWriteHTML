function New-ChartGridColors {
    param(
        [System.Collections.IDictionary] $Options,
        [RGBColors[]] $GridColors,
        [double] $GridOpacity
    )
    $Options.grid = @{}
    $Options.grid.row = @{}

    if ($GridColors.Count -gt 0) {
        $Options.grid.row.colors = @(ConvertFrom-Color -Color $GridColors)
    }
    if ($GridOpacity -ne 0) {
        $Options.grid.row.opacity = $GridOpacity
    }
}

