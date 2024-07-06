function Remove-DotsFromCssClass {
    <#
    .SYNOPSIS
    Removes dots from CSS class names.

    .DESCRIPTION
    This function removes dots from CSS class names by trimming the leading dot from each class name.

    .PARAMETER Css
    Specifies a dictionary of CSS class names.

    .EXAMPLE
    Remove-DotsFromCssClass -Css @{ '.class1' = 'value1'; '.class2' = 'value2' }
    Removes dots from the CSS class names in the provided dictionary.

    #>
    [cmdletBinding()]
    param(
        [System.Collections.IDictionary] $Css
    )
    foreach ($Key in [string[]] $Css.Keys) {
        $Css[$Key] = $Css[$Key].TrimStart('.')
    }
}