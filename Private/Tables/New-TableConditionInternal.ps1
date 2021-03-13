function New-TableConditionInternal {
    [CmdletBinding()]
    param(
        [PSCustomObject] $Condition,
        [string[]]$Header,
        [string] $DataStore
    )
    $Cond = [ordered] @{
        columnName      = $Condition.Name
        columnId        = $Header.ToLower().IndexOf($($Condition.Name.ToLower()))
        operator        = $Condition.Operator
        type            = $Condition.Type.ToLower()
        value           = $Condition.Value
        valueDate       = $null
        dataStore       = $DataStore
        caseInsensitive = $Condition.CaseInsensitive
        dateTimeFormat  = $Condition.DateTimeFormat
    }
    if ($Cond['value'] -is [datetime]) {
        $Cond['valueDate'] = @{
            year        = $Cond['value'].Year
            month       = $Cond['value'].Month
            day         = $Cond['value'].Day
            hours       = $Cond['value'].Hour
            minutes     = $Cond['value'].Minute
            seconds     = $Cond['value'].Second
            miliseconds = $Cond['value'].Millisecond
        }
    }
    $Cond
}