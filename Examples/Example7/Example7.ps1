#Import-Module PSWriteHTML -Force
$Processes = Get-Process | Select -First 10

$DynamicHTML = New-HTML -TitleText $ReportOptions.AsDynamicHTML.Title `
    -HideLogos:(-not $ReportOptions.AsDynamicHTML.Branding.Logo.Show) `
    -RightLogoString $ReportOptions.AsDynamicHTML.Branding.Logo.RightLogo.ImageLink `
    -UseCssLinks:$true `
    -UseStyleLinks:$true {

    New-HTMLContent -HeaderText '0 section' -BackgroundColor White {
        New-HTMLColumn -ColumnNumber 1 -ColumnCount 1 {
            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
    }

    New-HTMLContent -HeaderText '-1 section' -CanCollapse {
        New-HTMLColumn -ColumnNumber 1 -ColumnCount 1 {
            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
    }

    New-HTMLContent -HeaderText '1st section' -CanCollapse {
        New-HTMLColumn -ColumnNumber 1 -ColumnCount 1 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnNumber 1 -ColumnCount 1 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnNumber 1 -ColumnCount 1 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnNumber 1 -ColumnCount 2 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnNumber 2 -ColumnCount 2 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
    }
    New-HTMLContent -HeaderText '2nd section' {
        New-HTMLColumn -ColumnNumber 1 -ColumnCount 3 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnNumber 2 -ColumnCount 3 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnNumber 3 -ColumnCount 3 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
    }
}

[string] $DynamicHTMLPath = Save-HTML -HTML $DynamicHTML `
    -FilePath 'C:\Support\GitHub\PSWriteHTML\Examples\Example7\Example7.html'