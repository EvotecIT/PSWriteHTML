function New-ChartSpark {
    <#
    .SYNOPSIS
    Creates a new spark chart object.

    .DESCRIPTION
    This function creates a new spark chart object with the specified Name, Value, and Color.

    .PARAMETER Name
    Specifies the name of the spark chart.

    .PARAMETER Value
    Specifies the value of the spark chart.

    .PARAMETER Color
    Specifies the color of the spark chart.

    .EXAMPLE
    PS C:\> New-ChartSpark -Name "Spark1" -Value 100 -Color "Green"
    Creates a new spark chart object named "Spark1" with a value of 100 and a green color.

    .EXAMPLE
    PS C:\> New-ChartSpark -Name "Spark2" -Value 50
    Creates a new spark chart object named "Spark2" with a value of 50 using the default color.
    #>
    [alias('ChartSpark')]
    [CmdletBinding()]
    param(
        [string] $Name,
        [object] $Value,
        [string] $Color
    )

    [PSCustomObject] @{
        ObjectType = 'Spark'
        Name       = $Name
        Value      = $Value
        Color      = $Color
    }
}

Register-ArgumentCompleter -CommandName New-ChartSpark -ParameterName Color -ScriptBlock $Script:ScriptBlockColors