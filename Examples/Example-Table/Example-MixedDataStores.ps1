Import-Module .\PSWriteHTML.psd1 -Force

Enum Fruit {
    Apple = 29
    Pear = 30
    Kiwi = 31
}

$Date = Get-Date
$Date2 = (Get-Date).AddDays(2)
$Date3 = (Get-Date).AddMonths(1)
$Int = 5001
$Enum = [System.Drawing.Color]::AntiqueWhite
$EnumFruit = [Fruit]::Kiwi

# Testing weird column names that require escaping when using JavaScript
$DataTable = @(
    [PSCustomObject] @{ 'Test.1' = 'Name'; 'Test 2 Another' = 'Name2'; 'Test..3' = 'Name3'; "Da't'es" = $Date; 'Numbers' = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
    [PSCustomObject] @{ 'Test.1' = 'Name'; 'Test 2 Another' = 'Name2'; 'Test..3' = 'Name3'; "Da't'es" = $Date2; 'Numbers' = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
    [PSCustomObject] @{ 'Test.1' = 'Name'; 'Test 2 Another' = 'Name2'; 'Test..3' = 'Name3'; "Da't'es" = $Date3; 'Numbers' = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
    [PSCustomObject] @{ 'Test.1' = 'Name'; 'Test 2 Another' = 'Name2'; 'Test..3' = 'Name3'; "Da't'es" = $Date2; 'Numbers' = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
)

New-HTML {
    #New-HTMLTableOption -DateTimeFormat "yyyy-MM-dd HH:mm:ss" -BoolAsString -DataStore JavaScript
    New-HTMLTable -DataTable $DataTable -DataStore HTML
    New-HTMLTable -DataTable $DataTable -DataStore JavaScript
} -ShowHTML -Online -FilePath $PSScriptRoot\Example-MixedDataStores.html