function New-HTMLPanelStyle {
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