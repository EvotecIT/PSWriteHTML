Import-Module .\PSWriteHTML.psd1 -Force
$Processes = Get-Process | Select -First 5

$CodeBlock = @'

$HTML = New-HtmlPage -Name 'Test' -UseCssLinks -UseStyleLinks {
    New-HTMLTabHeader -TabNames 'Dashboard', 'Other'
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLContent -HeaderText 'Content' {
            New-HTMLColumn -ColumnCount 2 {
                New-HTMLContent -HeaderText 'My text' -CanCollapse {
                    Get-HTMLContentTable -ArrayOfObjects $DomainAdminTable
                }
            }
            New-HTMLColumn -ColumnCount 2 {
                New-HTMLContent -HeaderText 'My text' -CanCollapse {
                    Get-HTMLContentTable -ArrayOfObjects $DomainAdminTable
                }
            }
            New-HTMLContent -HeaderText 'My text 2' -CanCollapse {
                Get-HTMLContentDataTable -ArrayOfObjects $EnterpriseAdminTable
            }
        }
        New-HTMLContent -HeaderText 'This shows PowerShell Language' {
            Get-HTMLCodeBlock -Code $CodeBlock -Style 'PowerShell'
        }
    }
    New-HTMLTab -TabName 'Other' -TabHeading 'Test 2' {
        New-HTMLContent -HeaderText 'My other text' {
            Get-HTMLContentTable -ArrayOfObjects $EnterpriseAdminTable
        }
    }
}
Save-HTML -FilePath $HTMLPath -ShowHTML -HTML $HTML

'@

# Code Block for JS Code (Showing how <pre> tags work)
$CodeBlockJS = @'
//refresh page on browser resize
$(window).bind("resize", function(e) {
    if (window.RT) clearTimeout(window.RT);
    window.RT = setTimeout(function() {
        this.location.reload(false); /* false to get page from cache */
    }, 200);
});
'@


$DynamicHTML = New-HTML -TitleText $ReportOptions.AsDynamicHTML.Title `
    -HideLogos:(-not $ReportOptions.AsDynamicHTML.Branding.Logo.Show) `
    -RightLogoString $ReportOptions.AsDynamicHTML.Branding.Logo.RightLogo.ImageLink `
    -UseCssLinks:$true `
    -UseStyleLinks:$true {

    New-HTMLContent -HeaderText '0 section' -BackgroundColor SkyBlue {
        New-HTMLColumn -ColumnCount 1 {
            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 2 {
            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 2 {
            $Processes = Get-Process | Select -First 5
            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
    }
    New-HTMLContent -HeaderText '-1 section' -CanCollapse {
        New-HTMLColumn -ColumnCount 1 {
            # Standard Chart Bar 
            New-HTMLChart -Data @(400, 430, 448) -DataNames 'People count' -DataCategories 'Poland', 'Europe', 'Germany'

            New-HTMLChart -Data @(400, 430, 448) -DataCategories 'Poland', 'Europe', 'Germany' -Type 'donut'

            New-HTMLChart -Data @(400, 430, 448), @(450, 0, 200) -DataNames 'People count', 'People death' -DataCategories '2015', '2016', '2017' -Type 'line' -LineColor 'Blue', 'Green'

            # New-HTMLChart -Data @(400, 430, 448) -DataCategories 'Poland', 'Europe', 'Germany' -Type 'column'
        }
        New-HTMLColumn -ColumnCount 2 {
            $GroupedBar = @()
            $GroupedBar += 400, 430, 448
            $GroupedBar1 = @()
            $GroupedBar1 += 420, 450, 448
            New-HTMLChart -Data $GroupedBar, $GroupedBar1 -DataNames 'People count in  2019', 'People count in 2018' -DataCategories 'Poland', 'Europe', 'Germany'
        }
        New-HTMLColumn -ColumnCount 2 {
            $Data = 10, 41, 35, 51, 49, 62, 69, 91, 148
            $DataName = "Desktops"
            $DataCategories = 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
            New-HTMLChart `
                -Data $Data `
                -DataNames $DataName `
                -DataCategories $DataCategories `
                -Type 'line' `
                -TitleText 'Product Trends by Month' `
                -TitleAlignment 'left' `
                -LineColor 'Blue', 'Green' -Horizontal $false

            
        }
        New-HTMLColumn -ColumnCount 1 {
            $Data1 = 44, 55, 57, 56, 61, 58, 63, 60, 66
            $Data2 = 76, 85, 101, 98, 87, 105, 91, 114, 94
            $Data3 = 35, 41, 36, 26, 45, 48, 52, 53, 41
            $DataName = "Net Profit", "Revenue", "Free Cash Flow"
            $DataCategories = "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct"
            New-HTMLChart -Data $Data1, $Data2, $Data3 -DataNames $DataName -DataCategories $DataCategories -Horizontal $false
        }
    }
    New-HTMLContent -HeaderText 'Section 3rd with 3 columns' {
        New-HTMLColumn -ColumnCount 3 {
            Get-HTMLContentDataTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLColumn -ColumnCount 3 {
            New-HTMLChart -Data @(400, 430, 448), @(450, 0, 200) -DataNames 'People count', 'People death' -DataCategories '2015', '2016', '2017' -Type 'line' -LineColor 'Blue', 'Green'
        }
        New-HTMLColumn -ColumnCount 3 {
            New-HTMLChart -Data @(400, 430, 448) -DataCategories 'Poland', 'Europe', 'Germany' -Type 'donut'
        }
    }
    New-HTMLContent -HeaderText 'Anoteher' {
        New-HTMLColumn -Columns 2 {
            New-HTMLCodeBlock -Code $CodeBlockJS -Style 'JavaScript' -Theme enlighter -Highlight '2, 5'
        }
        New-HTMLColumn -Columns 2 {
            New-HTMLCodeBlock -Code $CodeBlock -Style 'PowerShell' -Theme enlighter -Highlight '2, 5'
        }
    }
}

[string] $DynamicHTMLPath = Save-HTML -HTML $DynamicHTML `
    -FilePath 'C:\Support\GitHub\PSWriteHTML\Examples\Example9\Example9.html'