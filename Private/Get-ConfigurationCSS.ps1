function Get-ConfigurationCSS {
    <#
    .SYNOPSIS
    Retrieves the CSS configuration for a specified feature and type.

    .DESCRIPTION
    This function retrieves the CSS configuration for a specified feature and type from the current configuration.

    .PARAMETER Feature
    Specifies the feature for which the CSS configuration is requested.

    .PARAMETER Type
    Specifies the type of CSS configuration to retrieve.

    .EXAMPLE
    Get-ConfigurationCSS -Feature "Header" -Type "Desktop"
    Retrieves the CSS configuration for the Header feature on the Desktop type.

    .EXAMPLE
    Get-ConfigurationCSS -Feature "Footer" -Type "Mobile"
    Retrieves the CSS configuration for the Footer feature on the Mobile type.
    #>
    [cmdletBinding()]
    param(
        [string] $Feature,
        [string] $Type
    )
    return $Script:CurrentConfiguration.Features.$Feature.$Type.CssInline
}