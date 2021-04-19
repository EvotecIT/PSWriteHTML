function New-ChartInternalStroke {
    [CmdletBinding()]
    param(
        [Array] $Stroke
    )

    if ($Stroke.Count -eq 0) {
        $LineStroke = $null
    } elseif ($Stroke.Count -eq 1) {
        $LineStroke = [ordered] @{
            curve     = [System.Collections.Generic.List[string]]::new()
            lineCap   = [System.Collections.Generic.List[string]]::new()
            colors    = [System.Collections.Generic.List[string]]::new()
            width     = [System.Collections.Generic.List[string]]::new()
            dashArray = [System.Collections.Generic.List[string]]::new()
        }
        if ($Stroke.curve) {
            $LineStroke.curve = $Stroke.curve
        }
        if ($Stroke.lineCap) {
            $LineStroke.lineCap = $Stroke.lineCap
        }
        if ($Stroke.colors) {
            $LineStroke.colors = $Stroke.colors
        }
        if ($Stroke.width) {
            $LineStroke.width = $Stroke.width
        }
        if ($Stroke.dashArray) {
            $LineStroke.dashArray = $Stroke.dashArray
        }
    } else {
        $LineStroke = [ordered] @{
            curve     = [System.Collections.Generic.List[string]]::new()
            lineCap   = [System.Collections.Generic.List[string]]::new()
            colors    = [System.Collections.Generic.List[string]]::new()
            width     = [System.Collections.Generic.List[string]]::new()
            dashArray = [System.Collections.Generic.List[string]]::new()
        }
        if ($Stroke.curve) {
            $LineStroke.curve.Add($Stroke.curve)
        }
        if ($Stroke.lineCap) {
            $LineStroke.lineCap.Add($Stroke.lineCap)
        }
        if ($Stroke.colors) {
            $LineStroke.colors.Add($Stroke.colors)
        }
        if ($Stroke.width) {
            $LineStroke.width.Add($Stroke.width)
        }
        if ($Stroke.dashArray) {
            $LineStroke.dashArray.Add($Stroke.dashArray)
        }
    }
    $LineStroke
}