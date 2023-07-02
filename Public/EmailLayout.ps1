function EmailLayout {
    [cmdletBinding()]
    param(
        [ScriptBlock] $Layout
    )

    Enable-HTMLFeature -Feature EmailLayout

    if ($Layout) {
        $Output = & $Layout

        if ($Output) {
            New-HTMLTag -Tag 'table' -Attributes @{class = 'layoutTable'; width = '100%' } {
                New-HTMLTag -Tag 'tbody' -Attributes @{ class = 'layoutTableBody' } {
                    New-HTMLTag -Tag 'tr' -Attributes @{ class = 'layoutTableRow' } {
                        $Output
                    }
                }
            }
        }
    }
}