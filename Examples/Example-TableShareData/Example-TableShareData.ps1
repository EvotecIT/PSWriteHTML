Import-Module .\PSWriteHTML.psd1 -Force

$Users = Get-ADUser -Filter * -Properties LastLogonDate, PasswordLastSet | Select-Object -First 3
New-HTML {
    New-HTMLTableOption -DataStore JavaScript
    New-HTMLTable -DataTable $Users -Title 'Table with Users' -HideFooter -PagingLength 10 {

    }

    New-HTMLTable -DataTable @() -Title 'Table with Users' -HideFooter -PagingLength 10 {

    }
} -ShowHTML -FilePath "$PSScriptRoot\Example-TableShareData.html" -Online