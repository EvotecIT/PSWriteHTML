Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example29-01.html" {
    New-HTMLLogo
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLTable -DataTable (Get-Process | Select-Object -First 2)
    }
} -ShowHTML #-Online