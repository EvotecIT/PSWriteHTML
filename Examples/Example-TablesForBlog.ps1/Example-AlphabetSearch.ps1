$Users = Get-ADUser -Filter * -Properties LastLogonDate, PasswordLastSet
New-HTML {
    New-HTMLTable -DataTable $Users -Title 'Table with Users' -HideFooter -PagingLength 10 -AlphabetSearch {
        New-TableAlphabetSearch -ColumnName 'Name' -CaseSensitive -AddNumbers
    }
} -ShowHTML -FilePath "$PSScriptRoot\Example-AlphabetSearch.html" -Online