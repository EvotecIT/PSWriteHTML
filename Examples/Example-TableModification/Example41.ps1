Import-Module -Name "$PSScriptRoot\..\..\PSWriteHTML.psd1" -Force

$Values1 = @(
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
)

New-HTML -TitleText "Example41 - Table" -FilePath "$PSScriptRoot\Example41.html" {
    New-HTMLSection -HeaderText "Testing" -HeaderTextAlignment center -Content {
        New-HTMLTable -DataTable $Values {
            New-TableLanguage -Search 'Find' -PaginateFirst 'piwer' -EmptyTable 'testing'
            <#
            for ($i = 0; $i -le $Values.Count; $i++) {
                if ($Values[$i].Test1 -ne $Values[$i].Test4) {
                    New-TableContent -BackGroundColor Red -ColumnName 'Test4' -RowIndex ($i+1)
                }
            }
            #>
            #New-TableCondition -Name 'Test1' -Value 1 -BackgroundColor Green -FailBackgroundColor Red
            #New-TableCondition -Name 'Test2' -Value 1 -BackgroundColor Green -FailBackgroundColor Red
            New-HTMLTableConditionGroup {
                New-HTMLTableCondition -Name 'Test1' -Value 1 -ComparisonType number
                New-HTMLTableCondition -Name 'Test2' -Value 2 -ComparisonType number
            } -BackgroundColor Salmon -FailBackgroundColor Goldenrod -Logic OR -HighlightHeaders 'Test1', 'Test2', 'DisplayName', 'DomainName'
        } -DataStore JavaScript
    }
} -ShowHTML -Online
