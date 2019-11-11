function EmailCC {
    [CmdletBinding()]
    param(
        [string[]] $Addresses
    )

    [PsCustomObject] @{
        Type      = 'HeaderCC'
        Addresses = $Addresses
    }
}