function New-ChartInternalStroke {
    [CmdletBinding()]
    param(
        [Array] $Stroke
    )

    if ($Stroke.Count -eq 0) {
        $LineStroke = $null
    } else {
        $LineStroke = [ordered] @{
            curve     = $null
            lineCap   = $null
            colors    = $null
            width     = $null
            dashArray = $null
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
    }
    $LineStroke
}