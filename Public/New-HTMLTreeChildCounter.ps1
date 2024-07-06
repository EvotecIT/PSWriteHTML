function New-HTMLTreeChildCounter {
    <#
    .SYNOPSIS
    Creates a new HTML tree child counter object with specified options.

    .DESCRIPTION
    This function creates a new HTML tree child counter object with the ability to customize its behavior using the provided parameters.

    .PARAMETER Deep
    Indicates whether to count child elements recursively.

    .PARAMETER HideZero
    Indicates whether to hide counters for child elements with a count of zero.

    .PARAMETER HideExpanded
    Indicates whether to hide counters for expanded child elements.

    .EXAMPLE
    PS C:\> New-HTMLTreeChildCounter -Deep
    Creates a new HTML tree child counter object that counts child elements recursively.

    .EXAMPLE
    PS C:\> New-HTMLTreeChildCounter -HideZero -HideExpanded
    Creates a new HTML tree child counter object that hides counters for child elements with a count of zero and expanded child elements.

    #>
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