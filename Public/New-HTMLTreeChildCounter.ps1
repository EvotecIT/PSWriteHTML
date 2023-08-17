function New-HTMLTreeChildCounter {
    [CmdletBinding()]
    param(
        [switch] $Deep,
        [switch] $HideZero,
        [switch] $HideExpanded
    )


    $Counter = [ordered] @{
        Type      = 'ChildCounter'
        Settings  = [ordered] @{
            childcounter = @{
                deep         = $Deep.IsPresent
                hideZeros    = $HideZero.IsPresent
                hideExpanded = $HideExpanded.IsPresent
            }
        }
        Extension = 'childcounter'
    }
    $Counter
}