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
    if ($ConditionHeaderNr.Count -gt 0) {
        $ConditionHeaderNr | ConvertTo-JsonLiteral -AsArray -AdvancedReplace @{ '.' = '\.'; '$' = '\$' }
    } else {
        $ColumnNames = @(
            if ($Condition.HighlightHeaders) {
                $Condition.HighlightHeaders
            }
            if ($Condition.Name) {
                $Condition.Name
            }
        )
        if ($ColumnNames.Count -gt 0) {
            Write-Warning "New-TableCondition - None of the column names exists $ColumnNames in condition. Skipping."
        } else {
            Write-Warning "New-TableCondition - None of the column names found to process. Please use HighlightHeaders or Row switch when using New-TableConditionGroup."
        }
    }
}