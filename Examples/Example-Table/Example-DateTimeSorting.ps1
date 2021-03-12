# This shows how AllProperties switch behaves for different types
Import-Module .\PSWriteHTML.psd1 -Force

$DataTable1 = @(
    [PscustomObject] @{ DateTest = '2027-09-12'; DateUS = '3/31/2020'; Dates = (Get-Date).AddDays(2); BoolAsString = 'true'; BoolTest = $true; Test = 'ABC'; Test2 = 'Name1'; Test3 = 'Name3'; 'Test4' = 1 }
    [PscustomObject] @{ DateTest = '2021-01-12'; DateUS = '3/23/2020'; Dates = (Get-Date).AddDays(0); BoolAsString = 'false'; BoolTest = $false; Test = 'Opps'; Test2 = 'Name2'; Test3 = 'Name2'; 'Test4' = 2 }
    [PscustomObject] @{ DateTest = '1982-08-15'; DateUS = '3/5/2020'; Dates = (Get-Date).AddDays(-7); BoolAsString = 'false'; BoolTest = $null; Test = 'Oh No'; Test2 = 'Name3'; Test3 = 'KitKat'; 'Test4' = 3 }
    [PscustomObject] @{ DateTest = '2021-03-12'; DateUS = '4/5/2020'; Dates = (Get-Date).AddDays(13); BoolAsString = 'null'; BoolTest = $true; Test = 'Name'; Test2 = 'Name4'; Test3 = 'Name3'; 'Test4' = 0 }
    [PscustomObject] @{ DateTest = '2021-03-12'; DateUS = '3/15/2020'; Dates = (Get-Date).AddDays(5); BoolAsString = 'true'; BoolTest = $false; Test = 'Name'; Test2 = 'Name5'; Test3 = 'Name4'; 'Test4' = $null }
    [PscustomObject] @{ DateTest = '2025-01-17'; DateUS = '3/5/2020'; Dates = (Get-Date).AddDays(0); BoolAsString = 'True'; BoolTest = $false; Test = 'Name'; Test2 = 'Name2'; Test3 = 'KitKat'; 'Test4' = 10 }
    [PscustomObject] @{ DateTest = '2021-03-12'; DateUS = '7/5/2020'; Dates = (Get-Date).AddDays(21); BoolAsString = 'true'; BoolTest = $true; Test = 'Name'; Test2 = 'Name2'; Test3 = 'Bounty'; 'Test4' = 5 }
    [PscustomObject] @{ DateTest = '2021-12-12'; DateUS = '12/5/2021'; Dates = (Get-Date).AddDays(5); BoolAsString = 'True'; BoolTest = $true; Test = 'Name'; Test2 = 'Name2'; Test3 = 'Test'; 'Test4' = 0 }
)

New-HTML {
    New-HTMLTableOption -DataStore HTML -ArrayJoin -BoolAsString
    New-HTMLTable -DataTable $DataTable1 -DateTimeSortingFormat 'DD.MM.YYYY HH:mm:ss', 'M/D/YYYY', 'YYYY-MM-DD'
} -ShowHTML -FilePath $PSScriptRoot\Example-DateTimeSorting.html -Online
