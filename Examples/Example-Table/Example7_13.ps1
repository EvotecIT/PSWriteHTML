Import-Module .\PSWriteHTML.psd1 -Force

$DataTable1 = @(
    [PSCustomObject] @{
        Test = 'Name';
        Test2 = 'Name2';
        Test3 = 'Name3'
        Test41 = 'Name3'
        Test42 = 'Name3'
        Test43 = 'Name3'
        Test44 = 'Name3'
        Test45 = 'Name3'
        Test46 = 'Name3'
        Test48 = 'Name3'
        Test47 = 'Name3'
        Test49 = 'Name3'
        Test455 = 'Name3'
        Test412 = 'Name3'
        Test413 = 'Name3'
        Test414 = 'Name3'
    }
)
New-HTML {
    New-HTMLTable -Title 'Test' -DataStore JavaScript {
        #New-TableColumnOption -ColumnIndex 1 -Width 900
    } -ScrollX -DataTable $DataTable1
} -ShowHTML -FilePath $PSScriptRoot\Example7_08_OutHTMlView.html -Online