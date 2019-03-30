Import-Module PSWriteHTML.psd1 -Force
$Processes = Get-Process | Select-Object -First 2
$Processes1 = Get-Process | Select-Object -First 10
$Title = 'My title'

New-HTML -TitleText $Title -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example14.html {

    New-HTMLContent -HeaderText '0 section' -CanCollapse {
        New-HTMLPanel {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -ArrayOfObjects $Processes1 -HideFooter
        }
        New-HTMLPanel {

        }
        New-HTMLPanel {

        }
        New-HTMLPanel {
            New-HTMLTable -ArrayOfObjects $Processes1 -HideFooter
        }
    }
    New-HTMLContent -HeaderText '1 section' {
        New-HTMLTable -ArrayOfObjects $Processes -HideFooter
    }

}