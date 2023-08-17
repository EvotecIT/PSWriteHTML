function New-HTMLTreeChildCounter {
    [CmdletBinding()]
    param(
        [switch] $Deep,
        [switch] $HideZero,
        [switch] $HideExpanded
    )


    $Counter = [ordered] @{
        Type         = 'ChildCounter'
        childcounter = [ordered] @{
            deep         = $Deep.IsPresent
            hideZeros    = $HideZero.IsPresent
            hideExpanded = $HideExpanded.IsPresent
        }
    }
    $Counter
}