function EmailSubject {
    <#
    .SYNOPSIS
    Defines the subject line for an email.

    .DESCRIPTION
    This function sets the subject line for an email message.

    .PARAMETER Subject
    Specifies the subject line of the email.

    .EXAMPLE
    EmailSubject -Subject "Important Notification"
    Sets the subject line of the email to "Important Notification".

    #>
    [CmdletBinding()]
    param(
        [string] $Subject
    )

    [PsCustomObject] @{
        Type    = 'HeaderSubject'
        Subject = $Subject
    }
}