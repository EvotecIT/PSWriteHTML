Import-Module .\PSWriteHTML.psd1 -Force
$Processes = Get-Process | Select-Object -First 5

$CodeBlock = @'

$HTML = New-HtmlPage -Name 'Test' -UseCssLinks -UseJavaScriptLinks {
    New-HTMLTabHeader -TabNames 'Dashboard', 'Other'
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLContent -HeaderText 'Content' {
            New-HTMLPanel -Count 2 {
                New-HTMLContent -HeaderText 'My text' -CanCollapse {
                    New-HTMLTable -Simplify -ArrayOfObjects $DomainAdminTable
                }
            }
            New-HTMLPanel -Count 2 {
                New-HTMLContent -HeaderText 'My text' -CanCollapse {
                    New-HTMLTable -Simplify -ArrayOfObjects $DomainAdminTable
                }
            }
            New-HTMLContent -HeaderText 'My text 2' -CanCollapse {
                New-HTMLTable -ArrayOfObjects $EnterpriseAdminTable
            }
        }
        New-HTMLContent -HeaderText 'This shows PowerShell Language' {
            Get-HTMLCodeBlock -Code $CodeBlock -Style 'PowerShell'
        }
    }
    New-HTMLTab -TabName 'Other' -TabHeading 'Test 2' {
        New-HTMLContent -HeaderText 'My other text' {
            New-HTMLTable -Simplify -ArrayOfObjects $EnterpriseAdminTable
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


$DynamicHTML = New-HTML -TitleText 'My title' -UseCssLinks:$true -UseJavaScriptLinks:$true {
    New-HTMLLogo

    New-HTMLContent -HeaderText '0 section' -BackgroundColor SkyBlue {
        New-HTMLPanel -Count 1 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel -Count 2 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel -Count 2 {
            $Processes = Get-Process | Select -First 5
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }
    New-HTMLContent -HeaderText '-1 section' -CanCollapse {
        New-HTMLPanel -Count 1 {
            # Standard Chart Bar 
            New-HTMLChart -Data @(400, 430, 448) -DataNames 'People count' -DataCategories 'Poland', 'Europe', 'Germany'

            New-HTMLChart -Data @(400, 430, 448) -DataCategories 'Poland', 'Europe', 'Germany' -Type 'donut'

            New-HTMLChart -Data @(400, 430, 448), @(450, 0, 200) -DataNames 'People count', 'People death' -DataCategories '2015', '2016', '2017' -Type 'line' -LineColor 'Blue', 'Green'

            # New-HTMLChart -Data @(400, 430, 448) -DataCategories 'Poland', 'Europe', 'Germany' -Type 'column'
        }
        New-HTMLPanel -Count 2 {
            $GroupedBar = @()
            $GroupedBar += 400, 430, 448
            $GroupedBar1 = @()
            $GroupedBar1 += 420, 450, 448
            New-HTMLChart -Data $GroupedBar, $GroupedBar1 -DataNames 'People count in  2019', 'People count in 2018' -DataCategories 'Poland', 'Europe', 'Germany'
        }
        New-HTMLPanel -Count 2 {
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
        New-HTMLPanel -Count 1 {
            $Data1 = 44, 55, 57, 56, 61, 58, 63, 60, 66
            $Data2 = 76, 85, 101, 98, 87, 105, 91, 114, 94
            $Data3 = 35, 41, 36, 26, 45, 48, 52, 53, 41
            $DataName = "Net Profit", "Revenue", "Free Cash Flow"
            $DataCategories = "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct"
            New-HTMLChart -Data $Data1, $Data2, $Data3 -DataNames $DataName -DataCategories $DataCategories -Horizontal $false
        }
    }
    New-HTMLContent -HeaderText 'Section 3rd with 3 columns' {
        New-HTMLPanel -Count 3 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel -Count 3 {
            New-HTMLChart -Data @(400, 430, 448), @(450, 0, 200) -DataNames 'People count', 'People death' -DataCategories '2015', '2016', '2017' -Type 'line' -LineColor 'Blue', 'Green'
        }
        New-HTMLPanel -Count 3 {
            New-HTMLChart -Data @(400, 430, 448) -DataCategories 'Poland', 'Europe', 'Germany' -Type 'donut'
        }
    }
    New-HTMLContent -HeaderText 'Anoteher' {
        New-HTMLPanel -Count 2 {
            New-HTMLCodeBlock -Code $CodeBlockJS -Style 'JavaScript' -Theme enlighter -Highlight '2, 5'
        }
        New-HTMLPanel -Count 2 {
            New-HTMLCodeBlock -Code $CodeBlock -Style 'PowerShell' -Theme enlighter -Highlight '2, 5'
        }
    }
}

[string] $DynamicHTMLPath = Save-HTML -HTML $DynamicHTML -FilePath $PSScriptRoot\Example9.html