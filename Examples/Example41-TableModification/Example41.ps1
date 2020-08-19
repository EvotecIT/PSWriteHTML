Import-Module -Name "$PSScriptRoot\..\..\PSWriteHTML.psd1" -Force

$Values = @(
    [PSCustomObject] @{
        Test1 = 1
        Test2 = 2
        Test3 = 3
        Test4 = 1
    }
    [PSCustomObject] @{
        Test1 = 1
        Test2 = 2
        Test3 = 3
        Test4 = 1
    }
    [PSCustomObject] @{
        Test1 = 1
        Test2 = 2
        Test3 = 3
        Test4 = 2
    }
    [PSCustomObject] @{
        Test1 = 1
        Test2 = 2
        Test3 = 3
        Test4 = 1
    }
)

New-HTML -TitleText "Example41 - Table" -FilePath "$PSScriptRoot\Example41.html" {
    New-HTMLSection -HeaderText "Testing" -HeaderTextAlignment center -Content {
        New-HTMLTable -DataTable $Values {
            for ($i = 0; $i -le $Values.Count; $i++) {
                if ($Values[$i].Test1 -ne $Values[$i].Test4) {
                    New-TableContent -BackGroundColor Red -ColumnName 'Test4' -RowIndex $i
                }
            }
        }
    }
} -Online -ShowHTML
