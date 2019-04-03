Import-Module .\PSWriteHTML.psd1 -Force

$Process = Get-Process | Select-Object -First 30

New-HTML -TitleText 'My title' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example17.html {
    New-HTMLContent -HeaderText 'Test' {
        New-HTMLTable -DataTable $Process
    }
    New-HTMLContent -HeaderText 'Test' {
        New-HTMLTable -DataTable $Process -DefaultSortIndex 3
    }
    New-HTMLTable -DataTable $Process
}
