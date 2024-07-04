function EmailHeader {
    <#
    .SYNOPSIS
    Creates email headers based on the provided ScriptBlock.

    .DESCRIPTION
    This function creates email headers using the specified ScriptBlock. It allows customization of email headers before sending an email.

    .PARAMETER EmailHeader
    Specifies the ScriptBlock containing the email header content.

    .EXAMPLE
    $EmailHeader = {
        'From: sender@example.com'
        'To: recipient@example.com'
        'Subject: Hello World'
    }
    $Headers = EmailHeader -EmailHeader $EmailHeader
    Creates email headers with sender, recipient, and subject information.

    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][ScriptBlock] $EmailHeader
    )
    $EmailHeaders = Invoke-Command -ScriptBlock $EmailHeader
    $EmailHeaders
}