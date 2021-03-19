function Add-TableContent {
    [CmdletBinding()]
    param(
        [System.Collections.Generic.List[PSCustomObject]] $ContentRows,
        [System.Collections.Generic.List[PSCUstomObject]] $ContentStyle,
        [System.Collections.Generic.List[PSCUstomObject]] $ContentTop,
        [System.Collections.Generic.List[PSCUstomObject]] $ContentFormattingInline,
        [string[]] $HeaderNames,
        [Array] $Table
    )

    # This converts inline conditonal formatting into style. It's intensive because it actually scans whole Table
    # During scan it tries to match things and when it finds a match it prepares it for ContentStyling feature
    if ($ContentFormattingInline.Count -gt 0) {
        [Array] $AddStyles = for ($RowCount = 1; $RowCount -lt $Table.Count; $RowCount++) {
            [string[]] $RowData = $Table[$RowCount] -replace '</td></tr>' -replace '<tr><td>' -split '</td><td>'
            foreach ($ConditionalFormatting in $ContentFormattingInline) {
                $Pass = $false
                if ($ConditionalFormatting.ConditionType -eq 'Condition') {
                    $ColumnIndexHeader = [array]::indexof($HeaderNames.ToUpper(), $($ConditionalFormatting.Name).ToUpper())
                    for ($ColumnCount = 0; $ColumnCount -lt $RowData.Count; $ColumnCount++) {
                        #Write-Color "1ColumnCount $ColumnCount / $RowCount"
                        if ($ColumnIndexHeader -eq $ColumnCount) {
                            $Pass = New-TableConditionalFormattingInline -HeaderNames $HeaderNames -ColumnIndexHeader $ColumnIndexHeader -RowCount $RowCount -ColumnCount $ColumnCount -RowData $RowData -ConditionalFormatting $ConditionalFormatting
                            break
                        }
                    }
                } else {
                    [Array] $IsConditionTrue = foreach ($SubCondition in $ConditionalFormatting.Conditions.Output) {
                        $ColumnIndexHeader = [array]::indexof($HeaderNames.ToUpper(), $($SubCondition.Name).ToUpper())
                        for ($ColumnCount = 0; $ColumnCount -lt $RowData.Count; $ColumnCount++) {
                            #Write-Color "2ColumnCount $ColumnCount / $RowCount"
                            if ($ColumnIndexHeader -eq $ColumnCount) {
                                New-TableConditionalFormattingInline -HeaderNames $HeaderNames -ColumnIndexHeader $ColumnIndexHeader -RowCount $RowCount -ColumnCount $ColumnCount -RowData $RowData -ConditionalFormatting $SubCondition
                            }
                        }
                    }
                    if ($ConditionalFormatting.Logic -eq 'AND') {
                        if ($IsConditionTrue -contains $true -and $IsConditionTrue -notcontains $false) {
                            $Pass = $true
                        }
                    } elseif ($ConditionalFormatting.Logic -eq 'OR') {
                        if ($IsConditionTrue -contains $true) {
                            $Pass = $true
                        }
                    } elseif ($ConditionalFormatting.Logic -eq 'NONE') {
                        if ($IsConditionTrue -contains $false -and $IsConditionTrue -notcontains $true) {
                            $Pass = $true
                        }
                    }
                }
                if ($Pass) {
                    # If we want to make conditional formatting for row it requires a bit diff approach
                    if ($ConditionalFormatting.Row) {
                        for ($i = 0; $i -lt $RowData.Count; $i++) {
                            [PSCustomObject]@{
                                RowIndex    = $RowCount
                                ColumnIndex = ($i + 1)  # Since it's 0 based index and we count from 1 we need to add 1
                                Style       = $ConditionalFormatting.Style
                            }
                        }
                    } elseif ($ConditionalFormatting.HighlightHeaders) {
                        foreach ($Name in $ConditionalFormatting.HighlightHeaders) {
                            $ColumnIndexHighlight = [array]::indexof($HeaderNames.ToUpper(), $($Name).ToUpper())
                            [PSCustomObject]@{
                                RowIndex    = $RowCount
                                ColumnIndex = ($ColumnIndexHighlight + 1) # Since it's 0 based index and we count from 1 we need to add 1
                                Style       = $ConditionalFormatting.Style
                            }
                        }
                    } else {
                        [PSCustomObject]@{
                            RowIndex    = $RowCount
                            ColumnIndex = ($ColumnIndexHeader + 1)  # Since it's 0 based index and we count from 1 we need to add 1
                            Style       = $ConditionalFormatting.Style
                        }
                    }
                } else {
                    if ($ConditionalFormatting.FailStyle.Keys.Count -gt 0) {
                        if ($ConditionalFormatting.Row) {
                            for ($i = 0; $i -lt $RowData.Count; $i++) {
                                [PSCustomObject]@{
                                    RowIndex    = $RowCount
                                    ColumnIndex = ($i + 1)  # Since it's 0 based index and we count from 1 we need to add 1
                                    Style       = $ConditionalFormatting.FailStyle
                                }
                            }
                        } elseif ($ConditionalFormatting.HighlightHeaders) {
                            foreach ($Name in $ConditionalFormatting.HighlightHeaders) {
                                $ColumnIndexHighlight = [array]::indexof($HeaderNames.ToUpper(), $($Name).ToUpper())
                                [PSCustomObject]@{
                                    RowIndex    = $RowCount
                                    ColumnIndex = ($ColumnIndexHighlight + 1) # Since it's 0 based index and we count from 1 we need to add 1
                                    Style       = $ConditionalFormatting.FailStyle
                                }
                            }
                        } else {
                            [PSCustomObject]@{
                                RowIndex    = $RowCount
                                ColumnIndex = ($ColumnIndexHeader + 1)  # Since it's 0 based index and we count from 1 we need to add 1
                                Style       = $ConditionalFormatting.FailStyle
                            }
                        }
                    }
                }
            }
        }
        # This makes conditional forwarding a ContentStyle
        foreach ($Style in $AddStyles) {
            $ContentStyle.Add($Style)
        }
    }

    # Prepopulate hashtable with rows
    $TableRows = @{ }
    if ($ContentStyle) {
        for ($RowIndex = 0; $RowIndex -lt $Table.Count; $RowIndex++) {
            $TableRows[$RowIndex] = @{ }
        }
    }

    # Find rows in hashtable and add column to it
    foreach ($Content in $ContentStyle) {
        if ($Content.RowIndex -and $Content.ColumnIndex) {

            # ROWINDEX and COLUMNINDEX - ARRAYS
            # This takes care of Content by Column Nr
            foreach ($ColumnIndex in $Content.ColumnIndex) {

                # Column Index given by user is from 1 to infinity, Column Index is counted from 0
                # We need to address this by doing - 1
                foreach ($RowIndex in $Content.RowIndex) {
                    $TableRows[$RowIndex][$ColumnIndex - 1] = @{
                        Style = $Content.Style
                    }
                    if ($Content.Text) {
                        if ($Content.Used) {
                            $TableRows[$RowIndex][$ColumnIndex - 1]['Text'] = ''
                            $TableRows[$RowIndex][$ColumnIndex - 1]['Remove'] = $true
                        } else {
                            $TableRows[$RowIndex][$ColumnIndex - 1]['Text'] = $Content.Text
                            $TableRows[$RowIndex][$ColumnIndex - 1]['Remove'] = $false
                            $TableRows[$RowIndex][$ColumnIndex - 1]['ColSpan'] = $($Content.ColumnIndex).Count
                            $TableRows[$RowIndex][$ColumnIndex - 1]['RowSpan'] = $($Content.RowIndex).Count
                            $Content.Used = $true
                        }
                    }
                }
            }
        } elseif ($Content.RowIndex -and $Content.Name) {
            # ROWINDEX AND COLUMN NAMES - ARRAYS
            # This takes care of Content by Column Names (Header Names)
            foreach ($ColumnName in $Content.Name) {
                $ColumnIndex = ([array]::indexof($HeaderNames.ToUpper(), $ColumnName.ToUpper()))
                foreach ($RowIndex in $Content.RowIndex) {
                    $TableRows[$RowIndex][$ColumnIndex] = @{
                        Style = $Content.Style
                    }
                    if ($Content.Text) {
                        if ($Content.Used) {
                            $TableRows[$RowIndex][$ColumnIndex]['Text'] = ''
                            $TableRows[$RowIndex][$ColumnIndex]['Remove'] = $true
                        } else {
                            $TableRows[$RowIndex][$ColumnIndex]['Text'] = $Content.Text
                            $TableRows[$RowIndex][$ColumnIndex]['Remove'] = $false
                            $TableRows[$RowIndex][$ColumnIndex]['ColSpan'] = $($Content.ColumnIndex).Count
                            $TableRows[$RowIndex][$ColumnIndex]['RowSpan'] = $($Content.RowIndex).Count
                            $Content.Used = $true
                        }
                    }
                }
            }
        } elseif ($Content.RowIndex -and (-not $Content.ColumnIndex -and -not $Content.Name)) {
            # Just ROW INDEX
            for ($ColumnIndex = 0; $ColumnIndex -lt $HeaderNames.Count; $ColumnIndex++) {
                foreach ($RowIndex in $Content.RowIndex) {
                    $TableRows[$RowIndex][$ColumnIndex] = @{
                        Style = $Content.Style
                    }
                }
            }
        } elseif (-not $Content.RowIndex -and ($Content.ColumnIndex -or $Content.Name)) {
            # JUST COLUMNINDEX or COLUMNNAMES
            for ($RowIndex = 1; $RowIndex -lt $($Table.Count); $RowIndex++) {
                if ($Content.ColumnIndex) {
                    # JUST COLUMN INDEX
                    foreach ($ColumnIndex in $Content.ColumnIndex) {
                        $TableRows[$RowIndex][$ColumnIndex - 1] = @{
                            Style = $Content.Style
                        }
                    }
                } else {
                    # JUST COLUMN NAMES
                    foreach ($ColumnName in $Content.Name) {
                        $ColumnIndex = [array]::indexof($HeaderNames.ToUpper(), $ColumnName.ToUpper())
                        $TableRows[$RowIndex][$ColumnIndex] = @{
                            Style = $Content.Style
                        }
                    }
                }
            }
        }
    }

    # Row 0 = Table Header
    # This builds table from scratch, skipping rows untouched by styling
    [Array] $NewTable = for ($RowCount = 0; $RowCount -lt $Table.Count; $RowCount++) {
        # No conditional formatting we can process just styling since we don't need values
        # We have column index and row index and that's enough
        # In case of conditional formatting it's different as it works on values
        if ($TableRows[$RowCount]) {
            [string[]] $RowData = $Table[$RowCount] -replace '</td></tr>' -replace '<tr><td>' -split '</td><td>'
            New-HTMLTag -Tag 'tr' {
                for ($ColumnCount = 0; $ColumnCount -lt $RowData.Count; $ColumnCount++) {
                    if ($TableRows[$RowCount][$ColumnCount]) {
                        if (-not $TableRows[$RowCount][$ColumnCount]['Remove']) {
                            if ($TableRows[$RowCount][$ColumnCount]['Text']) {
                                New-HTMLTag -Tag 'td' -Value { $TableRows[$RowCount][$ColumnCount]['Text'] } -Attributes @{
                                    style   = $TableRows[$RowCount][$ColumnCount]['Style']
                                    colspan = if ($TableRows[$RowCount][$ColumnCount]['ColSpan'] -gt 1) { $TableRows[$RowCount][$ColumnCount]['ColSpan'] } else { }
                                    rowspan = if ($TableRows[$RowCount][$ColumnCount]['RowSpan'] -gt 1) { $TableRows[$RowCount][$ColumnCount]['RowSpan'] } else { }
                                }

                                # Version 1 - Alternative version to workaround DataTables.NET
                                # New-HTMLTag -Tag 'td' -Value { $TableRows[$RowCount][$ColumnCount]['Text'] } -Attributes @{
                                #    style   = $TableRows[$RowCount][$ColumnCount]['Style']
                                # }

                            } else {
                                New-HTMLTag -Tag 'td' -Value { $RowData[$ColumnCount] } -Attributes @{
                                    style = $TableRows[$RowCount][$ColumnCount]['Style']
                                }
                            }
                        } else {
                            # RowSpan/ColSpan doesn't work in DataTables.net for content.
                            # This means that this functionality is only good for Non-JS.
                            # Normally you would just remove TD/TD and everything shopuld work
                            # And it does work but only for NON-JS solution

                            # Version 1
                            # Alternative Approach - this assumes the text will be zeroed
                            # From visibility side it will look like an empty cells
                            # However content will be stored only in first cell.
                            # requires removal of colspan/rowspan

                            # New-HTMLTag -Tag 'td' -Value { '' } -Attributes @{
                            #    style = $TableRows[$RowCount][$ColumnCount]['Style']
                            # }

                            # Version 2
                            # Below code was suggested as a workaround - it doesn't wrok
                            # New-HTMLTag -Tag 'td' -Value { }  -Attributes @{
                            #     style = "display: none;"
                            # }
                        }
                    } else {
                        New-HTMLTag -Tag 'td' -Value { $RowData[$ColumnCount] }
                    }
                }
            }
        } else {
            $Table[$RowCount]
        }
    }
    $NewTable
}