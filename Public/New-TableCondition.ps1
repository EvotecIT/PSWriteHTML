function New-TableCondition {
    [alias('EmailTableCondition', 'TableConditionalFormatting', 'New-HTMLTableCondition', 'TableCondition')]
    [CmdletBinding()]
    param(
        [alias('ColumnName')][string] $Name,
        [string[]] $HighlightHeaders,
        [alias('Type')][ValidateSet('number', 'string', 'bool', 'date')][string] $ComparisonType = 'string',
        [ValidateSet('lt', 'le', 'eq', 'ge', 'gt', 'ne', 'contains', 'like', 'notlike', 'notcontains', 'between', 'betweenInclusive')][string] $Operator = 'eq',
        [Object] $Value,
        [switch] $Row,
        [switch] $Inline,
        [switch] $CaseSensitive,
        [string] $DateTimeFormat,
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
    }
    [PSCustomObject] @{
        Type   = if ($Inline) { 'TableConditionInline' } else { 'TableCondition' }
        Output = $TableCondition
    }
}

Register-ArgumentCompleter -CommandName New-TableCondition -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TableCondition -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors