Import-Module .\PSWriteHTML.psd1 -Force

Get-ADComputer -SearchBase 'OU=Domain Controllers,DC=ad,DC=evotec,DC=xyz' -Filter * -Properties * | Select-Object -First 5 | Out-HtmlView -Compare -HighlightDifferences {
    New-HTMLTableReplace -Replacements 'AD2', 'AD1'
    New-HTMLTableReplace -Replacements 'AD3', 'AD1'
    New-HTMLTableReplace -Replacements 'AD4', 'AD1'
    New-HTMLTableCondition -Name 'Name' -Value 'ServicePrincipalName' -BackgroundColor Gold -Row
    New-HTMLTableCondition -Name 'Name' -Value 'CanonicalName' -BackgroundColor Gold -Row
    New-HTMLTableCondition -Name 'Name' -Value 'accountExpires' -BackgroundColor Gold -Row
    New-HTMLTableCondition -Name 'Status' -ComparisonType string -Operator eq -Value $false -BackgroundColor Red -Color White
    New-HTMLTableCondition -Name 'Status' -ComparisonType string -Operator eq -Value $true -BackgroundColor Green -Color White
}

Get-ADComputer -SearchBase 'OU=Domain Controllers,DC=ad,DC=evotec,DC=xyz' -Filter * -Properties * | Select-Object -First 5 | Out-HtmlView -Compare -HighlightDifferences


$Objects2 = @(
    Get-ADComputer -SearchBase 'OU=Domain Controllers,DC=ad,DC=evotec,DC=xyz' -Filter * -Properties *
)

$Objects3 = @(
    [ordered] @{ Test = 'My value 1'; Test1 = 'My value1' }
    [ordered] @{ Test = 'My value 2'; Test1 = 'My value1' }
    #  @{ Test = 'My value 3'; Test1 = 'My value1' }
    #  @{ Test = 'My value 3'; Test2 = 'My value1', 'my value 3' }
)

$Replace = @(
    @{ 'DNSHostName' = 'AD2', 'AD1' }
    @{ 'DNSHostName' = 'AD3', 'AD1' }
    #@{ '' = 'AD2', 'AD1' }
    #@{ '' = 'AD3', 'AD1' }
)

#Compare-MultipleObjects -Objects $Objects2 -FormatOutput -Summary -Replace $Replace -ExcludeProperty SID | ft -AutoSize


New-HTML -TitleText $Title -Online -FilePath $PSScriptRoot\Example-Comparing03.html {
    New-HTMLSection -HeaderText 'Comparing Object with Highlighting Differences (Domain Controllers)' {
        New-HTMLTable -DataTable $Objects2 -Compare -AllProperties -HighlightDifferences {
            New-HTMLTableReplace -Replacements 'AD2', 'AD1'
            New-HTMLTableReplace -Replacements 'AD3', 'AD1'
        }
    }
    New-HTMLSection -HeaderText 'Comparing Object with Highlighting Differences (Hashtables)' {
        New-HTMLTable -DataTable $Objects3 -Compare -AllProperties -HighlightDifferences #-Replace $Replace
    }
} -ShowHTML