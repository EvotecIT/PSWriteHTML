function New-ChartInternalStroke {
    <#
    .SYNOPSIS
    Creates a new internal stroke for a chart.

    .DESCRIPTION
    This function creates a new internal stroke for a chart based on the provided parameters.

    .PARAMETER Stroke
    Specifies the stroke properties to be set for the chart.

    .EXAMPLE
    $strokeParams = @{
        curve     = "smooth"
        lineCap   = "round"
        colors    = "blue", "green", "red"
        width     = 2
        dashArray = 5, 10
    }
    $newStroke = New-ChartInternalStroke -Stroke $strokeParams
    #>
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
            $LineStroke.colors = @($Stroke.colors)
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