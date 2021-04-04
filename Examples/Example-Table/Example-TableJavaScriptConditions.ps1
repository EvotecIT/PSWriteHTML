Import-Module .\PSWriteHTML.psd1 -Force

$DataTable1 = @(
    [PscustomObject] @{ DateTest = '2027-09-12'; DateUS = '3/31/2020'; Dates = (Get-Date).AddDays(2); BoolAsString = 'true'; BoolTest = $true; Test = 'ABC', 'DEF'; Test2 = 'Name1'; Test3 = 'Name3'; 'Test4' = 1 }
    [PscustomObject] @{ DateTest = '2021-01-12'; DateUS = '3/23/2020'; Dates = (Get-Date).AddDays(0); BoolAsString = 'false'; BoolTest = $false; Test = 'Opps'; Test2 = 'Name2'; Test3 = 'Name2'; 'Test4' = 2 }
    [PscustomObject] @{ DateTest = '1982-08-15'; DateUS = '3/5/2020'; Dates = (Get-Date).AddDays(-7); BoolAsString = 'false'; BoolTest = $null; Test = 'Oh No'; Test2 = 'Name3'; Test3 = 'KitKat'; 'Test4' = 3 }
    [PscustomObject] @{ DateTest = '2021-03-12'; DateUS = '4/5/2020'; Dates = (Get-Date).AddDays(13); BoolAsString = 'null'; BoolTest = $true; Test = 'Name'; Test2 = 'Name4'; Test3 = 'Bounty'; 'Test4' = 0 }
    [PscustomObject] @{ DateTest = '2021-03-12'; DateUS = '3/15/2020'; Dates = (Get-Date).AddDays(5); BoolAsString = 'true'; BoolTest = $false; Test = 'Name'; Test2 = 'Name5'; Test3 = 'Name4'; 'Test4' = $null }
    [PscustomObject] @{ DateTest = '2025-01-17'; DateUS = '3/5/2020'; Dates = (Get-Date).AddDays(0); BoolAsString = 'True'; BoolTest = $false; Test = 'Name'; Test2 = 'Name2'; Test3 = 'KitKat'; 'Test4' = 10 }
    [PscustomObject] @{ DateTest = '2021-03-12'; DateUS = '7/5/2020'; Dates = (Get-Date).AddDays(21); BoolAsString = 'true'; BoolTest = $true; Test = 'Name'; Test2 = 'Name2'; Test3 = 'Bounty'; 'Test4' = 5 }
    [PscustomObject] @{ DateTest = '2021-12-12'; DateUS = '12/5/2021'; Dates = (Get-Date).AddDays(5); BoolAsString = 'True'; BoolTest = $true; Test = 'Name'; Test2 = 'Name2'; Test3 = 'Test'; 'Test4' = 0 }
)

New-HTML {
    #New-HTMLTableOption -DataStore HTML -ArrayJoin -BoolAsString
    New-HTMLTableOption -DataStore HTML -BoolAsString -ArrayJoin -ArrayJoinString ', ' -DateTimeFormat 'dd.MM.yyyy HH:mm:ss'
    #New-HTMLTableOption -DataStore HTML -ArrayJoin -ArrayJoinString ' + '
    New-HTMLTable -DataTable $DataTable1 {
        # New-TableCondition -Name 'Test2' -Value 'Name1' -BackgroundColor Green -Operator eq -ComparisonType string
        #New-TableCondition -Name 'Test2' -Value 'name1' -BackgroundColor Yellow -Operator eq -ComparisonType string -CaseSensitive
        #New-TableCondition -Name 'Test4' -Value '' -BackgroundColor White -Operator eq -ComparisonType string
        #New-TableCondition -Name 'Test' -Value 'Name' -BackgroundColor Blue -Operator like -ComparisonType string
        #New-TableCondition -Name 'Test4' -Value 0 -BackgroundColor Blue -Operator ge -ComparisonType number #-HighlightHeader Test2, Test4

        #New-TableCondition -Name 'Test3' -Operator in -ComparisonType string -Value 'Kitkat', 'Bounty' -BackgroundColor Grey -Inline -Row


        New-TableConditionGroup {
            New-TableCondition -Name 'Test4' -Value 3 -Operator gt -ComparisonType number
            New-TableCondition -Name 'Test3' -Value 'Bounty' -Operator eq -ComparisonType string
        } -Logic NONE -BackgroundColor Green -HighlightHeaders Test3, Test4 -FailBackgroundColor Red
        #New-TableCondition -Name 'Test4' -Value 2 -BackgroundColor Yellow -Operator gt -ComparisonType number -HighlightHeader Test2, Test -Inline
        #New-TableCondition -Name 'Test4' -Value 2, 5 -BackgroundColor Red -Operator betweenInclusive -ComparisonType number -HighlightHeader Test, Test2
        #New-TableCondition -Name 'Test4' -Value 2, 5 -BackgroundColor Red -Operator betweenInclusive -ComparisonType number -HighlightHeader Test, Test2 -Inline
        #New-TableCondition -Name 'Dates' -Value (Get-Date -Second 1).AddDays(0) -BackgroundColor Red -Operator gt -ComparisonType date -HighlightHeader Test4, BoolTest -DateTimeFormat 'DD.MM.YYYY HH:mm:ss'
        #New-TableCondition -Name 'Dates' -Value (Get-Date -Second 1).AddDays(-1), (Get-Date -Second 1).AddDays(5) -BackgroundColor Blue -Operator between -ComparisonType date -HighlightHeader Test4, BoolTest -DateTimeFormat 'DD.MM.YYYY HH:mm:ss'
        #New-TableCondition -Name 'Dates' -Value (Get-Date -Second 1).AddDays(0) -BackgroundColor Red -Operator gt -ComparisonType date -HighlightHeader Test4, BoolTest -DateTimeFormat 'dd.MM.yyyy HH:mm:ss' -Inline
        #New-TableCondition -Name 'BoolTest' -Value $true -BackgroundColor Yellow -Color Green -Operator eq -ComparisonType bool #-Inline
        #New-TableCondition -Name 'BoolAsString' -Value $true -BackgroundColor Yellow -Color Green -Operator eq -ComparisonType bool -Inline
        #New-TableCondition -Name 'BoolTest' -Value $true -BackgroundColor Yellow -Color Green -Operator eq -ComparisonType string -Inline
        #New-TableCondition -Name 'BoolAsString' -Value $true -BackgroundColor Yellow -Color Green -Operator eq -ComparisonType string -Inline -FailBackgroundColor Green
        #New-TableCondition -Name 'Test4' -Value $true -BackgroundColor Yellow -Color Green -Operator eq -ComparisonType bool -Row

    } -DateTimeSortingFormat 'DD.MM.YYYY HH:mm:ss', 'M/D/YYYY', 'YYYY-MM-DD'
} -ShowHTML -FilePath $PSScriptRoot\Example-TableJavaScriptConditions.html -Online
