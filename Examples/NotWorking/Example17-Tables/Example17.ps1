Import-Module .\PSWriteHTML.psd1 -Force

$Process = Get-Process | Select-Object -First 5

New-HTML -TitleText 'My title' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example18.html {
    New-HTMLTab -Name 'Test 1' {
        New-HTMLContent -HeaderText 'Test 3' {
            New-HTMLTable -DataTable $Process
        }
    }
    New-HTMLTab -Name 'Test2' {
        New-HTMLContent -HeaderText 'Test 4' {
            New-HTMLTable -DataTable $Process
        }
    }
}
