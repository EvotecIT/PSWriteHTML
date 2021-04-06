Import-Module .\PSWriteHTML.psd1 -Force

$DataTable1 = @(
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.42 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.72 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.22 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 2.73 }
)

New-HTML {
    New-HTMLNavTop -Logo 'https://evotec.xyz/wp-content/uploads/2021/04/Logo-evotec-bb.png' {
        New-NavTopMenu -Name 'Domains' -IconRegular address-book -IconColor Green {
            New-NavLink -IconMaterial airplane -Href 'https://evotec.xyz' -Name 'This is link 1'
            New-NavLink -IconSolid address-book -Href 'https://evotec.xyz' -Name 'This is link 2'
            New-NavLink -Href 'https://evotec.xyz' -Name 'This is link 3' -IconBrands apple-pay {
                New-NavLink -IconMaterial airplane -Href 'https://evotec.xyz' -Name 'This is link 5'
                New-NavLink -IconSolid address-book -Href 'https://evotec.xyz' -Name 'This is link 6' {
                    New-NavLink -Href 'https://evotec.xyz' -Name 'This is link 3' -IconBrands confluence {
                        New-NavLink -IconMaterial airplane -Href 'https://evotec.xyz' -Name 'This is link 5'
                        New-NavLink -IconSolid address-book -Href 'https://evotec.xyz' -Name 'This is link 6'
                    }
                }
            }
        }
        New-NavTopMenu -Name 'Domain Controllers' -IconSolid ambulance {
            New-NavLink -IconMaterial airplane -Href 'https://evotec.xyz' -Name 'This is link 1'
            New-NavLink -IconSolid address-book -Href 'https://evotec.xyz' -Name 'This is link 2'
            New-NavLink -IconBrands codiepie -Href 'https://evotec.xyz' -Name 'This is link 3'
        }
        New-NavTopMenu -Name 'Office 365' {
            New-NavLink -IconMaterial airplane -Href 'https://evotec.xyz' -Name 'This is link 1'
            New-NavLink -IconSolid address-book -Href 'https://evotec.xyz' -Name 'This is link 2'
            New-NavLink -IconBrands codiepie -Href 'https://evotec.xyz' -Name 'This is link 4'
        }
    }
    New-HTMLPage -Name 'Page1' {
        New-HTMLSection -HeaderText 'Test 0' {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test2' -PagingLength 2
        }
        New-HTMLSection -HeaderText 'Test 1' {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test2' -PagingLength 2
        }
    }
    New-HTMLPage -Name 'Page2' {
        New-HTMLSection -HeaderText 'Test2' {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test2' -PagingLength 2
        }
    }
} -ShowHTML -Online -FilePath $PSScriptRoot\Example41-Navigation03.html