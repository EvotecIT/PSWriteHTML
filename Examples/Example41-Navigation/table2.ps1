Import-Module .\PSWriteHTML.psd1 -Force

$DataTable1 = @(
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.42 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.72 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.22 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 2.73 }
)


New-HTML {
    New-HTMLNav {
        New-HTMLNavItem -Type Grid -Text 'Item one'
        New-HTMLNavItem -Type Grid -Text 'Item two'
        New-HTMLNavItem -Type Grid -Text 'Item three'
        New-HTMLNavItem -Type Grid -IconSolid address-card -IconColor Green
    }

    New-HTMLSection {
        New-HTMLTable -DataTable $DataTable1 -Title 'Test1' -PagingLength 2
    }
} -ShowHTML -Online -FilePath $PSScriptRoot\table2.html