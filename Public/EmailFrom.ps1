function EmailFrom {
    [CmdletBinding()]
    param(
        [string] $Address
    )

    [PsCustomObject] @{
        Type      = 'HeaderFrom'
        Address = $Address
    }
}