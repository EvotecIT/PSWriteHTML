function New-HTMLNavTop {
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
            $LogoLink = "$($Script:GlobalSchema.StorageInformation.FileName).html"
        }
        if ($HomeLinkHome) {
            $HomeHref = "$($Script:GlobalSchema.StorageInformation.FileName).html"
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