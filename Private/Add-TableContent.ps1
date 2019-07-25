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

    # Prepopulate hashtable with rows
    $TableRows = @{ }
    foreach ($Content in $ContentStyle | Sort-Object -Property Row) {
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