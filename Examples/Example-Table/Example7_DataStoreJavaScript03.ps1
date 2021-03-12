# This shows how AllProperties switch behaves for different types
Import-Module .\PSWriteHTML.psd1 -Force

$DataTable1 = @(
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; 'Test4' = 'MyTest _ ok, me bad ' }
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; 'Test4' = 'MyTest _ ok, me bad & ' }
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; 'Test4' = 'MyTest _ ok, me bad ' }
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; 'Test4' = 'MyTest _ ok, me bad ' }
)
$DataTable2 = @(
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; 'Test $_ 4' = 'MyTest $ _ ok, me bad ' }
    #[PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; 'Test $_ 4' = 'MyTest _ ok, me bad & ' }
    #[PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; 'Test $_ 4' = 'MyTest _ ok, me bad ' }
    #[PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; 'Test $_ 4' = 'MyTest _ ok, me bad ' }
)

New-HTML {
    New-HTMLTableOption -DataStore JavaScript

    # This is a bit special - when you use DataStoreID it uses single store in footer. However you need to make sure saved data is consistent between tables
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects' {
            New-HTMLTable -DataTable $DataTable1
        }
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects' {
            New-HTMLTable -DataTable $DataTable2
        }
    }
} -ShowHTML -FilePath $PSScriptRoot\Example7_DataStoreJavaScript03.html -Online