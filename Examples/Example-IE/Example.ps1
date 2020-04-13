Import-Module .\PSWriteHTML.psd1 -Force

$Processes = Get-Process | Select-Object -First 3

New-HTML -TitleText 'My Title'  -FilePath $PSScriptRoot\TestIE.html -ShowHTML {
    New-HTMLTable -DataTable $Processes -PagingOptions @(2,4)
} -Online