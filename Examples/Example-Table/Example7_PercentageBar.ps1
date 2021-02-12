Import-Module .\PSWriteHTML.psd1 -Force

$DataTable = @(
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.42; Percents = 50 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.72; Percents = 5 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.22; Percents = 17 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 23.73; Percents = 99 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 2.73; Percents = 105 } # will be trimmed to 100%
)

New-HTML {
    New-HTMLTable -DataTable $DataTable -EnableSearchAlphabet {
        New-TablePercentageBar -ColumnID 4 # runs on defaults
        New-TablePercentageBar -ColumnID 3 -BackgroundColor Blue -TextColor White -BorderColor Grey -BarColor gold -BorderStyle ridge -Type round
    } -ImmediatelyShowHiddenDetails
} -ShowHTML -Online -FilePath $PSScriptRoot\Example7_PercentageBar.html -Format