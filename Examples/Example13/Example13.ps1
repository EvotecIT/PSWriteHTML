Import-Module .\PSWriteHTML.psd1 -Force
$Processes = Get-Process | Select -First 2

$DynamicHTML = New-HTML -TitleText $ReportOptions.AsDynamicHTML.Title `
    -HideLogos:(-not $ReportOptions.AsDynamicHTML.Branding.Logo.Show) `
    -RightLogoString $ReportOptions.AsDynamicHTML.Branding.Logo.RightLogo.ImageLink `
    -UseCssLinks:$true `
    -UseStyleLinks:$true {

    New-HTMLContent -HeaderText '0 section' {
        New-HTMLColumn -ColumnCount 12 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 3 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 3 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 2 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 2 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }
    New-HTMLContent -HeaderText '1 section' {
        New-HTMLTable -ArrayOfObjects $Processes -HideFooter
    }

}

[string] $DynamicHTMLPath = Save-HTML -HTML $DynamicHTML `
    -FilePath 'C:\Support\GitHub\PSWriteHTML\Examples\Example13\Example13.html'