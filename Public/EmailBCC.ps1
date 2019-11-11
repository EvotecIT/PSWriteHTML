function EmailBCC {
    [CmdletBinding()]
    param(
        [string[]] $Addresses
    )

    [PsCustomObject] @{
        Type      = 'HeaderBCC'
        Addresses = $Addresses
    }
}