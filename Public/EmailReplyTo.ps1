function EmailReplyTo {
    <#
    .SYNOPSIS
    Defines the email address to which replies should be directed.

    .DESCRIPTION
    This function sets the email address to which replies should be directed when receiving notifications.

    .PARAMETER Address
    Specifies the email address to which replies should be directed.

    .EXAMPLE
    EmailReplyTo -Address "reply@example.com"
    Sets the email address to which replies should be directed to "reply@example.com".

    #>
    [CmdletBinding()]
    param(
        [string] $Address
    )

    [PsCustomObject] @{
        Type    = 'HeaderReplyTo'
        Address = $Address
    }
}