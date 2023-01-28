function New-ChartBar {
    [alias('ChartBar')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string] $Name,
        [Parameter(Mandatory)][object] $Value,
        [string[]] $Color
    )
    $Object = [ordered] @{
        ObjectType = 'Bar'
        Name       = $Name
        Value      = $Value
        series     = [ordered]@{
            name = $Name
            type = 'column'
            data = $Value
        }
        Color      = if ($Color) { ConvertFrom-Color -Color $Color } else { $null }
    }
    Remove-EmptyValue -Hashtable $Object -Recursive
    $Object
}

Register-ArgumentCompleter -CommandName New-ChartBar -ParameterName Color -ScriptBlock $Script:ScriptBlockColors