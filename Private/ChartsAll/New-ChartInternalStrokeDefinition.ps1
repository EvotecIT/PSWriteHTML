function New-ChartInternalStrokeDefinition {
    <#
    .SYNOPSIS
    Creates a new stroke definition for a chart with customizable options.

    .DESCRIPTION
    The New-ChartInternalStrokeDefinition function creates a new stroke definition for a chart based on the provided parameters. It allows customization of various stroke properties such as curve, width, color, line cap, and dash array.

    .PARAMETER Options
    The options for the stroke definition.

    .PARAMETER LineShow
    Specifies whether the stroke should be shown. Default is $true.

    .PARAMETER LineCurve
    An array of strings specifying the curve type of the stroke. Valid values are 'straight', 'smooth', 'stepline'.

    .PARAMETER LineWidth
    An array of integers specifying the width of the stroke.

    .PARAMETER LineCap
    An array of strings specifying the line cap style. Valid values are 'butt', 'square', 'round'.

    .PARAMETER LineColor
    An array of strings specifying the color of the stroke.

    .PARAMETER LineDash
    An array of integers specifying the dash array for the stroke.

    .EXAMPLE
    $options = @{
        stroke = @{
            show = $true
            curve = 'smooth'
            width = 2
            colors = 'blue', 'green', 'red'
            lineCap = 'round'
            dashArray = 5, 10
        }
    }
    New-ChartInternalStrokeDefinition -Options $options -LineShow $true -LineCurve 'smooth' -LineWidth 2 -LineCap 'round' -LineColor 'blue', 'green', 'red' -LineDash 5, 10
    # Creates a new stroke definition with specified properties.

    .EXAMPLE
    $options = @{
        stroke = @{
            show = $true
            curve = 'straight'
            width = 1
            colors = 'black'
            lineCap = 'butt'
            dashArray = 2, 4
        }
    }
    New-ChartInternalStrokeDefinition -Options $options -LineShow $true -LineCurve 'straight' -LineWidth 1 -LineCap 'butt' -LineColor 'black' -LineDash 2, 4
    # Creates another stroke definition with different properties.
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [bool] $LineShow = $true,
        [ValidateSet('straight', 'smooth', 'stepline')][string[]] $LineCurve,
        [int[]] $LineWidth,
        [ValidateSet('butt', 'square', 'round')][string[]] $LineCap,
        [string[]] $LineColor,
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
Register-ArgumentCompleter -CommandName New-ChartInternalStrokeDefinition -ParameterName LineColor -ScriptBlock $Script:ScriptBlockColors