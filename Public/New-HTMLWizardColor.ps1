function New-HTMLWizardColor {
    [CmdletBinding()]
    param(
        [string] $BorderColor,
        [string] $ToolbarBtnColor,
        [string] $ToolbarBtnBackgroundColor,
        [string] $AnchorDefaultPrimaryColor,
        [string] $AnchorDefaultSecondaryColor,
        [string] $AnchorActivePrimaryColor,
        [string] $AnchorActiveSecondaryColor,
        [string] $AnchorDonePrimaryColor,
        [string] $AnchorDoneSecondaryColor,
        [string] $AnchorDisabledPrimaryColor,
        [string] $AnchorDisabledSecondaryColor,
        [string] $AnchorErrorPrimaryColor,
        [string] $AnchorErrorSecondaryColor,
        [string] $AnchorWarningPrimaryColor,
        [string] $AnchorWarningSecondaryColor,
        [string] $ProgressColor,
        [string] $ProgressBackgroundColor,
        [string] $LoaderColor,
        [string] $LoaderBackgroundColor,
        [string] $LoaderBackgroundWrapperColor
    )
    Enable-HTMLFeature -Feature WizardColor

    if ($Script:CurrentConfiguration -and $Script:CurrentConfiguration.Features.WizardColor) {
        if ($Script:CurrentConfiguration -and $Script:CurrentConfiguration.Features.WizardColor) {
            if ($PSBoundParameters.ContainsKey('BorderColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-border-color'] = ConvertFrom-Color -Color $BorderColor
            }
            if ($PSBoundParameters.ContainsKey('ToolbarBtnColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-toolbar-btn-color'] = ConvertFrom-Color -Color $ToolbarBtnColor
            }
            if ($PSBoundParameters.ContainsKey('ToolbarBtnBackgroundColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-toolbar-btn-background-color'] = ConvertFrom-Color -Color $ToolbarBtnBackgroundColor
            }
            if ($PSBoundParameters.ContainsKey('AnchorDefaultPrimaryColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-anchor-default-primary-color'] = ConvertFrom-Color -Color $AnchorDefaultPrimaryColor
            }
            if ($PSBoundParameters.ContainsKey('AnchorDefaultSecondaryColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-anchor-default-secondary-color'] = ConvertFrom-Color -Color $AnchorDefaultSecondaryColor
            }
            if ($PSBoundParameters.ContainsKey('AnchorActivePrimaryColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-anchor-active-primary-color'] = ConvertFrom-Color -Color $AnchorActivePrimaryColor
            }
            if ($PSBoundParameters.ContainsKey('AnchorActiveSecondaryColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-anchor-active-secondary-color'] = ConvertFrom-Color -Color $AnchorActiveSecondaryColor
            }
            if ($PSBoundParameters.ContainsKey('AnchorDonePrimaryColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-anchor-done-primary-color'] = ConvertFrom-Color -Color $AnchorDonePrimaryColor
            }
            if ($PSBoundParameters.ContainsKey('AnchorDoneSecondaryColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-anchor-done-secondary-color'] = ConvertFrom-Color -Color $AnchorDoneSecondaryColor
            }
            if ($PSBoundParameters.ContainsKey('AnchorDisabledPrimaryColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-anchor-disabled-primary-color'] = ConvertFrom-Color -Color $AnchorDisabledPrimaryColor
            }
            if ($PSBoundParameters.ContainsKey('AnchorDisabledSecondaryColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-anchor-disabled-secondary-color'] = ConvertFrom-Color -Color $AnchorDisabledSecondaryColor
            }
            if ($PSBoundParameters.ContainsKey('AnchorErrorPrimaryColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-anchor-error-primary-color'] = ConvertFrom-Color -Color $AnchorErrorPrimaryColor
            }
            if ($PSBoundParameters.ContainsKey('AnchorErrorSecondaryColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-anchor-error-secondary-color'] = ConvertFrom-Color -Color $AnchorErrorSecondaryColor
            }
            if ($PSBoundParameters.ContainsKey('AnchorWarningPrimaryColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-anchor-warning-primary-color'] = ConvertFrom-Color -Color $AnchorWarningPrimaryColor
            }
            if ($PSBoundParameters.ContainsKey('AnchorWarningSecondaryColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-anchor-warning-secondary-color'] = ConvertFrom-Color -Color $AnchorWarningSecondaryColor
            }
            if ($PSBoundParameters.ContainsKey('ProgressColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-progress-color'] = ConvertFrom-Color -Color $ProgressColor
            }
            if ($PSBoundParameters.ContainsKey('ProgressBackgroundColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-progress-background-color'] = ConvertFrom-Color -Color $ProgressBackgroundColor
            }
            if ($PSBoundParameters.ContainsKey('LoaderColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-loader-color'] = ConvertFrom-Color -Color $LoaderColor
            }
            if ($PSBoundParameters.ContainsKey('LoaderBackgroundColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-loader-background-color'] = ConvertFrom-Color -Color $LoaderBackgroundColor
            }
            if ($PSBoundParameters.ContainsKey('LoaderBackgroundWrapperColor')) {
                $Script:CurrentConfiguration.Features.WizardColor.HeaderAlways.CssInline[':root']['--sw-loader-background-wrapper-color'] = ConvertFrom-Color -Color $LoaderBackgroundWrapperColor
            }
        }
    }
}
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName BorderColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName ToolbarBtnColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName ToolbarBtnBackgroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName AnchorDefaultPrimaryColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName AnchorDefaultSecondaryColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName AnchorActivePrimaryColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName AnchorActiveSecondaryColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName AnchorDonePrimaryColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName AnchorDoneSecondaryColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName AnchorDisabledPrimaryColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName AnchorDisabledSecondaryColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName AnchorErrorPrimaryColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName AnchorErrorSecondaryColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName AnchorWarningPrimaryColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName AnchorWarningSecondaryColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName ProgressColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName ProgressBackgroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName LoaderColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName LoaderBackgroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLWizardColor -ParameterName LoaderBackgroundWrapperColor -ScriptBlock $Script:ScriptBlockColors