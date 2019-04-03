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
        <#
        $ConditionHeaderNr = $CleanHeader.IndexOf('Name')

        $Condition1 = "columnDefs: [{targets: $ConditionHeaderNr, render: function ( data, type, row ) {"
        $Condition2 = "var color = 'black'; var backgroundColor = undefined;"

        $Condition3 = foreach ($Condition in $ConditionalFormatting) {
            "if (data $($Condition.Operator) $($Condition.Value)) {"
            if ($null -ne $Condition.Color) {
                $RGBColor = (ConvertFrom-Color -Color $Condition.Color)
                "color = '$RGBColor';"
            }
            if ($null -ne $Condition.BackgroundColor) {
                $RGBBackgroundColor = (ConvertFrom-Color -Color $Condition.BackgroundColor)
                "backgroundColor = '$RGBBackgroundColor';"
            }
            "}"

        }
        if ($null -ne $Condition.Color -and $null -ne $Condition.BackgroundColor) {
            # Background and Color Both
            $Condition4 = "return '<span style=`"color:' + color + ';background-color:' + backgroundColor + '`">' + data + '</span>';"
        } elseif ($null -ne $Condition.Color) {
            # Color Only
            $Condition4 = "return '<span style=`"color:' + color + '`">' + data + '</span>';"
        } else {
            # Background Color Only
            $Condition4 = "return '<span style=`"background-color:' + backgroundColor + '`">' + data + '</span>';"
        }

        $Condition5 = '},}]'
        #>

        $Condition1 = '"createdRow": function (row, data, dataIndex, column) {'

        $Condition3 = foreach ($Condition in $ConditionalFormatting) {
            $ConditionHeaderNr = $Header.ToLower().IndexOf($($Condition.Name.ToLower()))
            # reset to defaults
            [string] $ColorJSDefinition = ''
            [string] $ColorBackgroundJSDefinition = ''

            if ($null -ne $Condition.Color) {
                $RGBColor = (ConvertFrom-Color -Color $Condition.Color)
                $C = @{ "color" = $RGBColor } | ConvertTo-Json
                $ColorJSDefinition = ".css($C)"
            }
            if ($null -ne $Condition.BackgroundColor) {
                $RGBBackgroundColor = (ConvertFrom-Color -Color $Condition.BackgroundColor)
                $BG = @{ "background-color" = $RGBBackgroundColor } | ConvertTo-Json
                $ColorBackgroundJSDefinition = ".css($BG)"
            }

            if ($null -eq $Condition.Type -or $Condition.Type -eq 'number') {
                "if (data[$ConditionHeaderNr] $($Condition.Operator) $($Condition.Value)) {"
            } elseif ($Condition.Type -eq 'string') {
                "if (data[$ConditionHeaderNr] $($Condition.Operator) '$($Condition.Value)') {"
            } elseif ($Condition.Type -eq 'date') {
                "if (new Date(data[$ConditionHeaderNr]) $($Condition.Operator) new Date('$($Condition.Value)')) {"
            }




            if ($null -ne $Condition.Row -and $Condition.Row -eq $true) {
                "`$(column)$($ColorJSDefinition)$($ColorBackgroundJSDefinition);"
            } else {
                "`$(column[$ConditionHeaderNr])$($ColorJSDefinition)$($ColorBackgroundJSDefinition);"
            }



            "}"
        }

        $Condition5 = '}'

        $Test = $Condition1 + $Condition3 + $Condition5
        $Options = $Options -Replace ('"columnDefs":  ""', $Test)
    }

    return $Options
}

<# Best solution
"createdRow": function (row, data, dataIndex, column) {
    if (data[2] == 'Normal') {
        $(column[2]).css({ "color": "red"}).css({'background-color':'green' })
    }
}
# Other
columnDefs: [{
    targets: 0,
    render: function (data, type, row) {
        var color = 'black';
        var backgroundColor = undefined;
        if (data > 10000) {
            color = '#ff0000';
            backgroundColor = '#008000';
        }
        if (data < 10000) {
            color = '#ffff00';
            backgroundColor = '#008000';
        }
        if (data > 20000) {
            color = '#008000';
            backgroundColor = '#008000';
        }
        return '<span style="color:' + color +
            ';background-color:' + backgroundColor + '">' +
            data + '</span>';
    },
}]
#>