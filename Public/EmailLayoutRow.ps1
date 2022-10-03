function EmailLayoutRow {
    [cmdletBinding()]
    param(
        [ScriptBlock] $RowLayout,
        [string] $Height
    )
    if ($RowLayout) {
        $Output = & $RowLayout

        $HTMLHeight = ConvertFrom-Size -Size $Height
        New-HTMLTag -Tag 'table' -Attributes @{ class = 'layoutTable' } {
            New-HTMLTag -Tag 'tbody' {
                New-HTMLTag -Tag 'tr' -Attributes @{class = 'layoutTableRow'; style = @{ 'height' = $HTMLHeight } } {
                    $Output
                }
            }
        }

    }
}