function New-HTMLTabPanelColor {
    [CmdletBinding()]
    param(
        [string] $BackgrounColor,
        [string] $BorderWidth = '1px',
        [ValidateSet('solid', 'dotted', 'dashed', 'double', 'groove', 'ridge', 'inset', 'outset', 'none', 'hidden')][string] $BorderStyle = 'solid',
        [string] $BorderColor = '#eeeeee',
        [string] $AnchorDefaultPrimaryColor,
        [string] $AnchorDefaultSecondaryColor,
        [string] $AnchorActivePrimaryColor,
        [string] $AnchorActiveSecondaryColor,
        [string] $AnchorDisabledPrimaryColor,
        [string] $AnchorDisabledSecondaryColor,
        [string] $LoaderColor,
        [string] $LoaderBackgroundColor,
        [string] $LoaderBackgroundWrapperColor
    )
    Enable-HTMLFeature -Feature TabsInlineColor

    if ($Script:CurrentConfiguration -and $Script:CurrentConfiguration.Features.TabsInlineColor) {
        if ($PSBoundParameters.ContainsKey('BackgrounColor')) {
            $Script:CurrentConfiguration.Features.TabsInlineColor.HeaderAlways.CssInline[':root']['--st-background'] = ConvertFrom-Color -Color $BackgrounColor
        }
        if ($PSBoundParameters.ContainsKey('BorderColor') -or $PSBoundParameters.ContainsKey('BorderWidth') -or $PSBoundParameters.ContainsKey('BorderStyle')) {
            $BorderSizeConverted = ConvertFrom-Size -Size $BorderWidth
            $Script:CurrentConfiguration.Features.TabsInlineColor.HeaderAlways.CssInline[':root']['--st-border'] = "$BorderSizeConverted $BorderStyle $(ConvertFrom-Color -Color $BorderColor)"
        }
        if ($PSBoundParameters.ContainsKey('AnchorDefaultPrimaryColor')) {
            $Script:CurrentConfiguration.Features.TabsInlineColor.HeaderAlways.CssInline[':root']['--st-anchor-default-primary-color'] = ConvertFrom-Color -Color $AnchorDefaultPrimaryColor
        }
        if ($PSBoundParameters.ContainsKey('AnchorDefaultSecondaryColor')) {
            $Script:CurrentConfiguration.Features.TabsInlineColor.HeaderAlways.CssInline[':root']['--st-anchor-default-secondary-color'] = ConvertFrom-Color -Color $AnchorDefaultSecondaryColor
        }
        if ($PSBoundParameters.ContainsKey('AnchorActivePrimaryColor')) {
            $Script:CurrentConfiguration.Features.TabsInlineColor.HeaderAlways.CssInline[':root']['--st-anchor-active-primary-color'] = ConvertFrom-Color -Color $AnchorActivePrimaryColor
        }
        if ($PSBoundParameters.ContainsKey('AnchorActiveSecondaryColor')) {
            $Script:CurrentConfiguration.Features.TabsInlineColor.HeaderAlways.CssInline[':root']['--st-anchor-active-secondary-color'] = ConvertFrom-Color -Color $AnchorActiveSecondaryColor
        }
        if ($PSBoundParameters.ContainsKey('AnchorDisabledPrimaryColor')) {
            $Script:CurrentConfiguration.Features.TabsInlineColor.HeaderAlways.CssInline[':root']['--st-anchor-disabled-primary-color'] = ConvertFrom-Color -Color $AnchorDisabledPrimaryColor
        }
        if ($PSBoundParameters.ContainsKey('AnchorDisabledSecondaryColor')) {
            $Script:CurrentConfiguration.Features.TabsInlineColor.HeaderAlways.CssInline[':root']['--st-anchor-disabled-secondary-color'] = ConvertFrom-Color -Color $AnchorDisabledSecondaryColor
        }
        if ($PSBoundParameters.ContainsKey('LoaderColor')) {
            $Script:CurrentConfiguration.Features.TabsInlineColor.HeaderAlways.CssInline[':root']['--st-loader-color'] = ConvertFrom-Color -Color $LoaderColor
        }
        if ($PSBoundParameters.ContainsKey('LoaderBackgroundColor')) {
            $Script:CurrentConfiguration.Features.TabsInlineColor.HeaderAlways.CssInline[':root']['--st-loader-background-color'] = ConvertFrom-Color -Color $LoaderBackgroundColor
        }
        if ($PSBoundParameters.ContainsKey('LoaderBackgroundWrapperColor')) {
            $Script:CurrentConfiguration.Features.TabsInlineColor.HeaderAlways.CssInline[':root']['--st-loader-background-wrapper-color'] = ConvertFrom-Color -Color $LoaderBackgroundWrapperColor
        }
    }
}
Register-ArgumentCompleter -CommandName New-HTMLTabPanelColor -ParameterName BackgrounColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabPanelColor -ParameterName BorderColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabPanelColor -ParameterName AnchorDefaultPrimaryColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabPanelColor -ParameterName AnchorDefaultSecondaryColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabPanelColor -ParameterName AnchorActivePrimaryColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabPanelColor -ParameterName AnchorActiveSecondaryColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabPanelColor -ParameterName AnchorDisabledPrimaryColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabPanelColor -ParameterName AnchorDisabledSecondaryColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabPanelColor -ParameterName LoaderColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabPanelColor -ParameterName LoaderBackgroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabPanelColor -ParameterName LoaderBackgroundWrapperColor -ScriptBlock $Script:ScriptBlockColors