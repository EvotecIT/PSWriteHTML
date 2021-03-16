$Users = Get-ADUser -Filter * -Properties LastLogonDate, PasswordLastSet
New-HTML {
    New-HTMLTable -DataTable $Users -Title 'Table with Users' -HideFooter -PagingLength 10 -SearchPane
} -ShowHTML -FilePath "$PSScriptRoot\Example-SearchPane01.html" -Online


$Users = Get-ADUser -Filter * -Properties LastLogonDate, PasswordLastSet
New-HTML {
    New-HTMLTable -DataTable $Users -Title 'Table with Users' -HideFooter -PagingLength 10 -Buttons excelHtml5, searchPanes
} -ShowHTML -FilePath "$PSScriptRoot\Example-SearchPane02.html" -Online