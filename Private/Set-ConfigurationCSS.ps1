function Set-ConfigurationCSS {
    [cmdletBinding()]
    param(
        [string] $Feature,
        [string] $Type,
        [System.Collections.IDictionary] $CSS
    )
    $Script:CurrentConfiguration.Features.$Feature.$Type.CssInline = $CSS
}