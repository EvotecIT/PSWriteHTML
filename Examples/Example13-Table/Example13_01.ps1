Import-Module .\PSWriteHTML.psd1 -Force

$Processes = Get-Process | Select-Object -First 50 #-Property Name, ID, HandleCount, WorkingSet
$Title = 'My title'

New-HTML -TitleText $Title -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example13_01.html {
    New-HTMLContent -HeaderText '1 section' {
        New-HTMLTable -ArrayOfObjects $Processes -HideFooter { #-ImmediatelyShowHiddenDetails
            New-TableRowGrouping -Name 'PriorityClass' -Color Red -BackgroundColor GreenYellow
        } -DisableSearch
    }
    New-HTMLContent -HeaderText '2 section' {
        #New-HTMLTable -ArrayOfObjects $Processes -HideFooter -ImmediatelyShowHiddenDetails -HideShowButton
    }
} -ShowHTML