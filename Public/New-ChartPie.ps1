function New-ChartPie {
    <#
    .SYNOPSIS
    Creates a new pie chart with customizable options.

    .DESCRIPTION
    This function creates a new pie chart with the specified name, value, and color. It allows customization of the pie chart appearance.

    .PARAMETER Name
    Specifies the name of the pie chart.

    .PARAMETER Value
    Specifies the value of the pie chart segment.

    .PARAMETER Color
    Specifies the color of the pie chart segment.

    .EXAMPLE
    New-ChartPie -Name "Slice 1" -Value 30 -Color "red"
    Creates a new pie chart segment named "Slice 1" with a value of 30 and colored in red.

    .EXAMPLE
    New-ChartPie -Name "Slice 2" -Value 20 -Color "blue"
    Creates a new pie chart segment named "Slice 2" with a value of 20 and colored in blue.
    #>
    [alias('ChartPie')]
    [CmdletBinding()]
    param(
        [string] $Name,
        [object] $Value,
        [string] $Color
    )
    if ($null -eq $Value) {
        $Value = 0
    }
    [PSCustomObject] @{
        ObjectType = 'Pie'
        Name       = $Name
        Value      = $Value
        Color      = if ($Color) { ConvertFrom-Color -Color $Color } else { $null }
    }
}

Register-ArgumentCompleter -CommandName New-ChartPie -ParameterName Color -ScriptBlock $Script:ScriptBlockColors