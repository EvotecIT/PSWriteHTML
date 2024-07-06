function New-TableConditionalFormatting {
    <#
    .SYNOPSIS
    Creates conditional formatting for a table based on specified conditions.

    .DESCRIPTION
    This function applies conditional formatting to a table based on the provided conditions. It generates JavaScript code to be used in DataTables for highlighting rows based on the conditions specified.

    .PARAMETER Options
    Specifies additional options for the conditional formatting.

    .PARAMETER ConditionalFormatting
    An array of objects representing the conditions for conditional formatting.

    .PARAMETER Header
    An array of strings representing the headers of the table.

    .PARAMETER DataStore
    Specifies the data store to be used for conditional formatting.

    .EXAMPLE
    New-TableConditionalFormatting -Options "option1" -ConditionalFormatting @($condition1, $condition2) -Header @("Header1", "Header2") -DataStore "Store1"
    Creates conditional formatting for a table with specified conditions, headers, and data store.

    .EXAMPLE
    $conditions = @($condition1, $condition2)
    New-TableConditionalFormatting -Options "option1" -ConditionalFormatting $conditions -Header @("Header1", "Header2") -DataStore "Store1"
    Creates conditional formatting for a table using a variable to store the conditions.

    #>
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
            foreach ($Condition in $ConditionalFormatting) {
                if ($Condition.ConditionType -eq 'Condition') {
                    # Conditions without grouping
                    if ($Condition.Row) {
                        $HighlightHeaders = 'null'
                    } else {
                        [Array] $HighlightHeaders = New-TableConditionHeaderHighligher -Condition $Condition -Header $Header #-Row:$Row
                        if ($HighlightHeaders.Count -eq 0) {
                            continue
                        }
                    }
                    [Array] $ConditionsContainer = @(
                        [ordered]@{
                            logic      = 'AND'
                            conditions = @( New-TableConditionInternal -Condition $Condition -Header $Header -DataStore $DataStore )
                        }
                    )
                    "    var css = $($Condition.Style | ConvertTo-Json);"
                    if ($Condition.FailStyle.Keys.Count -gt 0) {
                        "    var failCss = $($Condition.FailStyle | ConvertTo-Json);"
                    } else {
                        "    var failCss = undefined;"
                    }
                    "    var conditionsContainer = $($ConditionsContainer | ConvertTo-JsonLiteral -Depth 5 -AsArray -AdvancedReplace @{ '.' = '\.'; '$' = '\$' });"
                    "    dataTablesConditionalFormatting(row, data, conditionsContainer, $HighlightHeaders, css, failCss);"

                } else {
                    if ($Condition.Row) {
                        $HighlightHeaders = 'null'
                    } else {
                        [Array] $HighlightHeaders = New-TableConditionHeaderHighligher -Condition $Condition -Header $Header
                        if ($HighlightHeaders.Count -eq 0) {
                            continue
                        }
                    }
                    [Array] $ConditionsContainer = @(
                        [ordered]@{
                            logic      = $Condition.Logic
                            conditions = @(
                                foreach ($NestedCondition in $Condition.Conditions) {
                                    if ($NestedCondition.Type -eq 'TableCondition') {
                                        New-TableConditionInternal -Condition $NestedCondition.Output -Header $Header -DataStore $DataStore
                                    }
                                }
                            )
                        }
                    )
                    "    var css = $($Condition.Style | ConvertTo-Json);"
                    if ($Condition.FailStyle.Keys.Count -gt 0) {
                        "    var failCss = $($Condition.FailStyle | ConvertTo-Json);"
                    } else {
                        "    var failCss = undefined;"
                    }
                    "    var conditionsContainer = $($ConditionsContainer | ConvertTo-JsonLiteral -Depth 5 -AsArray -AdvancedReplace @{ '.' = '\.'; '$' = '\$' });"
                    "    dataTablesConditionalFormatting(row, data, conditionsContainer, $HighlightHeaders, css, failCss);"
                }

            }

            "}"
        )
        if ($PSEdition -eq 'Desktop') {
            $TextToFind = '"createdRow":  ""'
        } else {
            $TextToFind = '"createdRow": ""'
        }
        $Options = $Options -Replace ($TextToFind, $ConditionsReplacement)
    }
    $Options
}
