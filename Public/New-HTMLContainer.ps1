function New-HTMLContainer {
    param(
        [Parameter(Mandatory = $false, Position = 0)][ScriptBlock] $HTML
    )

    New-HTMLTag -Tag 'div' -Attributes @{ class = 'flexElement' } {
        if ($HTML) {
            Invoke-Command -ScriptBlock $HTML
        }
    }
}