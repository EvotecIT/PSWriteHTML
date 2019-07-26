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

            for ($ColumnCount = 0; $ColumnCount -lt $RowData.Count; $ColumnCount++) {
                foreach ($ConditionalFormatting in $ContentFormattingInline) {
                    $ColumnIndexHeader = [array]::indexof($HeaderNames.ToUpper(), $($ConditionalFormatting.Name).ToUpper())
                    if ($ColumnIndexHeader -eq $ColumnCount) {

                        if ($ConditionalFormatting.Type -eq 'number' -or $ConditionalFormatting.Type -eq 'decimal') {
                            [decimal] $returnedValueLeft = 0
                            [bool]$resultLeft = [int]::TryParse($RowData[$ColumnCount], [ref]$returnedValueLeft)

                            [decimal]$returnedValueRight = 0
                            [bool]$resultRight = [int]::TryParse($ConditionalFormatting.Value, [ref]$returnedValueRight)

                            if ($resultLeft -and $resultRight) {
                                $SideLeft = $returnedValueLeft
                                $SideRight = $returnedValueRight
                            } else {
                                $SideLeft = $RowData[$ColumnCount]
                                $SideRight = $ConditionalFormatting.Value
                            }

                        } elseif ($ConditionalFormatting.Type -eq 'int') {
                            # Leaving this in althought only NUMBER is used.
                            [int] $returnedValueLeft = 0
                            [bool]$resultLeft = [int]::TryParse($RowData[$ColumnCount], [ref]$returnedValueLeft)

                            [int]$returnedValueRight = 0
                            [bool]$resultRight = [int]::TryParse($ConditionalFormatting.Value, [ref]$returnedValueRight)

                            if ($resultLeft -and $resultRight) {
                                $SideLeft = $returnedValueLeft
                                $SideRight = $returnedValueRight
                            } else {
                                $SideLeft = $RowData[$ColumnCount]
                                $SideRight = $ConditionalFormatting.Value
                            }
                        } else {
                            $SideLeft = $RowData[$ColumnCount]
                            $SideRight = $ConditionalFormatting.Value
                        }

                        if ($ConditionalFormatting.Operator -eq 'gt') {
                            $Pass = $SideLeft -gt $SideRight
                        } elseif ($ConditionalFormatting.Operator -eq 'lt') {
                            $Pass = $SideLeft -lt $SideRight
                        } elseif ($ConditionalFormatting.Operator -eq 'eq') {
                            $Pass = $SideLeft -eq $SideRight
                        } elseif ($ConditionalFormatting.Operator -eq 'le') {
                            $Pass = $SideLeft -le $SideRighte
                        } elseif ($ConditionalFormatting.Operator -eq 'ge') {
                            $Pass = $SideLeft -ge $SideRight
                        } elseif ($ConditionalFormatting.Operator -eq 'ne') {
                            $Pass = $SideLeft -ne $SideRight
                        } elseif ($ConditionalFormatting.Operator -eq 'like') {
                            $Pass = $SideLeft -like $SideRight
                        } elseif ($ConditionalFormatting.Operator -eq 'contains') {
                            $Pass = $SideLeft -contains $SideRight
                        }
                        # This is generally risky, alternative business to do it, so doing above instead
                        # if (Invoke-Expression -Command "`"$($RowData[$ColumnCount])`" -$($ConditionalFormatting.Operator) `"$($ConditionalFormatting.Value)`"") {

                        if ($Pass) {
                            # if ($RowData[$ColumnCount] -eq $ConditionalFormatting.Value) {
                            # If we want to make conditional formatting for for row it requires a bit diff approach
                            if ($ConditionalFormatting.Row) {
                                for ($i = 0; $i -lt $RowData.Count; $i++) {
                                    [PSCustomObject]@{
                                        RowIndex    = $RowCount
                                        ColumnIndex = ($i + 1) # Since it's 0 based index and we count from 1 we need to add 1
                                        Style       = $ConditionalFormatting.Style
                                    }
                                }
                            } else {
                                [PSCustomObject]@{
                                    RowIndex    = $RowCount
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
                }
            }
        } elseif ($Content.RowIndex -and $Content.Name) {
            # ROWINDEX AND COLUMN NAMES - ARRAYS
            # This takes care of Content by Column Names (Header Names)
            foreach ($ColumnName in $Content.Name) {
                $Index = [array]::indexof($HeaderNames.ToUpper(), $ColumnName.ToUpper())
                foreach ($RowIndex in $Content.RowIndex) {
                    $TableRows[$RowIndex][$Index] = @{
                        Style = $Content.Style
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
                        New-HTMLTag -Tag 'td' -Value { $RowData[$ColumnCount] } -Attributes @{
                            style = $TableRows[$RowCount][$ColumnCount]['Style']
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