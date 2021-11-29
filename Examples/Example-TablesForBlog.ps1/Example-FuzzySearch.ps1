Import-Module .\PSWriteHTML.psd1 -Force

$Users = Get-ADUser -Filter * -Properties LastLogonDate, PasswordLastSet | Select-Object -First 6
New-HTML {
    New-HTMLTable -DataTable $Users -Title 'Table with Users' -HideFooter -PagingLength 5 {
        New-TableAlphabetSearch -ColumnName 'Name' -CaseSensitive -AddNumbers
    } -FuzzySearch -FuzzySearchSmartToggle

    New-HTMLTable -DataTable $Users -Title 'Table with Users' -HideFooter -PagingLength 5 {
        New-TableAlphabetSearch -ColumnName 'Name' -CaseSensitive -AddNumbers
    }
} -ShowHTML -FilePath "$PSScriptRoot\Example-FuzzySearch.html" -Online