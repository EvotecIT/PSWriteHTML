Import-Module .\PSWriteHTML.psd1 -Force
$Processes = Get-Process | Select -First 5

$DynamicHTML = New-HTML -TitleText $ReportOptions.AsDynamicHTML.Title `
    -HideLogos:(-not $ReportOptions.AsDynamicHTML.Branding.Logo.Show) `
    -RightLogoString $ReportOptions.AsDynamicHTML.Branding.Logo.RightLogo.ImageLink `
    -UseCssLinks:$true `
    -UseStyleLinks:$true {

    New-HTMLContent -HeaderText '0 section' {
        New-HTMLColumn -ColumnCount 3 -BackgroundColor DarkSlateGray {
            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 3 {
            
        }
        New-HTMLColumn -ColumnCount 3 -BackgroundColor LightSteelBlue {

        }
    }
}

[string] $DynamicHTMLPath = Save-HTML -HTML $DynamicHTML `
    -FilePath 'C:\Support\GitHub\PSWriteHTML\Examples\Example10\Example10.html'