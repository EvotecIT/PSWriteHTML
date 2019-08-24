Import-Module .\PSWriteHTML.psd1 -Force

$Processes = Get-Process | Select-Object -First 5 -Property Name, ID, HandleCount, WorkingSet
$Title = 'My title'

New-HTML -TitleText $Title -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example13.html {
    New-HTMLContent -HeaderText '1 section' {
        New-HTMLTable -ArrayOfObjects $Processes -HideFooter -ImmediatelyShowHiddenDetails
    }
    New-HTMLContent -HeaderText '2 section' {
        New-HTMLTable -ArrayOfObjects $Processes -HideFooter -ImmediatelyShowHiddenDetails -HideShowButton
    }
} -ShowHTML