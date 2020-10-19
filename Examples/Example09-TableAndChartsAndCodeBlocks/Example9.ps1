Import-Module .\PSWriteHTML.psd1 -Force
$Processes = Get-Process | Select-Object -First 5

$CodeBlock = @'

$HTML = New-HtmlPage -Name 'Test' -Online {
    New-HTMLTabHeader -TabNames 'Dashboard', 'Other'
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLSection -HeaderText 'Content' {
            New-HTMLPanel {
                New-HTMLSection -HeaderText 'My text' -CanCollapse {
                    New-HTMLTable -Simplify -DataTable $DomainAdminTable
                }
            }
            New-HTMLPanel {
                New-HTMLSection -HeaderText 'My text' -CanCollapse {
                    New-HTMLTable -Simplify -DataTable $DomainAdminTable
                }
            }
            New-HTMLSection -HeaderText 'My text 2' -CanCollapse {
                New-HTMLTable -DataTable $EnterpriseAdminTable
            }
        }
        New-HTMLSection -HeaderText 'This shows PowerShell Language' {
            Get-HTMLCodeBlock -Code $CodeBlock -Style 'PowerShell'
        }
    }
    New-HTMLTab -TabName 'Other' -TabHeading 'Test 2' {
        New-HTMLSection -HeaderText 'My other text' {
            New-HTMLTable -Simplify -DataTable $EnterpriseAdminTable
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


New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example9.html -ShowHTML {
    New-HTMLLogo

    New-HTMLSection -HeaderText '0 section' -BackgroundColor SkyBlue {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLPanel {
            $Processes = Get-Process | Select-Object -First 5
            New-HTMLTable -DataTable $Processes -HideFooter
        }
    }
    New-HTMLSection -HeaderText '-1 section' -CanCollapse {
        New-HTMLPanel {
            New-HTMLChart -Title 'Product Trends by Month' -TitleAlignment left {
                New-ChartCategory -Name '2015', '2016', '2017'
                New-ChartLine -Name 'People count' -Value @(400, 430, 448) -Color Blue
                New-ChartLine -Name 'People Death' -Value @(450, 0, 200) -Color Green
            }

            New-HTMLChart -Title 'Product Trends by Month' {
                New-ChartBarOptions -Vertical
                New-ChartLegend -Name 'Poland', 'Europe', 'Germany'
                New-ChartBar -Name 'People count in  2019' -Value @(400, 430, 448)
            }

        }
        New-HTMLPanel {
            $GroupedBar = @( 400, 430, 448 )
            $GroupedBar1 = @( 420, 450, 448 )

            New-HTMLChart -Title 'Product Trends by Month' {
                New-ChartBarOptions -DataLabelsColor GreenYellow
                New-ChartLegend -Name 'Poland', 'Europe', 'Germany'
                New-ChartBar -Name 'People count in  2019' -Value $GroupedBar
                New-ChartBar -Name 'People count in 2018' -Value $GroupedBar1
            }
        }
        New-HTMLPanel {
            $Data = 10, 41, 35, 51, 49, 62, 69, 91, 148
            $DataCategories = 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
            New-HTMLChart -Title 'Product Trends by Month' -TitleAlignment left {
                New-ChartCategory -Name $DataCategories
                New-ChartLine -Name "Desktops" -Value $Data -Color Blue
            }
        }
        New-HTMLPanel {
            $Data1 = 44, 55, 57, 56, 61, 58, 63, 60, 66
            $Data2 = 76, 85, 101, 98, 87, 105, 91, 114, 94
            $Data3 = 35, 41, 36, 26, 45, 48, 52, 53, 41
            $DataName = "Net Profit", "Revenue", "Free Cash Flow"
            $DataCategories = "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct"

            New-HTMLChart -Title 'Product Trends by Month' {
                New-ChartBarOptions -Vertical -DataLabelsColor GreenYellow
                New-ChartLegend -Name $DataCategories
                New-ChartBar -Name $DataName[0] -Value $Data1
                New-ChartBar -Name $DataName[1] -Value $Data2
                New-ChartBar -Name $DataName[2] -Value $Data3
            }
        }
    }
    New-HTMLSection -HeaderText 'Section 3rd with 3 columns' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLChart -Title 'Product Trends by Month' -TitleAlignment left {
                New-ChartCategory -Name '2015', '2016', '2017'
                New-ChartLine -Name 'People count' -Value @(400, 430, 448) -Color Blue
                New-ChartLine -Name 'People Death' -Value @(450, 0, 200) -Color Green
            }
        }
    }
    New-HTMLSection -HeaderText 'Another conteent' -CanCollapse {
        New-HTMLPanel {
            New-HTMLCodeBlock -Code $CodeBlockJS -Style 'JavaScript' -Theme enlighter -Highlight '2, 5'
        }
        New-HTMLPanel {
            New-HTMLCodeBlock -Code $CodeBlock -Style 'PowerShell' -Theme enlighter -Highlight '2, 5'
        }
    }
}