$Processes = Get-Process | Select -First 10

$DynamicHTML = New-HTML -TitleText $ReportOptions.AsDynamicHTML.Title `
    -HideLogos:(-not $ReportOptions.AsDynamicHTML.Branding.Logo.Show) `
    -RightLogoString $ReportOptions.AsDynamicHTML.Branding.Logo.RightLogo.ImageLink `
    -UseCssLinks:$true `
    -UseStyleLinks:$true {

    New-HTMLContent -HeaderText $ReportNameTitle -CanCollapse {
        New-HTMLColumn -ColumnNumber 1 -ColumnCount 1 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnNumber 1 -ColumnCount 1 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnNumber 1 -ColumnCount 1 {

            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
    }
}

[string] $DynamicHTMLPath = Save-HTML -HTML $DynamicHTML `
    -FilePath 'C:\Support\GitHub\PSWriteHTML\Examples\Example7\Example7.html'