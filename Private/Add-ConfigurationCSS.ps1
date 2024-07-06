function Add-ConfigurationCSS {
    <#
    .SYNOPSIS
    Adds or updates CSS configuration settings in a specified CSS dictionary.

    .DESCRIPTION
    The Add-ConfigurationCSS function allows you to add or update CSS configuration settings in a specified CSS dictionary. You can inject new CSS settings or overwrite existing ones based on the provided parameters.

    .PARAMETER CSS
    Specifies the CSS dictionary where the configuration settings will be added or updated.

    .PARAMETER Name
    Specifies the name of the CSS configuration settings to be added or updated.

    .PARAMETER Inject
    Specifies the CSS settings to be injected or overwritten in the CSS dictionary.

    .PARAMETER Overwrite
    Indicates whether existing CSS settings should be overwritten if they already exist.

    .EXAMPLE
    $CSS = @{}
    Add-ConfigurationCSS -CSS $CSS -Name "ButtonStyles" -Inject @{ 'color' = 'blue'; 'font-size' = '16px' }

    Description:
    Adds new CSS settings for the "ButtonStyles" configuration in the CSS dictionary.

    .EXAMPLE
    $CSS = @{}
    Add-ConfigurationCSS -CSS $CSS -Name "HeaderStyles" -Inject @{ 'color' = 'green'; 'font-size' = '20px' } -Overwrite

    Description:
    Updates existing CSS settings for the "HeaderStyles" configuration in the CSS dictionary by overwriting them.

    #>
    [cmdletBinding()]
    param(
        [System.Collections.IDictionary] $CSS,
        [string] $Name,
        [System.Collections.IDictionary] $Inject,
        [switch] $Overwrite
    )
    # Lets remove dead code
    if ($Inject) {
        Remove-EmptyValue -Hashtable $Inject
        if ($Css) {
            if ($CSS[$Name] -and (-not $Overwrite)) {
                # if exists and is not supposed to be overwritten
                # we just add or overwritte existing parts in $Inject
                foreach ($Key in $Inject.Keys) {
                    $CSS[$Name][$Key] = $Inject[$Key]
                }
            } else {
                $CSS[$Name] = $Inject
            }
        }
    }
}