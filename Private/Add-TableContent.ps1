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
        [Array] $AddStyles = for ($RowCount = 0; $RowCount -lt $Table.Count; $RowCount++) {
            [string[]] $RowData = $Table[$RowCount] -replace '</td></tr>' -replace '<tr><td>' -split '</td><td>'

            for ($ColumnCount = 0; $ColumnCount -lt $RowData.Count; $ColumnCount++) {
                foreach ($ConditionalFormatting in $ContentFormattingInline) {
                    $ColumnIndexHeader = [array]::indexof($HeaderNames.ToUpper(), $($ConditionalFormatting.Name).ToUpper())
                    if ($ColumnIndexHeader -eq $ColumnCount) {

                        if ($ConditionalFormatting.Operator -eq 'gt') {
                            $Pass = $RowData[$ColumnCount] -gt $ConditionalFormatting.Value
                        } elseif ($ConditionalFormatting.Operator -eq 'lt') {
                            $Pass = $RowData[$ColumnCount] -lt $ConditionalFormatting.Value
                        } elseif ($ConditionalFormatting.Operator -eq 'eq') {
                            $Pass = $RowData[$ColumnCount] -eq $ConditionalFormatting.Value
                        } elseif ($ConditionalFormatting.Operator -eq 'le') {
                            $Pass = $RowData[$ColumnCount] -le $ConditionalFormatting.Value
                        } elseif ($ConditionalFormatting.Operator -eq 'ge') {
                            $Pass = $RowData[$ColumnCount] -ge $ConditionalFormatting.Value
                        } elseif ($ConditionalFormatting.Operator -eq 'ne') {
                            $Pass = $RowData[$ColumnCount] -ne $ConditionalFormatting.Value
                        } elseif ($ConditionalFormatting.Operator -eq 'like') {
                            $Pass = $RowData[$ColumnCount] -like $ConditionalFormatting.Value
                        } elseif ($ConditionalFormatting.Operator -eq 'contains') {
                            $Pass = $RowData[$ColumnCount] -contains $ConditionalFormatting.Value
                        }
                        # This is generally risky, alternative business to do it, so doing above instead
                        # if (Invoke-Expression -Command "`"$($RowData[$ColumnCount])`" -$($ConditionalFormatting.Operator) `"$($ConditionalFormatting.Value)`"") {

                        if ($Pass) {
                            # if ($RowData[$ColumnCount] -eq $ConditionalFormatting.Value) {
                            # If we want to make conditional formatting for for row it requires a bit diff approach
                            if ($ConditionalFormatting.Row) {
                                for ($i = 0; $i -lt $RowData.Count; $i++) {
                                    [PSCustomObject]@{
                                        Row         = $RowCount
                                        ColumnIndex = ($i + 1) # Since it's 0 based index and we count from 1 we need to add 1
                                        Style       = $ConditionalFormatting.Style

                                    }
                                }
                            } else {
                                [PSCustomObject]@{
                                    Row         = $RowCount
                                    ColumnIndex = ($ColumnIndexHeader + 1) # Since it's 0 based index and we count from 1 we need to add 1
                                    Style       = $ConditionalFormatting.Style
                                }
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
    foreach ($Content in $ContentStyle) {
        # | Sort-Object -Property Row) {
        $TableRows[$Content.Row] = @{ }
    }

    # Find rows in hashtable and add column to it
    foreach ($Content in $ContentStyle) {
        if ($Content.ColumnIndex) {
            # This takes care of Content by Column Nr
            foreach ($_ in $Content.ColumnIndex) {
                #$Index = [array]::indexof($HeaderNames.ToUpper(), $_.ToUpper())

                # Column Index given by user is from 1 to infinity, Column Index is counted from 0
                # We need to address this by doing - 1
                $TableRows[$Content.Row][$_ - 1] = @{
                    Index = ($_ - 1)
                    Title = $Content.Title
                    Count = ($Content.ColumnIndex).Count
                    Style = $Content.Style
                    Row   = $Content.Row
                    Used  = $false
                }
            }
        } else {
            # This takes care of Content by Column Names (Header Names)
            foreach ($_ in $Content.Names) {
                $Index = [array]::indexof($HeaderNames.ToUpper(), $_.ToUpper())
                $TableRows[$Content.Row][$Index] = @{
                    Index = $Index
                    Title = $Content.Title
                    Count = $Index.Count
                    Style = $Content.Style
                    Row   = $Content.Row
                    Used  = $false
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
                        New-HTMLTag -Tag 'td' -Value { $RowData[$ColumnCount] } -Attributes @{
                            style = $TableRows[$RowCount][$ColumnCount].Style
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