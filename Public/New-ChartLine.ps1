function New-ChartLine {
    [alias('ChartLine')]
    [CmdletBinding()]
    param(
        [string] $Name,
        [object] $Value,
        [string] $Color,
        [ValidateSet('straight', 'smooth', 'stepline')] $Curve = 'straight',
        [int] $Width = 6,
        [ValidateSet('butt', 'square', 'round')][string] $Cap = 'butt',
        [int] $Dash = 0
    )
    if ($null -eq $Value -or $Value -eq '') {
        $Value = 0
    }
    [PSCustomObject] @{
        ObjectType = 'Line'
        Name       = $Name
        Value      = $Value
        LineColor  = $Color
        LineCurve  = $Curve
        LineWidth  = $Width
        LineCap    = $Cap
        LineDash   = $Dash
    }
}

Register-ArgumentCompleter -CommandName New-ChartLine -ParameterName Color -ScriptBlock $Script:ScriptBlockColors