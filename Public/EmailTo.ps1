
function EmailTo {
    [CmdletBinding()]
    param(
        [string[]] $Addresses
    )

    [PsCustomObject] @{
        Type      = 'HeaderTo'
        Addresses = $Addresses
    }
}