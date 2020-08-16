function New-HTMLPanelOption {
    [alias('New-HTMLPanelOptions', 'New-PanelOption', "PanelOption")]
    [cmdletBinding()]
    param(
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('0px', '5px', '10px', '15px', '20px', '25px')][string] $BorderRadius,
        [Parameter(ParameterSetName = 'Manual')][switch] $RemoveShadow
    )

    # lets get original CSS configuration
    $CssConfiguration = Get-ConfigurationCss -Feature 'Default' -Type 'HeaderAlways'
    if ($RemoveShadow) {
        Remove-ConfigurationCSS -CSS $CssConfiguration -Name 'defaultPanel' -Property 'box-shadow'
    }
    Add-ConfigurationCSS -CSS $CssConfiguration -Name 'defaultPanel' -Inject @{ 'border-radius' = $BorderRadius }
}