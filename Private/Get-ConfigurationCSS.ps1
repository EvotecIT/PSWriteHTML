function Get-ConfigurationCSS {
    [cmdletBinding()]
    param(
        [string] $Feature,
        [string] $Type
    )
    return $Script:CurrentConfiguration.Features.$Feature.$Type.CssInline
}