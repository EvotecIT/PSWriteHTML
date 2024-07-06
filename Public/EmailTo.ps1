
function EmailTo {
    <#
    .SYNOPSIS
    Defines the email addresses to which the email should be sent.

    .DESCRIPTION
    This function sets the email addresses to which the email should be sent.

    .PARAMETER Addresses
    Specifies an array of email addresses to which the email should be sent.

    .EXAMPLE
    EmailTo -Addresses "user1@example.com", "user2@example.com"
    Sets the email addresses to which the email should be sent to "user1@example.com" and "user2@example.com".

    #>
    [CmdletBinding()]
    param(
        [string[]] $Addresses
    )

    [PsCustomObject] @{
        Type      = 'HeaderTo'
        Addresses = $Addresses
    }
}