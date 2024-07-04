function New-TableConditionInternal {
    <#
    .SYNOPSIS
    Creates a new table condition object based on the provided parameters.

    .DESCRIPTION
    This function creates a new table condition object with specified properties such as column name, column ID, operator, type, value, value date, data store, case sensitivity, date time format, and reverse condition.

    .PARAMETER Condition
    Specifies the condition object containing properties like Name, Operator, Type, Value, case sensitivity, DateTimeFormat, and ReverseCondition.

    .PARAMETER Header
    Specifies an array of header strings.

    .PARAMETER DataStore
    Specifies the data store for the condition.

    .EXAMPLE
    $condition = [PSCustomObject]@{
        Name            = "Column1"
        Operator        = "Equals"
        Type            = "String"
        Value           = "Value1"
        caseSensitive   = $true
        DateTimeFormat  = "yyyy-MM-dd"
        ReverseCondition = $false
    }
    $header = @("Column1", "Column2", "Column3")
    $dataStore = "DataStore1"
    $result = New-TableConditionInternal -Condition $condition -Header $header -DataStore $dataStore
    $result

    #>
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