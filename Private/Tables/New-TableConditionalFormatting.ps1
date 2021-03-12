function New-TableConditionalFormatting {
    [CmdletBinding()]
    param(
        [string] $Options,
        [Array] $ConditionalFormatting,
        [string[]] $Header,
        [string] $DataStore
    )
    if ($ConditionalFormatting.Count -gt 0) {
        $ConditionsReplacement = @(
            '"rowCallback": function (row, data) {'
            $Style = $null
            [Array] $ConditionHeaderNr = $null
            foreach ($Condition in $ConditionalFormatting) {
                $Style = $null
                [Array] $ConditionHeaderNr = $null
                [Array] $ConditionsContainer = @(
                    [ordered]@{
                        logic      = 'AND'
                        conditions = @(

                            $Style = $Condition.Style
                            if ($Condition.HighlightHeaders) {
                                # if highlight headers is defined we use that
                                $ConditionHeaderNr = foreach ($HeaderName in $Condition.HighlightHeaders) {
                                    $ColumnID = $Header.ToLower().IndexOf($($HeaderName.ToLower()))
                                    if ($ColumnID -ne -1) {
                                        $ColumnID
                                    }
                                }
                            } else {
                                # if not we use same column that we highlight
                                $ConditionHeaderNr = foreach ($HeaderName in $Condition.Name) {
                                    $ColumnID = $Header.ToLower().IndexOf($($HeaderName.ToLower()))
                                    if ($ColumnID -ne -1) {
                                        $ColumnID
                                    }
                                }
                            }
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
                            if ($Value -is [datetime]) {
                                $Cond['valueDate'] = @{
                                    year        = $Value.Year
                                    month       = $Value.Month
                                    day         = $Value.Day
                                    hours       = $Value.Hour
                                    minutes     = $Value.Minute
                                    seconds     = $Value.Second
                                    miliseconds = $Value.Millisecond
                                }
                            }
                            $Cond

                        )
                    }
                )

                $HighlightHeaders = $ConditionHeaderNr | ConvertTo-JsonLiteral -AsArray -AdvancedReplace @{ '.' = '\.'; '$' = '\$' }
                "    var css = $($Style | ConvertTo-Json);"
                "    var conditionsContainer = $($ConditionsContainer | ConvertTo-JsonLiteral -Depth 5 -AsArray -AdvancedReplace @{ '.' = '\.'; '$' = '\$' });"
                "    dataTablesConditionalFormatting(row, data, conditionsContainer, $HighlightHeaders, css);"
            }
            "}"
        )
        $TextToFind = '"createdRow":""'
        $Options = $Options -Replace ($TextToFind, $ConditionsReplacement)
    }
    $Options
}
