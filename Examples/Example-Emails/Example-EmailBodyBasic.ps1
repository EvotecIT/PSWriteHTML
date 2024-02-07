$Table = (Get-Process | Select-Object -First 2 -Property Name, BasePriority, Company, CompanyName)

$Body = EmailBody -FontSize 12px -FontFamily 'Tahoma' {
    EmailText -Text 'This should be font 8pt, table should also be font 8pt' -FontSize 8pt
    EmailTable -DataTable $Table -HideFooter {
        EmailTableCondition -Name 'Name' -Operator eq -Value 'svchost' -BackgroundColor TeaGreen -FailBackgroundColor Salmon -Inline
    }
}

Send-MailMessage -Body $Body