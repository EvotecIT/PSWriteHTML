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
        $TextToFind = '"createdRow":""'
        $Options = $Options -Replace ($TextToFind, $ConditionsReplacement)
    }
    $Options
}
