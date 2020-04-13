Import-Module PSWriteHTML -Force

$Objects1 = @(
    [PSCustomobject] @{ Test = 'My value'; Test1 = 'My value1' }
    [PSCustomobject] @{ Test = 'My value 2'; Test1 = 'My value1' }
    [PSCustomobject] @{ Test = 'My value 3'; Test1 = 'My value1' }
    [PSCustomobject] @{ Test = 'My value 3'; Test2 = 'My value1', 'my value 3' }
)

$Objects2 = @(
    Get-ADComputer -SearchBase 'OU=Domain Controllers,DC=ad,DC=evotec,DC=xyz' -Filter * #-Properties *
)

$Objects3 = @(
    @{ Test = 'My value'; Test1 = 'My value1' }
    @{ Test = 'My value 2'; Test1 = 'My value1' }
    @{ Test = 'My value 3'; Test1 = 'My value1' }
    @{ Test = 'My value 3'; Test2 = 'My value1', 'my value 3' }
)

New-HTML -TitleText $Title -Online -FilePath $PSScriptRoot\Example-Comparing01.html {
    New-HTMLSection -HeaderText 'Comparing Object with Highlighting Differences (PSCustomObject)' {
        New-HTMLTable -DataTable $Objects1 -Compare -AllProperties -HighlightDifferences
    }
    New-HTMLSection -HeaderText 'Comparing Object with Highlighting Differences (Domain Controllers)' {
        New-HTMLTable -DataTable $Objects2 -Compare -AllProperties -HighlightDifferences
    }
    New-HTMLSection -HeaderText 'Comparing Object with Highlighting Differences (Hashtables)' {
        New-HTMLTable -DataTable $Objects3 -Compare -AllProperties -HighlightDifferences
    }
} -ShowHTML