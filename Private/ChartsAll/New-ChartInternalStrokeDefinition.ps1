function New-ChartInternalStrokeDefinition {
    param(
        [System.Collections.IDictionary] $Options,
        [bool] $LineShow = $true,
        [ValidateSet('straight', 'smooth', 'stepline')][string[]] $LineCurve,
        [int[]] $LineWidth,
        [ValidateSet('butt', 'square', 'round')][string[]] $LineCap,
        [RGBColors[]] $LineColor,
        [int[]] $LineDash
    )
    # LINE Definition
    $Options.stroke = [ordered] @{
        show = $LineShow
    }
    if ($LineCurve.Count -gt 0) {
        $Options.stroke.curve = $LineCurve
    }
    if ($LineWidth.Count -gt 0) {
        $Options.stroke.width = $LineWidth
    }
    if ($LineColor.Count -gt 0) {
        $Options.stroke.colors = @(ConvertFrom-Color -Color $LineColor)
    }
    if ($LineCap.Count -gt 0) {
        $Options.stroke.lineCap = $LineCap
    }
    if ($LineDash.Count -gt 0) {
        $Options.stroke.dashArray = $LineDash
    }
}