function Insert-HTML {
    [alias('SendHTML')]
    [CmdletBinding()]
    param(
        [ScriptBlock] $Content
    )
    Invoke-Command -ScriptBlock $Content
}
