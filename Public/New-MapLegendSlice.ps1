function New-MapLegendSlice {
    <#
    .SYNOPSIS
    Creates a new map legend slice.

    .DESCRIPTION
    This function creates a new map legend slice with specified parameters.

    .PARAMETER Label
    The label of the slice for the legend.

    .PARAMETER FillColor
    The color to fill the slice with.

    .PARAMETER MinimumValue
    The minimum value for the interval defining the slice.

    .PARAMETER MaximumValue
    The maximum value for the interval defining the slice.

    .PARAMETER Value
    The fixed value for the slice. Use this instead of 'MinimumValue' and 'MaximumValue' to set a specific value.

    .PARAMETER DisplayInLegend
    Specifies whether to display the slice in the legend. Default is true.

    .PARAMETER InitializeClicked
    Set to true to initialize the legend item in the 'clicked' state on map load. Default is false.

    .EXAMPLE
    New-MapLegendSlice -Label "Slice 1" -FillColor "Blue" -MinimumValue 0 -MaximumValue 100 -DisplayInLegend $true

    .NOTES
    This function is used to create slices for map legends.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][ValidateSet('area', 'plot')]$Type,
        [string] $Label,
        [alias('SliceColor')][string] $FillColor,
        [alias('HoverSliceColor')][string] $HoverFillColor,
        [nullable[int]] $StrokeWidth,
        [string] $Transform,
        [string] $HoverTransform,
        [nullable[int]] $HoverStrokeWidth,
        [nullable[float]] $MinimumValue,
        [nullable[float]] $MaximumValue,
        [nullable[float]] $Value,
        [nullable[bool]] $DisplayInLegend,
        [nullable[bool]] $InitializeClicked,
        [nullable[int]] $Size
    )
    $OutputObject = [ordered] @{
        Type          = if ($Type -eq 'area') { 'MapLegendAreaSlice' } else { 'MapLegendPlotSlice' }
        Configuration = [ordered] @{
            label      = $Label
            attrs      = @{
                fill           = ConvertFrom-Color -Color $FillColor
                'transform'    = $Transform
                'stroke-width' = $StrokeWidth
            }
            attrsHover = @{
                'fill'         = ConvertFrom-Color -Color $HoverFillColor
                'transform'    = $HoverTransform
                'stroke-width' = $HoverStrokeWidth
            }
            min        = $MinimumValue
            max        = $MaximumValue
            sliceValue = $Value
            display    = $DisplayInLegend
            clicked    = $InitializeClicked
            size       = $Size
        }
    }
    Remove-EmptyValue -Hashtable $OutputObject.Configuration -Recursive -Rerun 2
    $OutputObject
}

Register-ArgumentCompleter -CommandName New-MapLegendSlice -ParameterName FillColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-MapLegendSlice -ParameterName HoverFillColor -ScriptBlock $Script:ScriptBlockColors