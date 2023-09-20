Import-Module .\PSWriteHTML.psd1 -Force

$DataTable = @(
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.42; Percents = 50 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 5.72; Percents = 5 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 16.22; Percents = 17 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 23.73; Percents = 99 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 50.73; Percents = 105 } # will be trimmed to 100%
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 90; Percents = 105 } # will be trimmed to 100%
)

New-HTML {
    New-HTMLTable -DataTable $DataTable -AlphabetSearch {
        New-TablePercentageBar -ColumnID 4 # runs on defaults
        New-TablePercentageBar -ColumnID 3 -BackgroundColor Blue -TextColor White -BorderColor Grey -BarColor gold -BorderStyle ridge -Type round {
            New-TablePercentageBarCondition -Minimum 0 -Maximum 10 -BackgroundColor Blue -TextColor White -BarColor Red
            New-TablePercentageBarCondition -Minimum 11 -Maximum 20 -BackgroundColor Blue -TextColor White -BarColor Green
            New-TablePercentageBarCondition -Minimum 21 -Maximum 25 -BackgroundColor Blue -TextColor White -BarColor AppleBlossom
            New-TablePercentageBarCondition -Minimum 26 -Maximum 85 -BackgroundColor Grey -TextColor Black -BarColor Cyan
            New-TablePercentageBarCondition -Minimum 86 -Maximum 100 -BackgroundColor Blue -TextColor White -BarColor Yellow
        }
    } -ImmediatelyShowHiddenDetails
} -ShowHTML -FilePath $PSScriptRoot\Example7_PercentageBar.html -Online