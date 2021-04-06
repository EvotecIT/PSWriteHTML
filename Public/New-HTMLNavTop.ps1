function New-HTMLNavTop {
    [cmdletBinding()]
    param(
        [ScriptBlock] $NavigationLinks,
        [string] $Logo,
        [string] $LogoLink,
        [switch] $LogoLinkHome
    )

    $Script:HTMLSchema.Features.NavigationMenuDropdown = $true
    $Script:HTMLSchema.Features.Animate = $true
    $Script:HTMLSchema.Features.JQuery = $true
    $Script:HTMLSchema.Features.FontsMaterialIcon = $true
    $Script:HTMLSchema.Features.FontsAwesome = $true

    # We also need to make sure we add this to all pages, not just the primary one
    $Script:GlobalSchema.Features.NavigationMenuDropdown = $true
    $Script:GlobalSchema.Features.Animate = $true
    $Script:GlobalSchema.Features.JQuery = $true
    $Script:GlobalSchema.Features.FontsMaterialIcon = $true
    $Script:GlobalSchema.Features.FontsAwesome = $true

    $Script:CurrentConfiguration['Features']['Main']['HeaderAlways']['CssInLine']['.main-section']['margin-top'] = '55px'

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

    }
    $OptionsJSON = $Options | ConvertTo-Json

    $Navigation = @(
        # Navigation
        New-HTMLTag -Tag 'nav' -Attributes @{ class = 'codehim-dropdown' } {
            New-HTMLTag -Tag 'ul' -Attributes @{ class = 'dropdown-items' } {
                New-HTMLTag -Tag 'li' -Attributes @{ class = 'home-link' } {
                    New-HTMLTag -Tag 'a' -Attributes @{ href = '#home_link' } {
                        New-HTMLFontIcon -IconSolid home
                    }
                }
                if ($TopMenu) {
                    $TopMenu
                }
            }
        }

        New-HTMLTag -Tag 'script' {
            "`$(document).ready(function () {"
            "    `$('.codehim-dropdown').CodehimDropdown($OptionsJSON);"
            "});"
        }
    )

    [PSCustomObject] @{
        Type   = 'Navigation'
        Output = $Navigation
    }

}