function Add-HTML {
    [alias('EmailHTML')]
    [CmdletBinding()]
    param(
        [ScriptBlock] $HTML
    )
    Invoke-Command -ScriptBlock $HTML
}