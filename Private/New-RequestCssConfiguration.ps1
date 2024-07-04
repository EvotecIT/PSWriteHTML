function New-RequestCssConfiguration {
    <#
    .SYNOPSIS
    Creates a new CSS configuration based on existing CSS code.

    .DESCRIPTION
    This function generates new named class names for existing CSS code based on the provided Pair dictionary. It then copies the original CSS configuration, removes unwanted sections, and renames existing CSS classes to their new names.

    .PARAMETER Pair
    Specifies a dictionary containing key-value pairs for mapping existing CSS classes to new names.

    .PARAMETER CssConfiguration
    Specifies the original CSS configuration to be modified.

    .PARAMETER Feature
    Specifies the feature associated with the CSS configuration.

    .PARAMETER Type
    Specifies the type of CSS configuration.

    .EXAMPLE
    $Pair = @{
        "Header" = "header-class";
        "Footer" = "footer-class"
    }
    $CssConfiguration = @{
        "header-class" = ".header";
        "footer-class" = ".footer";
    }
    $Feature = "Website"
    $Type = "Main"
    New-RequestCssConfiguration -Pair $Pair -CssConfiguration $CssConfiguration -Feature $Feature -Type $Type
    # Generates new CSS configuration based on the provided Pair dictionary.

    #>
    [cmdletBinding()]
    param(
        [System.Collections.IDictionary] $Pair,
        [System.Collections.IDictionary] $CssConfiguration,
        [string] $Feature,
        [string] $Type
    )
    # This process copies existing css code into new named class names
    $Name = $(Get-RandomStringName -Size 7)
    $ExpectedStyleSheetsConfiguration = [ordered] @{}
    foreach ($Key in $Pair.Keys) {
        $ExpectedStyleSheetsConfiguration[$Key] = ".$Key-$Name"
    }
    $RenamePair = [ordered] @{}
    foreach ($Key in $Pair.Keys) {
        $ClassName = $Pair[$Key]
        $RenamePair[$ClassName] = $ExpectedStyleSheetsConfiguration[$Key]
    }
    # We want to use different configuration for section based on existing original template
    # So we copy original CSSConfiguration
    $CssConfiguration = Copy-Dictionary -Dictionary $CssConfiguration
    # We then remove everything we're not interested in leaving only X sections that we modify
    Remove-ConfigurationCSS -CSS $CssConfiguration -Not -Section $Pair.Values
    # We now need to rename existing CSS classes to their new names
    Rename-Dictionary -HashTable $CssConfiguration -Pair $RenamePair

    # Now we need to get already existing CSS code that we may have generaed for other sections
    $CssOtherConfiguration = Get-ConfigurationCss -Feature $Feature -Type $Type
    # Finally we need to inject this into CSSInline configuration so it's delivered as style to final destination
    Set-ConfigurationCSS -CSS ($CssOtherConfiguration + $CssConfiguration) -Feature $Feature -Type $Type

    # We also need to tell that we actually want this added
    $Script:HTMLSchema.Features.$Feature = $true
    # Finally we overwrite what we need to deliver to users
    @{
        StyleSheetConfiguration = $ExpectedStyleSheetsConfiguration
        CssConfiguration        = $CssConfiguration
    }
}