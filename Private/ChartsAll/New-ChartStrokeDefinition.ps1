function New-ChartInternalStrokeDefinition {
    param(
        [System.Collections.IDictionary] $Options,
        [bool] $LineShow = $true,
        [ValidateSet('straight', 'smooth', 'stepline')] $LineCurve = 'straight',
        [int] $LineWidth,
        [RGBColors[]] $LineColor
    )
    # LINE Definition
    $Options.stroke = [ordered] @{
        show  = $LineShow
        curve = $LineCurve
    }
    if ($LineWidth -ne 0) {
        $Options.stroke.width = $LineWidth
    }
    if ($LineColor.Count -gt 0) {
        $Options.stroke.colors = @(ConvertFrom-Color -Color $LineColor)
    }
}