function EmailOptions {
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