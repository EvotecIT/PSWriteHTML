function New-TableConditionHeaderHighligher {
    [CmdletBinding()]
    param(
        [PSCustomObject] $Condition,
        [string[]]$Header
    )
    [Array] $ConditionHeaderNr = @(
        if ($Condition.HighlightHeaders) {
            # if highlight headers is defined we use that
            foreach ($HeaderName in $Condition.HighlightHeaders) {
                $ColumnID = $Header.ToLower().IndexOf($($HeaderName.ToLower()))
                if ($ColumnID -ne -1) {
                    $ColumnID
                }
            }
        } else {
            # if not we use same column that we highlight
            foreach ($HeaderName in $Condition.Name) {
                $ColumnID = $Header.ToLower().IndexOf($($HeaderName.ToLower()))
                if ($ColumnID -ne -1) {
                    $ColumnID
                }
            }
        }
    )
    $ConditionHeaderNr | ConvertTo-JsonLiteral -AsArray -AdvancedReplace @{ '.' = '\.'; '$' = '\$' }
}