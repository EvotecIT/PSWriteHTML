Import-Module .\PSWriteHTML.psd1 -Force

$DataTable1 = @(
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.42 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.72 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.22 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 2.73 }
)


New-HTML {
    New-HTMLNav -Logo 'https://evotec.pl/wp-content/uploads/2015/05/Logo-evotec-012.png' {
        New-HTMLNavItem -Type Grid -Text 'Item one' -Href 'https://evotec.xyz'
        New-HTMLNavItem -Type Grid -Text 'Item two'
        New-HTMLNavItem -Type Grid -Text 'Item three'
        New-HTMLNavItem -Type Grid -IconSolid address-card -IconColor Green -Text 'test' -Href 'https://evotec.xyz'

        New-HTMLNavItem -Type Menu -IconSolid address-card -IconColor Green -Text 'test' -Href 'https://evotec.xyz'
        New-HTMLNavItem -Type Menu -IconSolid address-card -IconColor Green -Text 'test 1'
        New-HTMLNavItem -Type Menu -IconSolid address-card -IconColor Green -Text 'test 2 '
        New-HTMLNavItem -Type Menu -IconSolid address-card -IconColor Green -Text 'test 3'
        New-HTMLNavItem -Type Menu -IconMaterial star -IconColor Green -Text 'Star'
        New-HTMLNavItem -Type Menu -IconMaterial inbox -IconColor Green -Text 'Inbox'
        New-HTMLNavItem -Type Menu -IconMaterial delete -IconColor Green -Text 'Delete'
        New-HTMLNavItem -Type Menu -IconMaterial run -IconColor Green -Text 'Run'

        New-HTMLNavLink -IconMaterial airplane -Href 'https://evotec.xyz' -Name 'This is link Icon Material'
        New-HTMLNavLink -IconBrands acquisitions-incorporated -Name 'This is link with FA' {
            New-HTMLNavLink -Name 'This is link with 1'
            New-HTMLNavLink -IconBrands acquisitions-incorporated -Name 'This is link with 2' {
                New-HTMLNavLink -IconBrands acquisitions-incorporated -Name 'This is link with 3.1'
                New-HTMLNavLink -IconBrands acquisitions-incorporated -Name 'This is link with 3.2'
                New-HTMLNavLink -IconBrands acquisitions-incorporated -Name 'This is link with 3.3'
                New-HTMLNavLink -IconBrands acquisitions-incorporated -Name 'This is link with 3.4' -Href 'https://evotec.xyz'
            }
            New-HTMLNavLink -IconBrands acquisitions-incorporated -Name 'This is link with 3'
            New-HTMLNavLink -IconBrands acquisitions-incorporated -Name 'This is link with 4' -Href '/test'
        }
        New-HTMLNavLink -IconBrands app-store -Name 'One Level' -IconColor Blue {
            New-HTMLNavLink -Name 'One Level 1' -Href '#1'
            New-HTMLNavLink -Name 'One Level 2' -Href '#2'
        }
    }
    New-HTMLPage -Name 'Page1' {
        New-HTMLSection {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test2' -PagingLength 2
        }
    }
    New-HTMLPage -Name 'Page2' {
        New-HTMLSection {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test2' -PagingLength 2
        }
    }
} -ShowHTML -Online -FilePath $PSScriptRoot\Example41-Navigation01.html