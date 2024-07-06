function New-HTMLPanelStyle {
    <#
    .SYNOPSIS
    Creates a new HTML panel style with customizable options.

    .DESCRIPTION
    This function creates a new HTML panel style with the ability to set the border radius, remove shadow, and request configuration settings.

    .EXAMPLE
    New-HTMLPanelStyle -BorderRadius '10px' -RemoveShadow
    Creates a new HTML panel style with a border radius of 10px and removes the shadow.

    .EXAMPLE
    New-HTMLPanelStyle -BorderRadius '15px' -RequestConfiguration
    Creates a new HTML panel style with a border radius of 15px and requests the configuration settings.

    .PARAMETER BorderRadius
    Specifies the border radius for the HTML panel. Valid values are '0px', '5px', '10px', '15px', '20px', '25px'.

    .PARAMETER RemoveShadow
    Indicates whether to remove the shadow from the HTML panel.

    .PARAMETER RequestConfiguration
    Specifies whether to request the configuration settings for the HTML panel.

    .NOTES
    File Name      : New-HTMLPanelStyle.ps1
    Prerequisite   : This function requires the Get-ConfigurationCss and related functions.
    #>
    [alias('New-HTMLPanelOption', 'New-PanelOption', "PanelOption", 'New-PanelStyle', 'PanelStyle')]
    [cmdletBinding()]
    param(
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('0px', '5px', '10px', '15px', '20px', '25px')][string] $BorderRadius,
        [Parameter(ParameterSetName = 'Manual')][switch] $RemoveShadow,
        [Parameter(ParameterSetName = 'Manual')][switch] $RequestConfiguration
    )
    # lets get original CSS configuration
    $CssConfiguration = Get-ConfigurationCss -Feature 'DefaultPanel' -Type 'HeaderAlways'

    $StyleSheetsConfiguration = [ordered] @{
        Panel = ".defaultPanel"
    }

    # This is only if we want to have multiple styles
    if ($RequestConfiguration) {
        $RequestedConfiguration = New-RequestCssConfiguration -Pair $StyleSheetsConfiguration -CSSConfiguration $CssConfiguration -Feature 'Inject' -Type 'HeaderAlways'
        $StyleSheetsConfiguration = $RequestedConfiguration.StyleSheetConfiguration
        $CssConfiguration = $RequestedConfiguration.CSSConfiguration
    }

    # Here's the real overwrite of panel configuration
    if ($RemoveShadow) {
        Remove-ConfigurationCSS -CSS $CssConfiguration -Name $StyleSheetsConfiguration.Panel -Property 'box-shadow'
    }
    Add-ConfigurationCSS -CSS $CssConfiguration -Name $StyleSheetsConfiguration.Panel -Inject @{ 'border-radius' = $BorderRadius }

    if ($RequestConfiguration) {
        # We only return this when requesting configuration
        # otherwise this overwrites global section settings
        return $StyleSheetsConfiguration
    }
}