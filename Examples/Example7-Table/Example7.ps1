Import-Module PSWriteHTML -Force
$Processes = Get-Process | Select -First 10

$DynamicHTML = New-HTML -TitleText $ReportOptions.AsDynamicHTML.Title `
    -HideLogos:(-not $ReportOptions.AsDynamicHTML.Branding.Logo.Show) `
    -RightLogoString $ReportOptions.AsDynamicHTML.Branding.Logo.RightLogo.ImageLink `
    -UseCssLinks:$true `
    -UseJavaScriptLinks:$true {

    New-HTMLContent -HeaderText '0 section' -BackgroundColor SkyBlue {
        New-HTMLColumn -ColumnCount 1 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }

    New-HTMLContent -HeaderText '-1 section' -CanCollapse {
        New-HTMLColumn -ColumnCount 1 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }

    New-HTMLContent -HeaderText '1st section' -CanCollapse -HeaderTextAlignment center {
        New-HTMLColumn -ColumnCount 1 {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 1 {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 1 {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 2 -BackgroundColor Lime {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 2 -BackgroundColor LimeGreen {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }
    New-HTMLContent -HeaderText '2nd section' -BackgroundColor Seashell {
        New-HTMLColumn -ColumnCount 3 {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 3 {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 3 {

            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }
}

[string] $DynamicHTMLPath = Save-HTML -HTML $DynamicHTML -FilePath $PSScriptRoot\Example7.html