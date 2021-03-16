$Users = Get-ADUser -Filter * -Properties LastLogonDate, PasswordLastSet
New-HTML {
    New-HTMLTableOption -DataStore JavaScript -DateTimeFormat 'dd.MM.yyyy HH:mm:ss' -ArrayJoin -ArrayJoinString ','
    New-HTMLTable -DataTable $Users -Title 'Table with Users' -HideFooter -PagingLength 10 -SearchBuilder
} -ShowHTML -FilePath "$PSScriptRoot\Example-Builder.html" -Online