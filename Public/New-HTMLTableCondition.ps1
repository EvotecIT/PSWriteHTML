function New-HTMLTableCondition {
    [CmdletBinding()]
    param(
        [alias('ColumnName')][string] $Name,
        [alias('Type')][ValidateSet('number', 'string')][string] $ComparisonType,
        [ValidateSet('lt', 'le', 'eq', 'ge', 'gt', 'contains')][string] $Operator,
        [Object] $Value,
        [switch] $Row,
        [nullable[RGBColors]] $Color,
        [nullable[RGBColors]] $BackgroundColor,
        [int] $FontSize,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [ValidateSet('normal', 'italic', 'oblique')][string] $FontStyle,
        [ValidateSet('normal', 'small-caps')][string] $FontVariant,
        [string] $FontFamily,
        [ValidateSet('left', 'center', 'right', 'justify')][string] $Alignment,
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string] $TextDecoration,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransform,
        [ValidateSet('rtl')][string] $Direction

    )
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
    Remove-EmptyValues -Hashtable $Style

    $TableCondition = [PSCustomObject] @{
        Row             = $Row
        Type            = $ComparisonType
        Name            = $Name
        Operator        = $Operator
        Value           = $Value
        Color           = $Color
        BackgroundColor = $BackgroundColor
        Style           = ConvertTo-HTMLStyle @Style
    }
    [PSCustomObject] @{
        Type   = 'TableCondition'
        Output = $TableCondition
    }
}
