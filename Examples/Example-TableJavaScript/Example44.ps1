Import-Module .\PSWriteHTML.psd1 -Force

$Table1 = Get-Process | Select-Object -First 5
$Table2 = Get-Process | Select-Object -First 5
<#
$Table1 = @(
    Get-Process
    Get-Process
    Get-Process
    Get-Process
    Get-Process
    Get-Process
    Get-Process
)
$Table2 = @(
    Get-Process
    Get-Process
    Get-Process
    Get-Process
    Get-Process
    Get-Process
    Get-Process
)
#>
$Table3 = [ordered] @{
    Special = 'This is a test'
    Test    = 'This a test 2'
}

New-HTML -TitleText "Server Based Solution" -FilePath "$PSScriptRoot\Example44.html" {
    New-HTMLTableOption -DataStore JavaScript
    New-HTMLSectionStyle -BorderRadius 0px -RemoveShadow -HeaderBackGroundColor Grey
    New-HTMLTabStyle -BorderRadius 0px -BackgroundColorActive Grey

    New-HTMLTab -Name 'Tab 1' -IconBrands amazon {
        New-HTMLTable -DataTableID 'TableContent0' -DataTable $Table3 {
            New-TableHeader -Color Red -Title 'This shows Ordered Dictionary'
        }

        New-HTMLSection -HeaderText "Server Based Solution - Table 1" -Content {
            New-HTMLTable -DataTable $Table1 -Filtering {
                New-TableHeader -Color Red -Title 'This shows standard table'
            } -DataTableID 'TableContent1'
        }

        New-HTMLSection -HeaderText "Server Based Solution - Table 2" -Content {
            New-HTMLTable -DataTable $Table2 -Filtering {

            } -DataTableID 'TableContent2' -PagingOptions @(5, 10, 15)
        }

    }
    New-HTMLTab -Name 'Tab 2' -IconBrands ubuntu {
        New-HTMLSection -HeaderText "Server Based Solution - Table 3" -Content {
            New-HTMLTable -DataTable $Table1 -Filtering {

            } -DataTableID 'TableContent3'
        }
        New-HTMLSection -HeaderText "Server Based Solution - Table 4" -Content {
            New-HTMLTable -DataTable $Table2 -Filtering {

            } -DataTableID 'TableContent4' -PagingOptions @(5, 10, 15)
        }
    }
    New-HTMLTab -Name 'Tab 3' -IconBrands app-store {
        New-HTMLSection -HeaderText "Server Based Solution - Table 5" -Content {
            New-HTMLTable -DataTable $Table1 -Filtering {

            } -DataTableID 'TableContent5'
        }
        New-HTMLSection -HeaderText "Server Based Solution - Table 6" -Content {
            New-HTMLTable -DataTable $Table2 -Filtering {

            } -DataTableID 'TableContent6' -PagingOptions @(5, 10, 15)
        }
    }
    New-HTMLTab -Name 'Tab 4' -IconBrands airbnb {
        New-HTMLSection -HeaderText "Server Based Solution - Table 7" -Content {
            New-HTMLTable -DataTable $Table1 -Filtering {

            } -DataTableID 'TableContent7'
        }
        New-HTMLSection -HeaderText "Server Based Solution - Table 8" -Content {
            New-HTMLTable -DataTable $Table2 -Filtering {

            } -DataTableID 'TableContent8' -PagingOptions @(5, 10, 15)
        }
    }
} -Online #-ShowHTML