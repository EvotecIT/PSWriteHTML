function EmailFrom {
    <#
    .SYNOPSIS
    Creates an email object for the sender address.

    .DESCRIPTION
    This function creates an email object specifically for the sender address. It takes a single email address as input and returns a custom object representing the sender address.

    .PARAMETER Address
    Specifies the email address of the sender.

    .EXAMPLE
    $Sender = EmailFrom -Address 'sender@example.com'
    Creates an email object with the specified sender address.

    #>
    [CmdletBinding()]
    param(
        [string] $Address
    )

    [PsCustomObject] @{
        Type      = 'HeaderFrom'
        Address = $Address
    }
}