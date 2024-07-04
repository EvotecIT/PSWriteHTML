function New-ChartRadial {
    <#
    .SYNOPSIS
    Creates a new radial chart object.

    .DESCRIPTION
    This function creates a new radial chart object with the specified Name, Value, and Color.

    .PARAMETER Name
    Specifies the name of the radial chart.

    .PARAMETER Value
    Specifies the value of the radial chart.

    .PARAMETER Color
    Specifies the color of the radial chart. If not provided, the default color is used.

    .EXAMPLE
    PS C:\> New-ChartRadial -Name "Chart1" -Value 75 -Color "Blue"
    Creates a new radial chart object named "Chart1" with a value of 75 and a blue color.

    .EXAMPLE
    PS C:\> New-ChartRadial -Name "Chart2" -Value 50
    Creates a new radial chart object named "Chart2" with a value of 50 using the default color.

    #>
    [alias('ChartRadial')]
    [CmdletBinding()]
    param(
        [string] $Name,
        [object] $Value,
        [string] $Color
    )
    [PSCustomObject] @{
        ObjectType = 'Radial'
        Name       = $Name
        Value      = $Value
        Color      = if ($Color) { ConvertFrom-Color -Color $Color } else { $null }
    }
}

Register-ArgumentCompleter -CommandName New-ChartRadial -ParameterName Color -ScriptBlock $Script:ScriptBlockColors