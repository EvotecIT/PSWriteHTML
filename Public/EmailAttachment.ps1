function EmailAttachment {
    <#
    .SYNOPSIS
    Creates an email attachment object for header attachments.

    .DESCRIPTION
    This function creates an email attachment object specifically for header attachments. It takes an array of file paths and returns a custom object representing the attachment.

    .PARAMETER FilePath
    Specifies an array of file paths for the attachments.

    .EXAMPLE
    $Attachment = EmailAttachment -FilePath 'C:\Files\attachment1.txt', 'C:\Files\attachment2.pdf'
    Creates an email attachment object with two file paths for header attachments.

    .EXAMPLE
    $Files = 'C:\Files\attachment1.txt', 'C:\Files\attachment2.pdf'
    $Attachment = EmailAttachment -FilePath $Files
    Creates an email attachment object with multiple file paths for header attachments.

    #>
    [CmdletBinding()]
    param(
        [string[]] $FilePath
    )
    [PSCustomObject] @{
        Type     = 'HeaderAttachment'
        FilePath = $FilePath
    }
}