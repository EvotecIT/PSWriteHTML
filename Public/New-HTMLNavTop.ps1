function New-HTMLNavTop {
    <#
    .SYNOPSIS
    Creates a top navigation bar in HTML format with customizable options.

    .DESCRIPTION
    This function generates a top navigation bar in HTML format with customizable options such as navigation links, logo, colors, and more.

    .PARAMETER NavigationLinks
    Specifies the script block containing the navigation links to be displayed.

    .PARAMETER Logo
    Specifies the path to the logo image.

    .PARAMETER LogoLink
    Specifies the URL to link the logo to.

    .PARAMETER LogoLinkHome
    Indicates whether the logo should link to the home page.

    .PARAMETER MenuItemsWidth
    Specifies the width of the menu items.

    .PARAMETER MenuColor
    Specifies the color of the menu text.

    .PARAMETER MenuColorBackground
    Specifies the background color of the menu.

    .PARAMETER HomeColor
    Specifies the color of the home link text.

    .PARAMETER HomeColorBackground
    Specifies the background color of the home link.

    .PARAMETER HomeLink
    Specifies the URL for the home link.

    .PARAMETER HomeLinkHome
    Indicates whether the home link should link to the home page.

    .PARAMETER Convert
    Switch parameter to indicate if conversion is needed.

    .EXAMPLE
    New-HTMLNavTop -NavigationLinks { 
        "Link 1", "Link 2", "Link 3" 
    } -Logo "logo.png" -LogoLink "https://example.com" -LogoLinkHome -MenuItemsWidth '250px' -MenuColor 'Blue' -MenuColorBackground 'White' -HomeColor 'Red' -HomeColorBackground 'White' -HomeLink "https://example.com/home" -HomeLinkHome
    Creates a top navigation bar with specified navigation links, logo, colors, and home link.

    #>
    [cmdletBinding()]
    param(
        [ScriptBlock] $NavigationLinks,
        [string] $Logo,
        [string] $LogoLink,
        [switch] $LogoLinkHome,

        [object] $MenuItemsWidth = '200px',

        [string] $MenuColor = 'PacificBlue',
        [string] $MenuColorBackground = 'Black',
        [string] $HomeColor = 'PacificBlue',
        [string] $HomeColorBackground = 'Black',
        [string] $HomeLink,
        [switch] $HomeLinkHome,
        [Parameter(DontShow)][switch] $Convert
    )
    if (-not $Convert) {
        $Script:HTMLSchema.Features.NavigationMenuDropdown = $true
        $Script:HTMLSchema.Features.AnimateToolkit = $true
        $Script:HTMLSchema.Features.JQuery = $true
        $Script:HTMLSchema.Features.FontsMaterialIcon = $true
        $Script:HTMLSchema.Features.FontsAwesome = $true

        # We also need to make sure we add this to all pages, not just the primary one
        $Script:GlobalSchema.Features.NavigationMenuDropdown = $true
        $Script:GlobalSchema.Features.AnimateToolkit = $true
        $Script:GlobalSchema.Features.JQuery = $true
        $Script:GlobalSchema.Features.FontsMaterialIcon = $true
        $Script:GlobalSchema.Features.FontsAwesome = $true

        $Script:CurrentConfiguration['Features']['Main']['HeaderAlways']['CssInLine']['.main-section']['margin-top'] = '55px'


        $Script:CurrentConfiguration['Features']['NavigationMenuDropdown']['HeaderAlways']['CssInLine']['@media only screen and (min-width: 480px)']['.menu-items']['width'] = $MenuItemsWidth
        $Script:CurrentConfiguration['Features']['NavigationMenuDropdown']['HeaderAlways']['CssInLine']['@media only screen and (min-width: 480px)']['.has-child ul']['width'] = $MenuItemsWidth

        if ($LogoLinkHome) {
            $LogoLink = "$($Script:GlobalSchema.StorageInformation.FileName)$($Script:GlobalSchema.StorageInformation.Extension)"
        }
        if ($HomeLinkHome) {
            $HomeHref = "$($Script:GlobalSchema.StorageInformation.FileName)$($Script:GlobalSchema.StorageInformation.Extension)"
        } elseif ($HomeLink) {
            $HomeHref = $HomeLink
        } else {
            $HomeHref = '#'
        }
    }

    if ($NavigationLinks) {
        $Output = & $NavigationLinks
        $TopMenu = [System.Collections.Generic.List[string]]::new()
        foreach ($Link in $Output) {
            if ($Link.Type -eq 'TopMenu') {
                $TopMenu.Add($Link.Value)
            }
        }
    }

    $Options = @{
        skin     = @{
            'color'            = ConvertFrom-Color -Color $MenuColor
            'background-color' = ConvertFrom-Color -Color $MenuColorBackground
        }
        skinHome = @{
            'color'            = ConvertFrom-Color -Color $HomeColor
            'background-color' = ConvertFrom-Color -Color $HomeColorBackground
        }
    }
    $OptionsJSON = $Options | ConvertTo-Json

    $IconSolid = 'home'
    $Navigation = @(
        # Navigation
        New-HTMLTag -Tag 'nav' -Attributes @{ class = 'codehim-dropdown evotec-navigation' } {
            New-HTMLTag -Tag 'ul' -Attributes @{ class = 'dropdown-items' } {
                New-HTMLTag -Tag 'li' -Attributes @{ class = 'home-link' } {
                    New-HTMLTag -Tag 'a' -Attributes @{ href = $HomeHref } {
                        New-InternalNavIcon -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
                    }
                }
                <#
                New-HTMLTag -Tag 'li' -Attributes @{ class = 'home-logo' } {
                    # Brand logo
                    #New-HTMLTag -Tag 'div' -Attributes @{ class = 'brand-logo' } {
                    New-HTMLTag -Tag 'a' -Attributes @{ href = $LogoLink } {
                        New-HTMLTag -Tag 'img' -Attributes @{ src = $Logo; title = 'PSWriteHTML Logo'; alt = 'PSWriteHTML Logo' }
                    }
                    #}
                }
                #>
                if ($TopMenu) {
                    $TopMenu
                }
            }
            if ($Logo) {
                <#
                New-HTMLTag -Tag 'ul' -Attributes @{ class = 'dropdown-logo' } {
                    New-HTMLTag -Tag 'li' -Attributes @{ class = 'home-logo' } {
                        New-HTMLTag -Tag 'a' -Attributes @{ href = $LogoLink } {
                            New-HTMLTag -Tag 'img' -Attributes @{ src = $Logo; title = 'PSWriteHTML Logo'; alt = 'PSWriteHTML Logo' }
                        }
                    }
                }
                #>
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'home-logo' } {
                    New-HTMLTag -Tag 'a' -Attributes @{ href = $LogoLink } {
                        New-HTMLTag -Tag 'img' -Attributes @{ src = $Logo; title = 'PSWriteHTML Logo'; alt = 'PSWriteHTML Logo' } -NoClosing
                    }
                }
            }
            New-HTMLTag -Tag 'script' {
                "`$(document).ready(function () {"
                "    `$('.codehim-dropdown').CodehimDropdown($OptionsJSON);"
                "});"
            }
        }
    )
    [PSCustomObject] @{
        Type   = 'Navigation'
        Output = $Navigation
    }
}

Register-ArgumentCompleter -CommandName New-HTMLNavTop -ParameterName HomeColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLNavTop -ParameterName HomeColorBackground -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLNavTop -ParameterName MenuColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLNavTop -ParameterName MenuColorBackground -ScriptBlock $Script:ScriptBlockColors