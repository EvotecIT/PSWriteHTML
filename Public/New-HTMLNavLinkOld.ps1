function New-HTMLNavLinkOld {
    [cmdletBinding()]
    param(
        [scriptblock] $SubMenu,
        [string] $Name = 'Menu',
        [string] $Icon = 'fa-dashboard'
    )
    $Script:HTMLSchema.Features.MainFlex = $true
    if ($SubMenu) {
        $Attributes = @{ class = 'menu-hasdropdown' }
    } else {
        $Attributes = @{}
    }
    $ID = "$(Get-RandomStringName -Size 8 -LettersOnly)"
    New-HTMLTag -Tag 'li' -Attributes $Attributes {
        New-HTMLTag -Tag 'a' -Attributes @{ href = '#' } { $Name }
        New-HTMLTag -Tag 'span' -Attributes @{ class = 'icon' } {
            New-HTMLTag -Tag 'i' -Attributes @{ class = "fa $Icon" } {
            }
        }
        if ($SubMenu) {
            New-HTMLTag -Tag 'label' -Attributes @{ title = 'toggle menu'; for = $ID } {
                New-HTMLTag -Tag 'span' -Attributes @{ class = 'downarrow' } {
                    New-HTMLTag -Tag 'i' -Attributes @{ class = 'fa fa-caret-down' }
                }
            }
            New-HTMLTag -Tag 'input' -Attributes @{ type = 'checkbox'; class = 'sub-menu-checkbox'; id = $ID } -SelfClosing
            New-HTMLTag -Tag 'ul' -Attributes @{ class = "sub-menu-dropdown" } {
                & $SubMenu
            }

        }
    }
}