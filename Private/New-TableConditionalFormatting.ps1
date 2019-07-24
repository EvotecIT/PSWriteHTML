function New-TableConditionalFormatting {
    [CmdletBinding()]
    param(
        [string] $Options,
        [Array] $ConditionalFormatting,
        [string[]] $Header
    )

    if ($ConditionalFormatting.Count -gt 0) {
        # Conditional - changes PowerShellOperator into JS operator
        foreach ($Formatting in $ConditionalFormatting) {
            if ($Formatting.Operator -eq 'gt') {
                $Formatting.Operator = '>'
            } elseif ($Formatting.Operator -eq 'lt') {
                $Formatting.Operator = '<'
            } elseif ($Formatting.Operator -eq 'eq') {
                $Formatting.Operator = '=='
            } elseif ($Formatting.Operator -eq 'le') {
                $Formatting.Operator = '<='
            } elseif ($Formatting.Operator -eq 'ge') {
                $Formatting.Operator = '>='
            }
        }
        $Condition = @(
            '"createdRow": function (row, data, dataIndex, column) {'

            foreach ($Condition in $ConditionalFormatting) {
                $ConditionHeaderNr = $Header.ToLower().IndexOf($($Condition.Name.ToLower()))
                $Style = $Condition.Style | ConvertTo-Json
                [string] $StyleDefinition = ".css($Style)"
                if ($null -eq $Condition.Type -or $Condition.Type -eq 'number') {
                    "if (data[$ConditionHeaderNr] $($Condition.Operator) $($Condition.Value)) {"
                } elseif ($Condition.Type -eq 'string') {
                    switch ($Condition.Operator) {
                        "contains" {
                            "if (data[$($ConditionHeaderNr)].includes('$($Condition.Value)')) {"
                        }
                        default {
                            "if (data[$ConditionHeaderNr] $($Condition.Operator) '$($Condition.Value)') {"
                        }
                    }
                } elseif ($Condition.Type -eq 'date') {
                    "if (new Date(data[$ConditionHeaderNr]) $($Condition.Operator) new Date('$($Condition.Value)')) {"
                }
                if ($null -ne $Condition.Row -and $Condition.Row -eq $true) {
                    "`$(column)$($StyleDefinition);"
                } else {
                    "`$(column[$ConditionHeaderNr])$($StyleDefinition);"
                }
                "}"
            }

            '}'
        )
        if ($PSEdition -eq 'Desktop') {
            $TextToFind = '"createdRow":  ""'
        } else {
            $TextToFind = '"createdRow": ""'
        }
        $Options = $Options -Replace ($TextToFind, $Condition)
    }
    return $Options
}