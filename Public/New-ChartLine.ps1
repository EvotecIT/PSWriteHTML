function New-ChartLine {
    <#
    .SYNOPSIS
    Add a line to a chart

    .DESCRIPTION
    Add a line to a chart

    .PARAMETER Name
    Name of the line

    .PARAMETER Value
    Values to display

    .PARAMETER Color
    Colors to fill the border for paths.

    .PARAMETER Curve
    Whether to draw smooth lines or straight lines

    .PARAMETER Width
      Sets the width of border for svg path

    .PARAMETER Cap
    For setting the starting and ending points of stroke

    .PARAMETER Dash
    Creates dashes in borders of svg path. Higher number creates more space between dashes in the border.

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [alias('ChartLine')]
    [CmdletBinding()]
    param(
        [string] $Name,
        [object] $Value,
        [string] $Color,
        [ValidateSet('straight', 'smooth', 'stepline')] $Curve,
        [System.Nullable[int]] $Width,
        [ValidateSet('butt', 'square', 'round')][string] $Cap,
        [System.Nullable[int]] $Dash
    )
    $Object = [PSCustomObject] @{
        ObjectType = 'Line'

        Name       = $Name
        Value      = $Value
        #LineColor  = $Color
        #LineCurve  = $Curve
        #LineWidth  = $Width
        #LineCap    = $Cap
        #LineDash   = $Dash

        series     = [ordered] @{
            name = $Name
            type = 'line'
            data = $Value
        }
        stroke     = [ordered] @{
            curve     = $Curve
            lineCap   = $Cap
            colors    = ConvertFrom-Color -Color $Color
            width     = $Width
            dashArray = $Dash
        }
    }
    Remove-EmptyValue -Hashtable $Object.Series
    Remove-EmptyValue -Hashtable $Object.Stroke
    $Object
}

Register-ArgumentCompleter -CommandName New-ChartLine -ParameterName Color -ScriptBlock $Script:ScriptBlockColors