function New-TablePercentageBar {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER ColumnID
    Parameter description

    .PARAMETER ColumnName
    Parameter description

    .PARAMETER Type
    Parameter description

    .PARAMETER TextColor
    Parameter description

    .PARAMETER BorderColor
    Parameter description

    .PARAMETER BorderStyle
    Parameter description

    .PARAMETER BarColor
    Parameter description

    .PARAMETER BackgroundColor
    Parameter description

    .PARAMETER RoundValue
    Parameter description

    .PARAMETER ConditionalFormatting


    .EXAMPLE
    An example

    .NOTES
    General notes
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