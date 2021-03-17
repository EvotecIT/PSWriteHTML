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
        [string]$Color,
        [string]$BackgroundColor,
        [int] $FontSize,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [ValidateSet('normal', 'italic', 'oblique')][string] $FontStyle,
        [ValidateSet('normal', 'small-caps')][string] $FontVariant,
        [string] $FontFamily,
        [ValidateSet('left', 'center', 'right', 'justify')][string] $Alignment,
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string] $TextDecoration,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransform,
        [ValidateSet('rtl')][string] $Direction,
        [switch] $Inline,
        [switch] $CaseSensitive,
        [string] $DateTimeFormat
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

    $TableCondition = [PSCustomObject] @{
        ConditionType    = 'Condition'
        Row              = $Row
        Type             = $ComparisonType
        Name             = $Name
        Operator         = $Operator
        Value            = $Value
        #Color            = $Color
        #BackgroundColor  = $BackgroundColor
        Style            = ConvertTo-HTMLStyle @Style
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