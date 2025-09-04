function New-TableCondition {
    <#
    .SYNOPSIS
    Creates a new table condition with specified parameters and styling options for pass and fail conditions.

    .DESCRIPTION
    This function creates a new table condition with the specified parameters and allows customization of the styling options for both pass and fail conditions.

    .PARAMETER Name
    Specifies the name of the condition.

    .PARAMETER HighlightHeaders
    Specifies an array of headers to highlight based on the condition.

    .PARAMETER ComparisonType
    Specifies the type of comparison to be performed. Valid values are 'number', 'string', 'bool', or 'date'.

    .PARAMETER Operator
    Specifies the comparison operator to be used.

    .PARAMETER Value
    Specifies the value to compare against.

    .PARAMETER Row
    Switch parameter to indicate if the styling should be applied to the entire row.

    .PARAMETER Inline
    Switch parameter to indicate if the styling should be applied inline.

    .PARAMETER CaseSensitive
    Switch parameter to indicate if the comparison should be case-sensitive.

    .PARAMETER DateTimeFormat
    Specifies the format for date and time comparisons.

    .PARAMETER ReverseCondition
    Switch parameter to reverse the comparison logic.

    .PARAMETER Color
    Specifies the text color for pass conditions.

    .PARAMETER BackgroundColor
    Specifies the background color for pass conditions.

    .PARAMETER FontSize
    Specifies the font size for pass conditions.

    .PARAMETER FontWeight
    Specifies the font weight for pass conditions.

    .PARAMETER FontStyle
    Specifies the font style for pass conditions.

    .PARAMETER FontVariant
    Specifies the font variant for pass conditions.

    .PARAMETER FontFamily
    Specifies the font family for pass conditions.

    .PARAMETER Alignment
    Specifies the alignment for pass conditions.

    .PARAMETER TextDecoration
    Specifies the text decoration for pass conditions.

    .PARAMETER TextTransform
    Specifies the text transformation for pass conditions.

    .PARAMETER Direction
    Specifies the text direction for pass conditions.

    .PARAMETER FailColor
    Specifies the text color for fail conditions.

    .PARAMETER FailBackgroundColor
    Specifies the background color for fail conditions.

    .PARAMETER FailFontSize
    Specifies the font size for fail conditions.

    .PARAMETER FailFontWeight
    Specifies the font weight for fail conditions.

    .PARAMETER FailFontStyle
    Specifies the font style for fail conditions.

    .PARAMETER FailFontVariant
    Specifies the font variant for fail conditions.

    .PARAMETER FailFontFamily
    Specifies the font family for fail conditions.

    .PARAMETER FailAlignment
    Specifies the alignment for fail conditions.

    .PARAMETER FailTextDecoration
    Specifies the text decoration for fail conditions.

    .PARAMETER FailTextTransform
    Specifies the text transformation for fail conditions.

    .PARAMETER FailDirection
    Specifies the text direction for fail conditions.

    .EXAMPLE
    An example of how to use this function.

    .NOTES
    Additional notes about the function.
    #>
    [alias('EmailTableCondition', 'TableConditionalFormatting', 'New-HTMLTableCondition', 'TableCondition')]
    [CmdletBinding()]
    param(
        [parameter(Mandatory)][alias('ColumnName')][string] $Name,
        [string[]] $HighlightHeaders,
        [alias('Type')][ValidateSet('number', 'string', 'bool', 'date')][string] $ComparisonType = 'string',
        [ValidateSet('lt', 'le', 'eq', 'ge', 'gt', 'ne', 'contains', 'like', 'notlike', 'notcontains', 'between', 'betweenInclusive', 'in', 'notin')][string] $Operator = 'eq',
        [Object] $Value,
        [switch] $Row,
        [switch] $Inline,
        [switch] $CaseSensitive,
        [string] $DateTimeFormat,
        [switch] $ReverseCondition,
        # Child row fill for responsive lists
        [ValidateSet('Parent','Both')][string] $ChildRowFill,
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
        ChildRowFill     = $ChildRowFill
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
