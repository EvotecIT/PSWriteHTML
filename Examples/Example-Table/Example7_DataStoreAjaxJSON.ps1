# This shows how AllProperties switch behaves for different types

Import-Module .\PSWriteHTML.psd1 -Force

$DataTable1 = @(
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
)

$DataTable2 = @(
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test4 = 'Name4' }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test5 = 'Name5' }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test6 = 'Name6' }
)

$DataTable3 = @(
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test4 = 'Name3' }
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test5 = 'Name3' }
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test6 = 'Name3' }
)
$DataTable4 = [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }

$DataTable5 = 'test'

$DataTable6 = 'test', 'test2'

$DataTable7 = 555

$DataTable8 = 555, 555

$DataTable9 = [PSCustomObject] @{
    'ColumnName' = '123'
}

New-HTML {
    New-HTMLText -Color Red -Text 'AJAX JSON DATA STORAGE only works Server Side. You need to host it to be able to see the content' -Alignment center -FontSize 20 -TextDecoration underline
    New-HTMLTableOption -DataStore AjaxJSON
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects' {
            New-HTMLTable -DataTable $DataTable1 -DataTableID 'ID1'
        }
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects - All Properties' {
            New-HTMLTable -DataTable $DataTable1 -AllProperties -DataTableID 'ID2'
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects' {
            New-HTMLTable -DataTable $DataTable2 -DataTableID 'ID3'
        }
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects - All Properties' {
            New-HTMLTable -DataTable $DataTable2 -AllProperties -DataTableID 'ID4'
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with OrderedDictionary objects' {
            New-HTMLTable -DataTable $DataTable3 -DataTableID 'ID5'
        }
        New-HTMLSection -HeaderText 'Standard Table with OrderedDictionary objects - All properties' {
            New-HTMLTable -DataTable $DataTable3 -AllProperties -DataTableID 'ID6'
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with OrderedDictionary' {
            New-HTMLTable -DataTable $DataTable4 -DataTableID 'ID7'
        }
        New-HTMLSection -HeaderText 'Standard Table with OrderedDictionary - All properties' {
            New-HTMLTable -DataTable $DataTable4 -AllProperties -DataTableID 'ID8'
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with single string' {
            New-HTMLTable -DataTable $DataTable5 -DataTableID 'ID9'
        }
        New-HTMLSection -HeaderText 'Standard Table with single string - All properties' {
            New-HTMLTable -DataTable $DataTable5 -AllProperties -DataTableID 'ID10'
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with multiple strings' {
            New-HTMLTable -DataTable $DataTable6 -DataTableID 'ID11'
        }
        New-HTMLSection -HeaderText 'Standard Table with multiple strings - All properties' {
            New-HTMLTable -DataTable $DataTable6 -AllProperties -DataTableID 'ID12'
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with single int' {
            New-HTMLTable -DataTable $DataTable7 -DataTableID 'ID13'
        }
        New-HTMLSection -HeaderText 'Standard Table with single int - All properties' {
            New-HTMLTable -DataTable $DataTable7 -AllProperties -DataTableID 'ID14'
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with multiple int' {
            New-HTMLTable -DataTable $DataTable8 -DataTableID 'ID15'
        }
        New-HTMLSection -HeaderText 'Standard Table with multiple int - All properties' {
            New-HTMLTable -DataTable $DataTable8 -AllProperties -DataTableID 'ID16'
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObject' {
            New-HTMLTable -DataTable $DataTable9 -DataTableID 'ID17'
        }
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObject - All properties' {
            New-HTMLTable -DataTable $DataTable9 -AllProperties -DataTableID 'ID18'
        }
    }
} -ShowHTML -FilePath $PSScriptRoot\Example7_DataStoreAjaxJSON.html -Online