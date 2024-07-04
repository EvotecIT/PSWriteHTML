function New-TablePercentageBar {
    <#
    .SYNOPSIS
    Creates a new table percentage bar object with specified attributes.

    .DESCRIPTION
    This function creates a new table percentage bar object with the provided attributes. It allows customization of the appearance of the percentage bar within a table.

    .PARAMETER ColumnID
    Specifies the ID of the column where the percentage bar will be displayed.

    .PARAMETER ColumnName
    Specifies the name of the column where the percentage bar will be displayed.

    .PARAMETER Type
    Specifies the shape of the percentage bar. Valid values are 'square' or 'round'.

    .PARAMETER TextColor
    Specifies the color of the text within the percentage bar.

    .PARAMETER BorderColor
    Specifies the color of the border of the percentage bar.

    .PARAMETER BorderStyle
    Specifies the style of the border of the percentage bar. Valid values are 'solid', 'outset', 'groove', or 'ridge'.

    .PARAMETER BarColor
    Specifies the color of the percentage bar itself.

    .PARAMETER BackgroundColor
    Specifies the background color of the percentage bar.

    .PARAMETER RoundValue
    Specifies the decimal places to round the percentage value to.

    .PARAMETER ConditionalFormatting
    Specifies any conditional formatting rules for the percentage bar.

    .EXAMPLE
    New-TablePercentageBar -ColumnID 1 -ColumnName "Progress" -Type 'round' -TextColor "#ffffff" -BorderColor "#000000" -BorderStyle 'solid' -BarColor "#00ff00" -BackgroundColor "#ffffff" -RoundValue 2

    Description:
    Creates a new table percentage bar object for the column "Progress" with specified attributes.

    .NOTES
    Additional notes about the function.
    #>
    [alias('TablePercentageBar', 'New-HTMLTablePercentageBar')]
    [CmdletBinding()]
    param(
        [scriptblock] $ConditionalFormatting,
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

    if ($ConditionalFormatting) {
        $OutputConditions = & $ConditionalFormatting
        [Array] $Conditions = foreach ($OutputCondition in $OutputConditions) {
            if ($OutputCondition.Type -eq 'TablePercentageBarCondition') {
                $OutputCondition.Output
            }
        }
    }

    $Output = [PSCustomObject]@{
        Type   = 'TablePercentageBar'
        Output = @{
            ColumnID              = $ColumnID
            ColumnName            = $ColumnName
            Type                  = $Type
            TextColor             = ConvertFrom-Color -Color $TextColor
            BorderColor           = ConvertFrom-Color -Color $BorderColor
            BarColor              = ConvertFrom-Color -Color $BarColor
            BackgroundColor       = ConvertFrom-Color -Color $BackgroundColor
            RoundValue            = $RoundValue
            BorderStyle           = $BorderStyle
            ConditionalFormatting = $Conditions
        }
    }
    Remove-EmptyValue -Hashtable $Output.Output
    $Output
}

Register-ArgumentCompleter -CommandName New-TablePercentageBar -ParameterName TextColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TablePercentageBar -ParameterName BorderColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TablePercentageBar -ParameterName BarColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TablePercentageBar -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors