function EmailOptions {
    <#
    .SYNOPSIS
    Configures email options for sending notifications.

    .DESCRIPTION
    This function sets the priority and delivery notifications for email notifications.

    .PARAMETER Priority
    Specifies the priority of the email. Valid values are 'Low', 'Normal', or 'High'.

    .PARAMETER DeliveryNotifications
    Specifies when delivery notifications should be sent. Valid values are 'None', 'OnSuccess', 'OnFailure', 'Delay', or 'Never'.

    .EXAMPLE
    EmailOptions -Priority 'High' -DeliveryNotifications 'OnSuccess'
    Configures email options with High priority and delivery notifications on success.

    .EXAMPLE
    EmailOptions
    Configures email options with default settings.

    #>
    [CmdletBinding()]
    param(
        [ValidateSet('Low', 'Normal', 'High')] [string] $Priority = 'Normal',
        [ValidateSet('None', 'OnSuccess', 'OnFailure', 'Delay', 'Never')] $DeliveryNotifications = 'None',
        [Obsolete("Encoding is depracated. We're setting encoding to UTF8 always to prevent errors")]
        [Parameter(DontShow)][string] $Encoding
    )

    [PsCustomObject] @{
        Type                  = 'HeaderOptions'
        # From tests it seems UTF8 is the best way to go, always, especially that HTML created is UTF8, no need to set it
        #Encoding              = $Encoding
        DeliveryNotifications = $DeliveryNotifications
        Priority              = $Priority
    }
}