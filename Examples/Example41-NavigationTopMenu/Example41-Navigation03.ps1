﻿Import-Module .\PSWriteHTML.psd1 -Force

$DataTable1 = @(
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.42 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.72 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.22 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 2.73 }
)

New-HTML {
    New-HTMLNavTop -Logo 'https://evotec.xyz/wp-content/uploads/2021/04/Logo-evotec-bb.png' -LogoLinkHome {
        New-NavTopMenu -Name 'Domains' -IconRegular address-book {
            New-NavLink -IconMaterial airplane -Name 'This is internal link 1' -InternalPageID 'Page 1'
            New-NavLink -IconSolid address-book -Href 'https://evotec.xyz' -Name 'This is link to evotec' -IconColor Pink -NameColor Red
            New-NavLink -Name 'This is link 3' -IconBrands apple-pay {
                New-NavLink -IconMaterial airplane -Href 'https://evotec.xyz' -Name 'This is link 5'
                New-NavLink -IconSolid address-book -Name 'This is link 6' {
                    New-NavLink -Name 'This is link 3' -IconBrands confluence {
                        New-NavLink -IconMaterial airplane -Href 'https://evotec.xyz' -Name 'This is link 5'
                        New-NavLink -IconSolid address-book -Href 'https://evotec.xyz' -Name 'This is link 6'
                    }
                }
            }
        }
        New-NavTopMenu -Name 'Domain Controllers' -IconSolid ambulance {
            New-NavLink -IconMaterial airplane -Name 'This is link 1' -InternalPageID 'Page 2'
            New-NavLink -IconSolid address-book -Href 'https://evotec.xyz' -Name 'This is link 2'
            New-NavLink -IconBrands codiepie -Href 'https://evotec.xyz' -Name 'This is link 3'
        }
        New-NavTopMenu -Name 'Office 365' {
            New-NavLink -IconMaterial airplane -Href 'https://evotec.xyz' -Name 'This is link 1'
            New-NavLink -IconSolid address-book -Href 'https://evotec.xyz' -Name 'This is link 2'
            New-NavLink -IconBrands codiepie -Href 'https://evotec.xyz' -Name 'This is link 4'
        }
    } #-MenuColor Black -MenuColorBackground Pink -HomeColorBackground Black -HomeColor Red

    New-HTMLText -Text "This is first page" -Color Red -FontSize 40px -Alignment center

    New-HTMLPage -Name 'Page 1' {
        New-HTMLSection -HeaderText 'Test 0' {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test2' -PagingLength 2
        }
        New-HTMLSection -HeaderText 'Test 1' {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test2' -PagingLength 2
        }
    }
    New-HTMLPage -Name 'Page 2' {
        New-HTMLSection -HeaderText 'Test2' {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test2' -PagingLength 2
        }
    }
} -ShowHTML -Online -FilePath $PSScriptRoot\Example41-Navigation03.html