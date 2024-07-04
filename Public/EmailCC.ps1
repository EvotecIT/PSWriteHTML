function EmailCC {
    <#
    .SYNOPSIS
    Creates an email object for carbon copy (CC) recipients.

    .DESCRIPTION
    This function creates an email object specifically for carbon copy (CC) recipients. It takes an array of email addresses and returns a custom object representing the CC recipients.

    .PARAMETER Addresses
    Specifies an array of email addresses for the CC recipients.

    .EXAMPLE
    $CCRecipients = EmailCC -Addresses 'cc1@example.com', 'cc2@example.com'
    Creates an email object with two CC recipients.

    .EXAMPLE
    $CCList = 'cc1@example.com', 'cc2@example.com'
    $CCRecipients = EmailCC -Addresses $CCList
    Creates an email object with multiple CC recipients.
    #>
    [CmdletBinding()]
    param(
        [string[]] $Addresses
    )

    [PsCustomObject] @{
        Type      = 'HeaderCC'
        Addresses = $Addresses
    }
}