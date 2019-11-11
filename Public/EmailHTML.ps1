function EmailHTML {
    [CmdletBinding()]
    param(
        [ScriptBlock] $HTML
    )
    Invoke-Command -ScriptBlock $HTML
}