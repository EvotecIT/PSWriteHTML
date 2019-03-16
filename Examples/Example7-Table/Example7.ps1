Import-Module PSWriteHTML -Force
$Processes = Get-Process | Select -First 10

$DynamicHTML = New-HTML -TitleText 'Title' -UseCssLinks:$true -UseJavaScriptLinks:$true {

    New-HTMLContent -HeaderText '0 section' -BackgroundColor SkyBlue {
        New-HTMLPanel -Count 1 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }

    New-HTMLContent -HeaderText '-1 section' -CanCollapse {
        New-HTMLPanel -Count 1 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }

    New-HTMLContent -HeaderText '1st section' -CanCollapse -HeaderTextAlignment center {
        New-HTMLPanel -Count 1 {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel -Count 1 {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel -Count 1 {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel -Count 2 -BackgroundColor Lime {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel -Count 2 -BackgroundColor LimeGreen {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }
    New-HTMLContent -HeaderText '2nd section' -BackgroundColor Seashell {
        New-HTMLPanel -Count 3 {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel -Count 3 {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel -Count 3 {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }
}

[string] $DynamicHTMLPath = Save-HTML -HTML $DynamicHTML -FilePath $PSScriptRoot\Example7.html