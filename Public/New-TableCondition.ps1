function New-TableCondition {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER Name
    Parameter description

    .PARAMETER HighlightHeaders
    By default Name parameter is used as column to be highlighted. In case you want to specify different header(s) to be highlighted you can use this parameter.

    .PARAMETER ComparisonType
    Parameter description

    .PARAMETER Operator
    Parameter description

    .PARAMETER Value
    Parameter description

    .PARAMETER Row
    Parameter description

    .PARAMETER Inline
    Parameter description

    .PARAMETER CaseSensitive
    Parameter description

    .PARAMETER DateTimeFormat
    Parameter description

    .PARAMETER ReverseCondition
    By default ColumnValue (left side) is being compared to Condition Value (right side). This switch reverses the comparison

    .PARAMETER Color
    Parameter description

    .PARAMETER BackgroundColor
    Parameter description

    .PARAMETER FontSize
    Parameter description

    .PARAMETER FontWeight
    Parameter description

    .PARAMETER FontStyle
    Parameter description

    .PARAMETER FontVariant
    Parameter description

    .PARAMETER FontFamily
    Parameter description

    .PARAMETER Alignment
    Parameter description

    .PARAMETER TextDecoration
    Parameter description

    .PARAMETER TextTransform
    Parameter description

    .PARAMETER Direction
    Parameter description

    .PARAMETER FailColor
    Parameter description

    .PARAMETER FailBackgroundColor
    Parameter description

    .PARAMETER FailFontSize
    Parameter description

    .PARAMETER FailFontWeight
    Parameter description

    .PARAMETER FailFontStyle
    Parameter description

    .PARAMETER FailFontVariant
    Parameter description

    .PARAMETER FailFontFamily
    Parameter description

    .PARAMETER FailAlignment
    Parameter description

    .PARAMETER FailTextDecoration
    Parameter description

    .PARAMETER FailTextTransform
    Parameter description

    .PARAMETER FailDirection
    Parameter description

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [alias('EmailTableCondition', 'TableConditionalFormatting', 'New-HTMLTableCondition', 'TableCondition')]
    [CmdletBinding()]
    param(
        [parameter(Mandatory)][alias('ColumnName')][string] $Name,
        [string[]] $HighlightHeaders,
        [alias('Type')][ValidateSet('number', 'string', 'bool', 'date')][string] $ComparisonType = 'string',
        [ValidateSet('lt', 'le', 'eq', 'ge', 'gt', 'ne', 'contains', 'like', 'notlike', 'notcontains', 'between', 'betweenInclusive', 'in', 'notin')][string] $Operator = 'eq',
        [parameter(Mandatory)][Object] $Value,
        [switch] $Row,
        [switch] $Inline,
        [switch] $CaseSensitive,
        [string] $DateTimeFormat,
        [switch] $ReverseCondition,
        # Style for PASS
        [string]$Color,
        [string]$BackgroundColor,
        [object] $FontSize,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [ValidateSet('normal', 'italic', 'oblique')][string] $FontStyle,
        [ValidateSet('normal', 'small-caps')][string] $FontVariant,
        [string] $FontFamily,
        [ValidateSet('left', 'center', 'right', 'justify')][string] $Alignment,
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string] $TextDecoration,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransform,
        [ValidateSet('rtl')][string] $Direction,
        # Style for FAIL
        [string]$FailColor,
        [string]$FailBackgroundColor,
        [object] $FailFontSize,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FailFontWeight,
        [ValidateSet('normal', 'italic', 'oblique')][string] $FailFontStyle,
        [ValidateSet('normal', 'small-caps')][string] $FailFontVariant,
        [string] $FailFontFamily,
        [ValidateSet('left', 'center', 'right', 'justify')][string] $FailAlignment,
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string] $FailTextDecoration,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $FailTextTransform,
        [ValidateSet('rtl')][string] $FailDirection
    )

    $Script:HTMLSchema.Features.DataTablesConditions = $true

    $Style = @{
        Color           = $Color
        BackGroundColor = $BackGroundColor
        FontSize        = $FontSize
        FontWeight      = $FontWeight
        FontStyle       = $FontStyle
        FontVariant     = $FontVariant
        FontFamily      = $FontFamily
        Alignment       = $Alignment
        TextDecoration  = $TextDecoration
        TextTransform   = $TextTransform
        Direction       = $Direction
    }
    Remove-EmptyValue -Hashtable $Style

    $FailStyle = @{
        Color           = $FailColor
        BackGroundColor = $FailBackGroundColor
        FontSize        = $FailFontSize
        FontWeight      = $FailFontWeight
        FontStyle       = $FailFontStyle
        FontVariant     = $FailFontVariant
        FontFamily      = $FailFontFamily
        Alignment       = $FailAlignment
        TextDecoration  = $FailTextDecoration
        TextTransform   = $FailTextTransform
        Direction       = $FailDirection
    }
    Remove-EmptyValue -Hashtable $FailStyle

    $TableCondition = [PSCustomObject] @{
        ConditionType    = 'Condition'
        Row              = $Row
        Type             = $ComparisonType
        Name             = $Name
        Operator         = $Operator
        Value            = $Value
        Style            = ConvertTo-HTMLStyle @Style
        FailStyle        = ConvertTo-HTMLStyle @FailStyle
        HighlightHeaders = $HighlightHeaders
        CaseSensitive    = $CaseSensitive.IsPresent
        DateTimeFormat   = $DateTimeFormat
        ReverseCondition = $ReverseCondition.IsPresent
    }
    [PSCustomObject] @{
        Type   = if ($Inline) { 'TableConditionInline' } else { 'TableCondition' }
        Output = $TableCondition
    }
}

Register-ArgumentCompleter -CommandName New-TableCondition -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TableCondition -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TableCondition -ParameterName FailColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TableCondition -ParameterName FailBackgroundColor -ScriptBlock $Script:ScriptBlockColors