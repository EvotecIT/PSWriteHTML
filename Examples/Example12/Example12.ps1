Import-Module PSWriteHTML -Force
$Processes = Get-Process | Select -First 10

$DynamicHTML = New-HTML -TitleText $ReportOptions.AsDynamicHTML.Title `
    -HideLogos:(-not $ReportOptions.AsDynamicHTML.Branding.Logo.Show) `
    -RightLogoString $ReportOptions.AsDynamicHTML.Branding.Logo.RightLogo.ImageLink `
    -UseCssLinks:$true `
    -UseStyleLinks:$true {

    New-HTMLContent -HeaderText '0 section' -CanCollapse {
        New-HTMLColumn -ColumnCount 1 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }
}

[string] $DynamicHTMLPath = Save-HTML -HTML $DynamicHTML `
    -FilePath 'C:\Support\GitHub\PSWriteHTML\Examples\Example12\Example12.html'