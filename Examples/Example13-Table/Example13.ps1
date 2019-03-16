Import-Module PSWriteHTML.psd1 -Force
$Processes = Get-Process | Select -First 2
$Title = 'My title'

$DynamicHTML = New-HTML -TitleText $Title -UseCssLinks:$true -UseJavaScriptLinks:$true {

    New-HTMLContent -HeaderText '0 section' {
        New-HTMLPanel -Count 12 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel -Count 3 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel -Count 3 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel -Count 2 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel -Count 2 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }
    New-HTMLContent -HeaderText '1 section' {
        New-HTMLTable -ArrayOfObjects $Processes -HideFooter
    }

}

[string] $DynamicHTMLPath = Save-HTML -HTML $DynamicHTML -FilePath $PSScriptRoot\Example13.html