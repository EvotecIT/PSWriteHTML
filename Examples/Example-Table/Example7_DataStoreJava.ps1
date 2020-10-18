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

$DataTable1 = @(
    [PSCustomObject] @{ 'Test.1' = 'Name'; 'Test 2 Another' = 'Name2'; 'Test..3' = 'Name3'; "Da't'es" = $Date; 'Numbers' = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
    [PSCustomObject] @{ 'Test.1' = 'Name'; 'Test 2 Another' = 'Name2'; 'Test..3' = 'Name3'; "Da't'es" = $Date2; 'Numbers' = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
    [PSCustomObject] @{ 'Test.1' = 'Name'; 'Test 2 Another' = 'Name2'; 'Test..3' = 'Name3'; "Da't'es" = $Date3; 'Numbers' = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
    [PSCustomObject] @{ 'Test.1' = 'Name'; 'Test 2 Another' = 'Name2'; 'Test..3' = 'Name3'; "Da't'es" = $Date2; 'Numbers' = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
)

$DataTable2 = @(
    [PSCustomObject] @{ 'Test1' = 'Test' + [System.Environment]::NewLine + 'test3'; 'Test2' = 'Test' + [System.Environment]::NewLine + 'test3'; 'Test3' = 'Test' + [System.Environment]::NewLine + 'test3'; 'Test4' = 'Test' + [System.Environment]::NewLine + 'test3' }
    [PSCustomObject] @{ 'Test1' = 'Test' + [System.Environment]::NewLine + 'test3'; 'Test2' = 'Test' + [System.Environment]::NewLine + 'test3'; 'Test3' = 'Test' + [System.Environment]::NewLine + 'test3'; 'Test4' = 'Test' + [System.Environment]::NewLine + 'test3' }
    [PSCustomObject] @{ 'Test1' = 'Test' + [System.Environment]::NewLine + 'test3'; 'Test2' = 'Test' + [System.Environment]::NewLine + 'test3'; 'Test3' = 'Test' + [System.Environment]::NewLine + 'test3'; 'Test4' = 'Test' + [System.Environment]::NewLine + 'test3' }
)

$DataTable3 = @(

    [PSCustomObject] @{
        'Test1' = 'Test' + [System.Environment]::NewLine + 'test3';
        'Test2' = 'Test' + [System.Environment]::NewLine + 'test3' + "`n test"
    }
    [PSCustomObject] @{
        'Test1' = 'Test' + [System.Environment]::NewLine + 'test3';
        'Test2' = 'Test' + [System.Environment]::NewLine + 'test3' + "`n test"
    }
    [PSCustomObject] @{
        'Test1' = 'Test' + [System.Environment]::NewLine + 'test3';
        'Test2' = 'Test' + [System.Environment]::NewLine + 'test3' + "`r`n test"
    }
    [PSCustomObject] @{
        'Test1' = 'Test' + [System.Environment]::NewLine + 'test3';
        'Test2' = 'Test' + [System.Environment]::NewLine + 'test3' + "`r test"
    }
)

New-HTML {
    New-HTMLTableOption -DateTimeFormat "yyyy-MM-dd HH:mm:ss" -BoolAsString
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects' {
            New-HTMLTable -DataTable $DataTable1
        }
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects' {
            New-HTMLTable -DataTable $DataTable1 -DataStore JavaScript
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects' {
            New-HTMLTable -DataTable $DataTable2
        }
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects - DataStore JavaScript' {
            New-HTMLTable -DataTable $DataTable2 -DataStore JavaScript
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects' {
            New-HTMLTable -DataTable $DataTable3
        }
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects - DataStore JavaScript' {
            New-HTMLTable -DataTable $DataTable3 -DataStore JavaScript
        }
    }
} -ShowHTML -FilePath $PSScriptRoot\Example7_DataStoreJava.html -Online