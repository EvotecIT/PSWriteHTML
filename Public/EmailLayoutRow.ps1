function EmailLayoutRow {
    [cmdletBinding()]
    param(
        [ScriptBlock] $RowLayout,
        [string] $Width
    )
    if ($RowLayout) {
        $Output = & $RowLayout


        New-HTMLTag -Tag 'table' -Attributes @{ class = 'layoutTable' } {
            New-HTMLTag -Tag 'tbody' {
                New-HTMLTag -Tag 'tr' -Attributes @{class = 'layoutTableRow' } {
                    $Output
                }
            }
        }

    }
}