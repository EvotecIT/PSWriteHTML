Import-Module PSWriteHTML -Force
$Processes = Get-Process | Select -First 10

$DynamicHTML = New-HTML -TitleText $ReportOptions.AsDynamicHTML.Title `
    -HideLogos:(-not $ReportOptions.AsDynamicHTML.Branding.Logo.Show) `
    -RightLogoString $ReportOptions.AsDynamicHTML.Branding.Logo.RightLogo.ImageLink `
    -UseCssLinks:$true `
    -UseStyleLinks:$true {

    New-HTMLContent -HeaderText '0 section' -BackgroundColor SkyBlue {
        New-HTMLColumn -ColumnCount 1 {
            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
    }

    New-HTMLContent -HeaderText '-1 section' -CanCollapse {
        New-HTMLColumn -ColumnCount 1 {
            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
    }

    New-HTMLContent -HeaderText '1st section' -CanCollapse -HeaderTextAlignment center {
        New-HTMLColumn -ColumnCount 1 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 1 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 1 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 2 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 2 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
    }
    New-HTMLContent -HeaderText '2nd section' -BackgroundColor Seashell {
        New-HTMLColumn -ColumnCount 3 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 3 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 3 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
    }
}

[string] $DynamicHTMLPath = Save-HTML -HTML $DynamicHTML `
    -FilePath 'C:\Support\GitHub\PSWriteHTML\Examples\Example7\Example7.html'