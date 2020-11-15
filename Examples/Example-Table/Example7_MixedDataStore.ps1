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
$DataTable1 = @(
    [PSCustomObject] @{ 'Test.1' = 'Name'; 'Test 2 Another' = 'Name2'; 'Test..3' = 'Name3'; "Da't'es" = $Date; 'Numbers' = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
    [PSCustomObject] @{ 'Test.1' = 'Name'; 'Test 2 Another' = 'Name2'; 'Test..3' = 'Name3'; "Da't'es" = $Date2; 'Numbers' = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
    [PSCustomObject] @{ 'Test.1' = 'Name'; 'Test 2 Another' = 'Name2'; 'Test..3' = 'Name3'; "Da't'es" = $Date3; 'Numbers' = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
    [PSCustomObject] @{ 'Test.1' = 'Name'; 'Test 2 Another' = 'Name2'; 'Test..3' = 'Name3'; "Da't'es" = $Date2; 'Numbers' = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
)

$DataTable2 = @(
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Dates = $Date; Numbers = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name4'; Dates = $Date; Numbers = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name5'; Dates = $Date; Numbers = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name6'; Dates = $Date; Numbers = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
)

$DataTable3 = @(
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Dates = $Date; Numbers = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Dates = $Date; Numbers = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Dates = $Date; Numbers = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Dates = $Date; Numbers = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }
)
$DataTable4 = [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Dates = $Date; Numbers = $Int; Enum = $Enum; EnumFruit = $EnumFruit; Bool = $false }

$DataTable5 = 'test'

$DataTable6 = 'test', 'test2'

$DataTable7 = 555

$DataTable8 = 555, 555

$DataTable9 = [PSCustomObject] @{
    'ColumnName' = '123'
}

New-HTML {
    New-HTMLTableOption -DateTimeFormat "yyyy-MM-dd HH:mm:ss" -BoolAsString -DataStore JavaScript
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
        New-HTMLSection -HeaderText 'Standard Table with OrderedDictionary objects' {
            New-HTMLTable -DataTable $DataTable3
        }
        New-HTMLSection -HeaderText 'Standard Table with OrderedDictionary objects - DataStore JavaScript' {
            New-HTMLTable -DataTable $DataTable3 -DataStore JavaScript
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with OrderedDictionary' {
            New-HTMLTable -DataTable $DataTable4
        }
        New-HTMLSection -HeaderText 'Standard Table with OrderedDictionary - DataStore JavaScript' {
            New-HTMLTable -DataTable $DataTable4 -DataStore JavaScript
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with single string' {
            New-HTMLTable -DataTable $DataTable5
        }
        New-HTMLSection -HeaderText 'Standard Table with single string - DataStore JavaScript' {
            New-HTMLTable -DataTable $DataTable5 -DataStore JavaScript
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with multiple strings' {
            New-HTMLTable -DataTable $DataTable6
        }
        New-HTMLSection -HeaderText 'Standard Table with multiple strings - DataStore JavaScript' {
            New-HTMLTable -DataTable $DataTable6 -DataStore JavaScript
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with single int' {
            New-HTMLTable -DataTable $DataTable7
        }
        New-HTMLSection -HeaderText 'Standard Table with single int - DataStore JavaScript' {
            New-HTMLTable -DataTable $DataTable7 -DataStore JavaScript
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with multiple int' {
            New-HTMLTable -DataTable $DataTable8
        }
        New-HTMLSection -HeaderText 'Standard Table with multiple int - DataStore JavaScript' {
            New-HTMLTable -DataTable $DataTable8 -DataStore JavaScript
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObject' {
            New-HTMLTable -DataTable $DataTable9
        }
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObject - DataStore JavaScript' {
            New-HTMLTable -DataTable $DataTable9 -DataStore JavaScript
        }
    }
} -ShowHTML -FilePath $PSScriptRoot\Example7_MixedDataStore.html -Online