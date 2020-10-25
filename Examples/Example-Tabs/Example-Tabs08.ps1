Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example-Tabs08.html -Show {
    New-HTMLTabStyle -RowElements 4
    New-HTMLTab -Name 'Tab 1' -IconBrands acquisitions-incorporated {
        New-HTMLTab -Name '2nd Level Tab - Test 4/1' -IconBrands app-store {
            New-HTMLTable -DataTable 'string'
        }
        New-HTMLTab -Name '2nd Level Tab - Test 4/2' -IconBrands app-store {
            New-HTMLTable -DataTable 'string'
        }
        New-HTMLTab -Name '2nd Level Tab - Test 4/3' -IconBrands app-store {
            New-HTMLTable -DataTable 'string'
        }
        New-HTMLTab -Name '2nd Level Tab - Test 4/4' -IconBrands app-store {
            New-HTMLTable -DataTable 'string'
        }
    }
    New-HTMLTab -Name 'Tab2' {
        New-HTMLTable -DataTable 'string'
    }
    New-HTMLTab -Name 'Tab3' {
        New-HTMLTable -DataTable 'string'
    }
    New-HTMLTab -Name 'Tab4' {
        New-HTMLTable -DataTable 'string'
    }
    New-HTMLTab -Name 'Tab5' {
        New-HTMLTable -DataTable 'string'
    }
    New-HTMLTab -Name 'Tab6' {
        New-HTMLTable -DataTable 'string'
    }
    New-HTMLTab -Name 'Tab7' {
        New-HTMLTable -DataTable 'string'
    }
    New-HTMLTab -Name 'Tab8' {
        New-HTMLTable -DataTable 'string'
    }
    New-HTMLTab -Name 'Tab9' {
        New-HTMLTable -DataTable 'string'
    }
    New-HTMLTab -Name 'Tab10' {
        New-HTMLTable -DataTable 'string'
    }
}