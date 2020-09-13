# This shows how AllProperties switch behaves for different types
Import-Module .\PSWriteHTML.psd1 -Force

$DataTable1 = @(
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test7 = 'Name3' }
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test5 = 'Name3' }
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test4 = 'Name3' }
)

New-HTML {
    New-HTMLTableOption -DataStore JavaScript

    # This is a bit special - when you use DataStoreID it uses single store in footer. However you need to make sure saved data is consistent between tables
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects' {
            New-HTMLTable -DataTable $DataTable1 -AllProperties -DataStoreID 'TableID1'
        }
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects - All Properties' {
            New-HTMLTable -DataTable $DataTable1 -AllProperties -DataStoreID 'TableID1'
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects' {
            New-HTMLTable -DataTable $DataTable1 -AllProperties -DataStoreID 'TableID2'
        }
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects - All Properties' {
            New-HTMLTable -DataTable $DataTable1 -DataStoreID 'TableID2'
        }
    }
    # This wouldn't work because first table doesn't save all columns, but only saves partial data, so if you request New-HTMLTable -AllProperties in 2nd table
    # It doesn't have all the required data (as it's already using content that we added earlier)
    # Don't do that - unless in future I will find a way around it - it's not to be touched :-)
    <#
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects' {
            New-HTMLTable -DataTable $DataTable1 -DataStoreID 'TableID3'
        }
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects - All Properties' {
            New-HTMLTable -DataTable $DataTable1 -AllProperties -DataStoreID 'TableID3'
        }
    }
    #>
} -ShowHTML -FilePath $PSScriptRoot\Example7_DataStoreJavaScript02.html -Online