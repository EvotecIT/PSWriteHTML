function Remove-DotsFromCssClass {
    <#
    .SYNOPSIS
    Remove dot from .class

    .DESCRIPTION
    Long description

    .PARAMETER Css
    Parameter description

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [cmdletBinding()]
    param(
        [System.Collections.IDictionary] $Css
    )
    foreach ($Key in [string[]] $Css.Keys) {
        $Css[$Key] = $Css[$Key].TrimStart('.')
    }
}