function EmailOptions {
    [CmdletBinding()]
    param(
        [ValidateSet('Low', 'Normal', 'High')] [string] $Priority = 'Normal',
        [ValidateSet('None', 'OnSuccess', 'OnFailure', 'Delay', 'Never')] $DeliveryNotifications = 'None',
        [string] $Encoding = 'Unicode'
    )

    [PsCustomObject] @{
        Type                  = 'HeaderOptions'
        Encoding              = $Encoding
        DeliveryNotifications = $DeliveryNotifications
        Priority              = $Priority
    }
}