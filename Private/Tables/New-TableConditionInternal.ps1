function New-TableConditionInternal {
    [CmdletBinding()]
    param(
        [PSCustomObject] $Condition,
        [string[]]$Header,
        [string] $DataStore
    )
    $Cond = [ordered] @{
        columnName       = $Condition.Name
        columnId         = $Header.ToLower().IndexOf($($Condition.Name.ToLower()))
        operator         = $Condition.Operator
        type             = $Condition.Type.ToLower()
        value            = $Condition.Value
        valueDate        = $null
        dataStore        = $DataStore
        caseSensitive    = $Condition.caseSensitive
        dateTimeFormat   = $Condition.DateTimeFormat
        reverseCondition = $Condition.ReverseCondition
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
    } elseif ($Cond['value'] -is [Array] -and $Cond['value'][0] -is [datetime]) {
        [Array] $Cond['valueDate'] = foreach ($Date in $Cond['value']) {
            @{
                year        = $Date.Year
                month       = $Date.Month
                day         = $Date.Day
                hours       = $Date.Hour
                minutes     = $Date.Minute
                seconds     = $Date.Second
                miliseconds = $Date.Millisecond
            }
        }
    }
    $Cond
}