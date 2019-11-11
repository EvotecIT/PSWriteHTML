function EmailSubject {
    [CmdletBinding()]
    param(
        [string] $Subject
    )

    [PsCustomObject] @{
        Type    = 'HeaderSubject'
        Subject = $Subject
    }
}