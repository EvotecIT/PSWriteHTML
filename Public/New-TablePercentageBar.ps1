function New-TablePercentageBar {
    [alias('TablePercentageBar', 'New-HTMLTablePercentageBar')]
    [CmdletBinding()]
    param(
        [int] $ColumnID,
        [string] $ColumnName,
        [ValidateSet('square', 'round')][string] $Type,
        [string] $TextColor,
        [string] $BorderColor,
        [ValidateSet('solid', 'outset', 'groove', 'ridge')][string] $BorderStyle,
        [string] $BarColor,
        [string] $BackgroundColor,
        [int] $RoundValue
    )
    $Output = [PSCustomObject]@{
        Type   = 'TablePercentageBar'
        Output = @{
            ColumnID        = $ColumnID
            ColumnName      = $ColumnName
            Type            = $Type
            TextColor       = ConvertFrom-Color -Color $TextColor
            BorderColor     = ConvertFrom-Color -Color $BorderColor
            BarColor        = ConvertFrom-Color -Color $BarColor
            BackgroundColor = ConvertFrom-Color -Color $BackgroundColor
            RoundValue      = $RoundValue
            BorderStyle     = $BorderStyle
        }
    }
    Remove-EmptyValue -Hashtable $Output.Output
    $Output
}

Register-ArgumentCompleter -CommandName New-TablePercentageBar -ParameterName TextColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TablePercentageBar -ParameterName BorderColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TablePercentageBar -ParameterName BarColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TablePercentageBar -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors