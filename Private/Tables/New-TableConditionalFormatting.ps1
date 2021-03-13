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
                    [Array] $HighlightHeaders = New-TableConditionHeaderHighligher -Condition $Condition -Header $Header
                    [Array] $ConditionsContainer = @(
                        [ordered]@{
                            logic      = 'AND'
                            conditions = @( New-TableConditionInternal -Condition $Condition -Header $Header -DataStore $DataStore )
                        }
                    )
                    "    var css = $($Condition.Style | ConvertTo-Json);"
                    "    var conditionsContainer = $($ConditionsContainer | ConvertTo-JsonLiteral -Depth 5 -AsArray -AdvancedReplace @{ '.' = '\.'; '$' = '\$' });"
                    "    dataTablesConditionalFormatting(row, data, conditionsContainer, $HighlightHeaders, css);"
                } else {
                    [Array] $HighlightHeaders = New-TableConditionHeaderHighligher -Condition $Condition -Header $Header
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
                    "    var conditionsContainer = $($ConditionsContainer | ConvertTo-JsonLiteral -Depth 5 -AsArray -AdvancedReplace @{ '.' = '\.'; '$' = '\$' });"
                    "    dataTablesConditionalFormatting(row, data, conditionsContainer, $HighlightHeaders, css);"
                }
            }

            "}"
        )
        $TextToFind = '"createdRow":""'
        $Options = $Options -Replace ($TextToFind, $ConditionsReplacement)
    }
    $Options
}
