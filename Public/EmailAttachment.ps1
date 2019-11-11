function EmailAttachment {
    [CmdletBinding()]
    param(
        [string[]] $FilePath
    )
    [PSCustomObject] @{
        Type     = 'HeaderAttachment'
        FilePath = $FilePath
    }
}