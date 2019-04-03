function New-HTMLTableCondition {
    param(
        [alias('ColumnName')][string] $Name,
        [ValidateSet('number', 'string')][string] $Type,
        [ValidateSet('lt','le','eq','ge','gt')][string] $Operator,
        [Object] $Value,
        [switch] $Row,
        [nullable[RGBColors]] $Color,
        [nullable[RGBColors]] $BackgroundColor
    )
    return [PSCustomObject] @{ Row = $Row; Type = $Type ; Name = $Name; Operator = $Operator; Value = $Value; Color = $Color; BackgroundColor = $BackgroundColor }
}