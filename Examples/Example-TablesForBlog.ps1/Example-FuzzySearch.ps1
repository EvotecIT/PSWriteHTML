Import-Module .\PSWriteHTML.psd1 -Force

$Users = Get-ADUser -Filter * -Properties LastLogonDate, PasswordLastSet
New-HTML {
    New-HTMLTable -DataTable $Users -Title 'Table with Users' -HideFooter -PagingLength 10 -FuzzySearch {
        New-TableAlphabetSearch -ColumnName 'Name' -CaseSensitive -AddNumbers
    } -FuzzySearchSmartToggle
} -ShowHTML -FilePath "$PSScriptRoot\Example-FuzzySearch.html" -Online