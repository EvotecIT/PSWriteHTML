function EmailBCC {
    <#
    .SYNOPSIS
    Creates an email object for blind carbon copy (BCC) recipients.

    .DESCRIPTION
    This function creates an email object specifically for blind carbon copy (BCC) recipients. It takes an array of email addresses and returns a custom object representing the BCC recipients.

    .PARAMETER Addresses
    Specifies an array of email addresses for the BCC recipients.

    .EXAMPLE
    $BCCRecipients = EmailBCC -Addresses 'bcc1@example.com', 'bcc2@example.com'
    Creates an email object with two BCC recipients.

    .EXAMPLE
    $BCCList = 'bcc1@example.com', 'bcc2@example.com'
    $BCCRecipients = EmailBCC -Addresses $BCCList
    Creates an email object with multiple BCC recipients.

    #>
    [CmdletBinding()]
    param(
        [string[]] $Addresses
    )

    [PsCustomObject] @{
        Type      = 'HeaderBCC'
        Addresses = $Addresses
    }
}