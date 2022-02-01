Import-Module .\PSWriteHTML.psd1 -Force

$DataTable1 = @(
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.42 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.72 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.22 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 2.73 }
)

New-HTML {
    New-HTMLNavFloat -Title 'Advanced Navigation' -Tagline 'PSWriteHTML feature' -TitleColor AirForceBlue -TaglineColor Amethyst {
        New-NavFloatWidget -Type Dots {
            New-NavFloatWidgetItem -IconColor Green -IconSolid house-damage -Name 'Home' -LinkHome
            New-NavFloatWidgetItem -IconColor Green -IconSolid ambulance -Name 'Dots Menu Page 1' -InternalPageID 'Page1'
            New-NavFloatWidgetItem -IconColor Blue -IconSolid address-book -Name 'Dots Menu Page 2' -InternalPageID 'Page2'
        }
        New-NavFloatWidget -Type List -Title 'Options' {
            New-NavFloatWidgetItem -IconColor Green -IconSolid home -Name 'Home' -LinkHome
            New-NavFloatWidgetItem -IconColor Blue -IconSolid address-book -Name 'Go to Page 1' -InternalPageID 'Page1'
            New-NavFloatWidgetItem -IconColor Pink -IconSolid ad -Name 'Go to Page 2' -InternalPageID 'Page2'
        }
        New-NavFloatWidget -Type Text -Title 'Menu Information' {
            New-HTMLText -Text 'You can put a text here above all options, or at the bottom - the widgets can be moved and multiplied (except for dots)' -Color Grey
        }
        # Toggle switches are a bit useless for the use case of PSWriteHTML
        #New-NavFloatWidget -Type Toggle -Title 'Toggle' {
        #    New-NavFloatWidgetItem -IconColor Green -IconSolid address-book -Name 'Dots Menu 1' -InternalPageID 'Page1'
        #    New-NavFloatWidgetItem -IconColor Blue -IconSolid address-book -Name 'Dots Menu 2' -InternalPageID 'Page2'
        #}
        New-NavFloatWidget -Type List -Title 'Options' {
            New-NavFloatWidgetItem -IconColor Green -IconSolid home -Name 'Home' -LinkHome
            New-NavFloatWidgetItem -IconColor Blue -IconSolid address-book -Name 'Go to Page 1' -InternalPageID 'Page1'
            New-NavFloatWidgetItem -IconColor Pink -IconSolid ad -Name 'Go to Page 2' -InternalPageID 'Page2'
        }
        New-NavFloatWidget -Type Text -Title 'About' {
            New-HTMLText -Text 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
        }
    } -ButtonColor White -ButtonColorBackground Pink -ButtonLocationLeft 50% -ButtonLocationTop 10px -ButtonColorBackgroundOnHover Red -ButtonColorOnHover White
    New-HTMLLogo

    New-HTMLSection -HeaderText 'Test 0' {
        New-HTMLTable -DataTable $DataTable1 -Title 'Test2' -PagingLength 2
    }
    New-HTMLSection -HeaderText 'Test 1' {
        New-HTMLTable -DataTable $DataTable1 -Title 'Test2' -PagingLength 2
    }

    New-HTMLPage -Name 'Page1' {
        New-HTMLLogo
        New-HTMLSection -HeaderText 'Test 0' {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test2' -PagingLength 2
        }
        New-HTMLSection -HeaderText 'Test 1' {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test2' -PagingLength 2
        }
    }
    New-HTMLPage -Name 'Page2' {
        New-HTMLLogo
        New-HTMLSection -HeaderText 'Test2' {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test2' -PagingLength 2
        }
    }
} -ShowHTML -Online -FilePath $PSScriptRoot\Example41-NavigationFloat.html -AddComment