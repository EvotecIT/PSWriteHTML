$Time = Start-TimeLog
Import-Module PSWriteHTML.psd1 -Force
Stop-TimeLog -Time $Time
$Time = Start-TimeLog

$Processes = Get-Process | Select -First 2
$Title = 'My title'

New-HTML -TitleText $Title -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example13.html {

    New-HTMLContent -HeaderText '0 section' {
        New-HTMLPanel {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }
    New-HTMLContent -HeaderText '1 section' {
        New-HTMLTable -ArrayOfObjects $Processes -HideFooter
    }

    New-HTMLContent -Invisible {
        New-HTMLPanel {        
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel {        
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
   
        }
    }
    New-HTMLPanel {        
        New-HTMLTable -ArrayOfObjects $Processes -HideFooter

    }
}

Stop-TimeLog -Time $Time