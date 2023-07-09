Import-Module .\PSWriteHTML.psd1 -Force

$DataTable = @(
    [PSCustomObject] @{ 'Test.1' = 'Name'; 'Test 2 Another' = 'Name2'; 'Test..3' = 'Name3'; "Da't'es" = $Date; 'Numbers' = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
    [PSCustomObject] @{ 'Test.1' = 'Name'; 'Test 2 Another' = 'Name2'; 'Test..3' = 'Name3'; "Da't'es" = $Date2; 'Numbers' = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
    [PSCustomObject] @{ 'Test.1' = 'Przemysłąw'; 'Test 2 Another' = 'Name2'; 'Test..3' = 'Name3'; "Da't'es" = $Date3; 'Numbers' = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
    [PSCustomObject] @{ 'Test.1' = 'Kłys'; 'Test 2 Another' = 'Name2'; 'Test..3' = 'Name3'; "Da't'es" = $Date2; 'Numbers' = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
)

$DataTable = Get-Process | Select-Object -First 5

New-HTML -TitleText 'Title' -Online -FilePath $PSScriptRoot\Example-TableColumnVisibility.html -ShowHTML {
    New-HTMLTable -DataTable $DataTable -Filtering -Buttons columnVisibility, csvHtml5, excelHtml5, pageLength, searchBuilder

    New-HTMLTable -DataTable $DataTable -Filtering -Buttons columnVisibility, csvHtml5, excelHtml5, pageLength, searchBuilder {
        New-TableButtonCSV -Title 'My title' -ButtonName 'Export CSV' -FileName 'MyFile.csv' -DisableBOM -FieldBoundary "'"
        New-TableButtonColumnVisibility -ButtonName 'Choose Columns' -CollectionLayout two-column -CollectionPosition dropdown
    }
}