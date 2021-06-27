function EmailLayoutColumn {
    [cmdletBinding()]
    param(
        [ScriptBlock] $ColumnLayout,
        [string] $Width,
        [string] $Alignment
    )

    if ($ColumnLayout) {
        $Output = & $ColumnLayout
        $HTMLWidth = ConvertFrom-Size -Size $Width
        New-HTMLTag -Tag 'td' -Attributes @{ class = 'layoutTableColumn'; width = $HTMLWidth; align = $Alignment; style = @{ 'max-width' = $HTMLWidth; "text-align" = $Alignment } } {
            $Output
        }
    }
}