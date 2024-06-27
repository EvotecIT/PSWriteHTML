Import-Module .\PSWriteHTML.psd1 -Force

$Table = @(
    [PSCustomObject] @{
        Name         = 'Process1'
        BasePriority = 1
        Company      = 'Company1'
        CompanyName  = 'Company Name 1', "Teest"
    }
    [PSCustomObject] @{
        Name         = 'Process1'
        BasePriority = 1
        Company      = 'Company1'
        CompanyName  = @('Company Name 1', "Teest")
    }
    [PSCustomObject] @{
        Name         = 'Process1'
        BasePriority = 1
        Company      = 'Company1'
        CompanyName  = "Teest"
    }
)

$Output = EmailBody -FontSize 15px -FontFamily 'Tahoma' {
    EmailText -Text 'This should be font 8pt, table should also be font 8pt'
    EmailTable -Table $Table -PrettifyObject #-PrettifyObjectSeparator " - "
    EmailText -LineBreak

    EmailTextBox -FontFamily 'Calibri' -Size 17 -TextDecoration underline -Color DarkSalmon -Alignment center {
        'Demonstration'
    }
    EmailText -LineBreak
}

Save-HTML -ShowHTML -HTML $Output