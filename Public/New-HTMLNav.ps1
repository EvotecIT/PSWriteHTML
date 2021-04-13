function New-HTMLNav {
    [cmdletBinding()]
    param(
        [ScriptBlock] $NavigationLinks,
        [string] $Logo,
        [string] $LogoLink,
        [switch] $LogoLinkHome,
        [switch] $DisableBackgroundFading,
        [switch] $DisableClickToClose,
        [switch] $DisableNavControls,
        [switch] $DisableStickyMenubar,
        [switch] $StartMenuOpen,
        [switch] $FixedMenu,
        [switch] $DisableHamburger,
        [switch] $ResizeContent,
        [int] $MenuWidth = 270,
        [int] $MenuWidthExtended = 320,
        [string] $TopBarBackGroundColor,
        [string] $TopBarColor,
        [string] $LeftMenuBackgroundColor,
        [string] $LeftMenuColor
    )
    $Script:HTMLSchema.Features.NavigationMenuHS = $true
    $Script:HTMLSchema.Features.JQuery = $true
    $Script:HTMLSchema.Features.FontsMaterialIcon = $true
    $Script:HTMLSchema.Features.FontsAwesome = $true

    # We also need to make sure we add this to all pages, not just the primary one
    $Script:GlobalSchema.Features.NavigationMenuHS = $true
    $Script:GlobalSchema.Features.JQuery = $true
    $Script:GlobalSchema.Features.FontsMaterialIcon = $true
    $Script:GlobalSchema.Features.FontsAwesome = $true

    $Script:CurrentConfiguration['Features']['Main']['HeaderAlways']['CssInLine']['.main-section']['margin-top'] = '55px'


    $Script:CurrentConfiguration['Features']['NavigationMenuHS']['HeaderAlways']['CssInLine']['.hs-menubar']['background-color'] = ConvertFrom-Color -Color $TopBarBackGroundColor
    $Script:CurrentConfiguration['Features']['NavigationMenuHS']['HeaderAlways']['CssInLine']['.hs-menubar']['color'] = ConvertFrom-Color -Color $TopBarColor
    $Script:CurrentConfiguration['Features']['NavigationMenuHS']['HeaderAlways']['CssInLine']['.hs-navigation']['background-color'] = ConvertFrom-Color -Color $LeftMenuBackgroundColor
    $Script:CurrentConfiguration['Features']['NavigationMenuHS']['HeaderAlways']['CssInLine']['.hs-navigation']['color'] = ConvertFrom-Color -Color $LeftMenuColor


    if ($LogoLinkHome) {
        $LogoLink = "$($Script:GlobalSchema.StorageInformation.FileName).html"
    }

    if ($NavigationLinks) {
        $Output = & $NavigationLinks
        $NavGridItems = [System.Collections.Generic.List[string]]::new()
        $NavLinks = [System.Collections.Generic.List[string]]::new()
        $NavGridMenu = [System.Collections.Generic.List[string]]::new()
        $TopMenu = [System.Collections.Generic.List[string]]::new()
        foreach ($Link in $Output) {
            if ($Link.Type -eq 'NavGridItem') {
                $NavGridItems.Add($Link.Value)
            } elseIf ($Link.Type -eq 'NavLinkItem') {
                $NavLinks.Add($Link.Value)
            } elseif ($Link.Type -eq 'NavGridMenu') {
                $NavGridMenu.Add($Link.Value)
            } elseif ($Link.Type -eq 'TopMenu') {
                $TopMenu.Add($Link.Value)
            }
        }
    }

    $Options = @{
        bgFading          = -not $DisableBackgroundFading.IsPresent #//(false to disable) background dim overlay when side navigation drawer open
        outClickToClose   = -not $DisableClickToClose.IsPresent #// (false to disable) close opened items if user click outside of them
        navControls       = -not $DisableNavControls.IsPresent #// (false to disable) provide buttons to allow visitors to increase some width and height of drawer
        fixedMenubar      = -not $DisableStickyMenubar.IsPresent #//false to static
        startMenuOpen     = $StartMenuOpen.IsPresent
        fixedMenu         = $FixedMenu.IsPresent
        disableHamburger  = $DisableHamburger.IsPresent
        resizeContent     = $ResizeContent.IsPresent
        menuWidth         = $MenuWidth
        menuWidthExtended = $menuWidthExtended
    }
    $OptionsJSON = $Options | ConvertTo-Json

    # Header
    $Navigation = @(


        # Navigation
        New-HTMLTag -Tag 'nav' -Attributes @{ class = 'hs-navigation evotec-navigation' } {
            New-HTMLTag -Tag 'header' -Attributes @{ class = 'hs-menubar' } {
                # Menu Trigger
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'menu-trigger' } {
                    New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-menu' }
                }
                # Brand logo
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'brand-logo' } {
                    New-HTMLTag -Tag 'a' -Attributes @{ href = $LogoLink } {
                        New-HTMLTag -Tag 'img' -Attributes @{ src = $Logo; title = 'PSWriteHTML Logo'; alt = 'PSWriteHTML Logo' }
                    }
                }
                <#
                    # Search Trigger
                    New-HTMLTag -Tag 'div' -Attributes @{ class = 'search-trigger' } {
                        New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-search' }
                    }
                    # Search Box

                    New-HTMLTag -Tag 'div' -Attributes @{ class = 'search-box' } {
                        # Form to enter
                        New-HTMLTag -Tag 'form' -Attributes @{ action = '#' } {
                            New-HTMLTag -Tag 'input' -Attributes @{ type = 'text'; name = 'search' } -NoClosing
                            New-HTMLTag -Tag 'button' -Attributes @{ type = 'submit'; class = 'search-submit'; disabled = 'disabled' } {
                                'Search'
                            }
                        }
                    }
                    #>
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'grid-trigger toggle'; 'data-reveal' = '.grid-items' } {
                    New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-view-module' }
                }
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'hs-user toggle'; 'data-reveal' = '.user-info' } {
                    New-HTMLTag -Tag 'img' -Attributes @{ src = 'https://evotec.xyz/wp-content/uploads/2021/04/PrzemyslawKlysAndKulkozaurr.jpg'; alt = 'Evotec' } -NoClosing
                }
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'more-trigger toggle'; 'data-reveal' = '.user-penal' } {
                    New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-more-vert' }
                }
            }

            New-HTMLTag -Tag 'section' -Attributes @{ class = 'box-model' } {
                New-HTMLTag -Tag 'ul' -Attributes @{ class = 'user-penal' } {
                    $NavGridMenu
                }
                if ($NavGridItems) {
                    New-HTMLTag -Tag 'ul' -Attributes @{ class = 'grid-items' } {
                        $NavGridItems
                    }
                }
            }


            New-HTMLTag -Tag 'ul' -Attributes @{ class = 'nav-links' } {
                if ($NavLinks) {
                    $NavLinks
                }
            }


            New-HTMLTag -Tag 'script' {
                "`$(document).ready(function () {"
                "    `$('.hs-menubar').hsMenu($OptionsJSON);"
                "});"
            }
        }


    )
    [PSCustomObject] @{
        Type   = 'Navigation'
        Output = $Navigation
    }
}
Register-ArgumentCompleter -CommandName New-HTMLNavFloat -ParameterName TopBarBackGroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLNavFloat -ParameterName TopBarColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLNavFloat -ParameterName LeftMenuBackgroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLNavFloat -ParameterName LeftMenuColor -ScriptBlock $Script:ScriptBlockColors