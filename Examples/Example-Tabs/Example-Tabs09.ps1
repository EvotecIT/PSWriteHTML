Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force

$DataTable = Get-Process | Select-Object -First 1

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example-Tabs10.html -Show {
    New-HTMLTabStyle -RowElements 4
    New-HTMLTab -Name 'Tab 1' -IconBrands acquisitions-incorporated {
        New-HTMLTab -Name '2nd Level Tab - Test 4/1' -IconBrands app-store {
            #New-HTMLTable -DataTable $DataTable
        }
        New-HTMLTab -Name '2nd Level Tab - Test 4/2' -IconBrands app-store {
            #New-HTMLTable -DataTable $DataTable
        }
        New-HTMLTab -Name '2nd Level Tab - Test 4/3' -IconBrands app-store {
            #New-HTMLTable -DataTable $DataTable
        }
        New-HTMLTab -Name '2nd Level Tab - Test 4/4' -IconBrands app-store {
            #New-HTMLTable -DataTable $DataTable
        }
    }
    New-HTMLTab -Name 'Tab2' {
        New-HTMLTab -Name '2nd Level Tab - Test 5/1' -IconBrands app-store {
            #New-HTMLTable -DataTable $DataTable
        }
        New-HTMLTab -Name '2nd Level Tab - Test 5/2' -IconBrands app-store {
            #New-HTMLTable -DataTable $DataTable
        }
        New-HTMLTab -Name '2nd Level Tab - Test 5/3' -IconBrands app-store {
            #New-HTMLTable -DataTable $DataTable
        }
        New-HTMLTab -Name '2nd Level Tab - Test 5/4' -IconBrands app-store {
            #New-HTMLTable -DataTable $DataTable
        }
    }
    New-HTMLTab -Name 'Tab3' {
        New-HTMLTable -DataTable $DataTable
    }
    New-HTMLTab -Name 'Tab4' {
        New-HTMLTable -DataTable $DataTable
    }
    New-HTMLTab -Name 'Tab5' {
        New-HTMLTable -DataTable $DataTable
    }
    New-HTMLTab -Name 'Tab6' {
        New-HTMLTable -DataTable $DataTable
    }
    New-HTMLTab -Name 'Tab7' {
        New-HTMLTable -DataTable $DataTable
    }
    New-HTMLTab -Name 'Tab8' {
        New-HTMLTable -DataTable $DataTable
    }
    New-HTMLTab -Name 'Tab9' {
        New-HTMLTable -DataTable $DataTable
    }
    New-HTMLTab -Name 'Tab10' {
        New-HTMLTable -DataTable $DataTable
    }
}