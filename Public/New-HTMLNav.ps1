function New-HTMLNav {
    [cmdletBinding()]
    param(
        [ScriptBlock] $NavigationLinks
    )
    $Script:HTMLSchema.Features.Navigation = $true

    New-HTMLTag -Tag 'div' -Attributes @{ class = 'primary-nav' } {
        New-HTMLTag -Tag 'button' -Attributes @{ href = '#'; class = 'hamburger open-panel nav-toggle' } {
            New-HTMLTag -Tag 'span' -Attributes @{ class = 'screen-reader-text' } { 'Menu' }
        }
        New-HTMLTag -Tag 'nav' -Attributes @{ role = 'navigation'; class = 'menu' } {
            New-HTMLTag -Tag 'a' -Attributes @{ href = '#'; class = 'logotype' } {
                New-HTMLText -Text 'LOGO TYPE'
            }
            New-HTMLTag -Tag 'div' -Attributes @{ class = 'overflow-container' } {
                New-HTMLTag -Tag 'ul' -Attributes @{ class = 'menu-dropdown' } {
                    if ($NavigationLinks) {
                        & $NavigationLinks
                    }
                }
            }
        }
    }
}