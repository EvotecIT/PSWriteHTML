function New-HTMLNavFloat {
    <#
    .SYNOPSIS
    Creates a new HTML floating navigation menu with customizable options.

    .DESCRIPTION
    This function creates a new HTML floating navigation menu with various customization options such as navigation links, title, tagline, colors, and button styling for hover effects.

    .PARAMETER NavigationLinks
    Specifies the script block containing navigation links to be displayed in the menu.

    .PARAMETER Title
    Specifies the title of the floating navigation menu.

    .PARAMETER SubTitle
    Specifies the subtitle or tagline of the floating navigation menu.

    .PARAMETER TitleColor
    Specifies the color of the title text.

    .PARAMETER TaglineColor
    Specifies the color of the tagline text.

    .PARAMETER ButtonLocationTop
    Specifies the top position of the floating navigation menu button.

    .PARAMETER ButtonLocationLeft
    Specifies the left position of the floating navigation menu button.

    .PARAMETER ButtonLocationRight
    Specifies the right position of the floating navigation menu button.

    .PARAMETER ButtonLocationBottom
    Specifies the bottom position of the floating navigation menu button.

    .PARAMETER ButtonColor
    Specifies the color of the floating navigation menu button.

    .PARAMETER ButtonColorBackground
    Specifies the background color of the floating navigation menu button.

    .PARAMETER ButtonColorOnHover
    Specifies the color of the floating navigation menu button on hover.

    .PARAMETER ButtonColorBackgroundOnHover
    Specifies the background color of the floating navigation menu button on hover.
    #>
    [cmdletBinding()]
    param(
        [ScriptBlock] $NavigationLinks,
        [string] $Title,
        [alias('SubTitle')][string] $Tagline,
        [string] $TitleColor,
        [string] $TaglineColor,
        [object] $ButtonLocationTop,
        [object] $ButtonLocationLeft,
        [object] $ButtonLocationRight,
        [object] $ButtonLocationBottom,
        [string] $ButtonColor,
        [string] $ButtonColorBackground,
        [string] $ButtonColorOnHover,
        [string] $ButtonColorBackgroundOnHover
    )

    $Script:HTMLSchema.Features.NavigationFloat = $true
    $Script:HTMLSchema.Features.JQuery = $true
    $Script:HTMLSchema.Features.FontsMaterialIcon = $true
    $Script:HTMLSchema.Features.FontsAwesome = $true

    # We also need to make sure we add this to all pages, not just the primary one
    $Script:GlobalSchema.Features.NavigationFloat = $true
    $Script:GlobalSchema.Features.JQuery = $true
    $Script:GlobalSchema.Features.FontsMaterialIcon = $true
    $Script:GlobalSchema.Features.FontsAwesome = $true

    #$Script:CurrentConfiguration['Features']['Main']['HeaderAlways']['CssInLine']['.main-section']['margin-top'] = '55px'
    $Script:CurrentConfiguration['Features']['NavigationFloat']['HeaderAlways']['CssInLine']['.penal-trigger']['top'] = $ButtonLocationTop
    $Script:CurrentConfiguration['Features']['NavigationFloat']['HeaderAlways']['CssInLine']['.penal-trigger']['left'] = $ButtonLocationLeft
    $Script:CurrentConfiguration['Features']['NavigationFloat']['HeaderAlways']['CssInLine']['.penal-trigger']['right'] = $ButtonLocationRight
    $Script:CurrentConfiguration['Features']['NavigationFloat']['HeaderAlways']['CssInLine']['.penal-trigger']['bottom'] = $ButtonLocationBottom
    $Script:CurrentConfiguration['Features']['NavigationFloat']['HeaderAlways']['CssInLine']['.penal-trigger']['background-color'] = ConvertFrom-Color -Color $ButtonColorBackground
    $Script:CurrentConfiguration['Features']['NavigationFloat']['HeaderAlways']['CssInLine']['.penal-trigger']['color'] = ConvertFrom-Color -Color $ButtonColor
    # title color
    $Script:CurrentConfiguration['Features']['NavigationFloat']['HeaderAlways']['CssInLine']['.penal-widget.top-header h2']['color'] = ConvertFrom-Color -Color $TitleColor
    # tagline color
    $Script:CurrentConfiguration['Features']['NavigationFloat']['HeaderAlways']['CssInLine']['.top-header .tagline']['color'] = ConvertFrom-Color -Color $TaglineColor
    # trigger hover
    $Script:CurrentConfiguration['Features']['NavigationFloat']['HeaderAlways']['CssInLine']['.penal-trigger:hover']['background-color'] = ConvertFrom-Color -Color $ButtonColorBackgroundOnHover
    $Script:CurrentConfiguration['Features']['NavigationFloat']['HeaderAlways']['CssInLine']['.penal-trigger:hover']['color'] = ConvertFrom-Color -Color $ButtonColorOnHover

    if ($NavigationLinks) {
        $Output = & $NavigationLinks
    }

    # Header
    $Navigation = @(
        New-HTMLTag -Tag 'nav' -Attributes @{ class = 'evotec-navigation' } {
            # button to open side penal
            New-HTMLTag -Tag 'button' -Attributes @{ class = 'penal-trigger' }

            New-HTMLTag -Tag 'section' -Attributes @{ class = 'side-penal' } {
                New-HTMLTag -Tag 'div' -Attributes @{class = 'penal-widget top-header' } {
                    New-HTMLTag -Tag 'h2' {
                        $Title
                    }
                    New-HTMLTag -Tag 'i' -Attributes @{ class = 'tagline' } {
                        $Tagline
                    }

                    if ($Output) {
                        $Output
                    }
                }
            }
        }
    )

    [PSCustomObject] @{
        Type   = 'Navigation'
        Output = $Navigation
    }

}
Register-ArgumentCompleter -CommandName New-HTMLNavFloat -ParameterName ButtonColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLNavFloat -ParameterName ButtonColorBackground -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLNavFloat -ParameterName ButtonColorBackgroundOnHover -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLNavFloat -ParameterName ButtonColorOnHover -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLNavFloat -ParameterName TitleColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLNavFloat -ParameterName TaglineColor -ScriptBlock $Script:ScriptBlockColors