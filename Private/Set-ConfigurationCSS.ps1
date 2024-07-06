function Set-ConfigurationCSS {
    <#
    .SYNOPSIS
    Sets CSS configuration for a specific feature and type.

    .DESCRIPTION
    This function sets the CSS configuration for a specific feature and type in the script's current configuration. It allows customization of CSS properties for different features and types.

    .PARAMETER Feature
    Specifies the feature for which the CSS configuration is being set.

    .PARAMETER Type
    Specifies the type of CSS configuration being set.

    .PARAMETER CSS
    Specifies the CSS properties to be set for the specified feature and type.

    .EXAMPLE
    Set-ConfigurationCSS -Feature 'Header' -Type 'Color' -CSS @{ 'color' = 'blue' }
    Sets the 'color' property to 'blue' for the 'Header' feature in the CSS configuration.

    .EXAMPLE
    Set-ConfigurationCSS -Feature 'Footer' -Type 'Font' -CSS @{ 'font-family' = 'Arial', 'font-size' = '12px' }
    Sets the font family to 'Arial' and font size to '12px' for the 'Footer' feature in the CSS configuration.
    #>
    [cmdletBinding()]
    param(
        [string] $Feature,
        [string] $Type,
        [System.Collections.IDictionary] $CSS
    )
    $Script:CurrentConfiguration.Features.$Feature.$Type.CssInline = $CSS
}