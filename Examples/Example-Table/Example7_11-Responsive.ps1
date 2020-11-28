Import-Module .\PSWriteHTML.psd1 -Force

$Test = Get-Process | Select-Object -First 2
# New-HTML option
New-HTML {
    New-HTMLTable -DataTable $Test
} -ShowHTML -Online -FilePath $PSScriptRoot\Example7_11-Responsive.html