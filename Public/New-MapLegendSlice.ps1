function New-MapLegendSlice {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER Label
    The label of the slice for the legend

    .PARAMETER FillColor
    Parameter description

    .PARAMETER MinimumValue
    The minimal value for the interval defining the slice

    .PARAMETER MaximumValue
    The maximal value for the interval defining the slice

    .PARAMETER Value
    The value for the slice. This option can be used instead of the 'min' and 'max' options in order to set a fixed value instead of an interval of values for the slice.

    .PARAMETER DisplayInLegend
    Display the slice in the legend (Boolean, default : true)

    .PARAMETER InitializeClicked
    Set to true in order to initialize the legend item in the 'clicked' state on the map load. (Boolean, default : false)

    .EXAMPLE
    An example

    .NOTES
    General notes
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