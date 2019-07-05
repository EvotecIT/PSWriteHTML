function New-HTMLTableCondition {
    [CmdletBinding()]
    param(
        [alias('ColumnName')][string] $Name,
        [alias('Type')][ValidateSet('number', 'string')][string] $ComparisonType,
        [ValidateSet('lt', 'le', 'eq', 'ge', 'gt', 'contains')][string] $Operator,
        [Object] $Value,
        [switch] $Row,
        [nullable[RGBColors]] $Color,
        [nullable[RGBColors]] $BackgroundColor
    )
    $TableCondition = [PSCustomObject] @{
        Row             = $Row
        Type            = $ComparisonType
        Name            = $Name
        Operator        = $Operator
        Value           = $Value
        Color           = $Color
        BackgroundColor = $BackgroundColor
    }
    [PSCustomObject] @{
        Type   = 'TableCondition'
        Output = $TableCondition
    }
}
