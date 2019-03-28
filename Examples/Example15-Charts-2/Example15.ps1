Import-Module .\PSWriteHTML.psd1 -Force

$DynamicHTML = New-HTML -TitleText 'My title' -UseCssLinks:$true -UseJavaScriptLinks:$true {
    New-HTMLContent -HeaderText '-1 section' -CanCollapse {
        New-HTMLPanel {
            # Standard Chart Bar
            New-HTMLChart -Data @(400, 430, 448) -DataNames 'People count' -DataCategories 'Poland', 'Europe', 'Germany'
            New-HTMLChart -Data @(400, 430, 448), @(450, 0, 200) -DataNames 'People count', 'People death' -DataCategories '2015', '2016', '2017' -Type 'line' -LineColor 'Blue', 'Green'
            # New-HTMLChart -Data @(400, 430, 448) -DataCategories 'Poland', 'Europe', 'Germany' -Type 'column'
        }
    }
    New-HTMLContent -HeaderText '-1 section' -CanCollapse {
        New-HTMLPanel {
            New-HTMLChartRadial
        }
        New-HTMLPanel {
            $Value1 = @(7, 45, 54, 38, 56, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46)
            New-HTMLChartSpark -Data $Value1 -TitleText '$1500,43' -SubTitleText 'Money in the bank' -Color DarkSalmon
        }
        New-HTMLPanel {
            $Value1 = 7, 45, 54, 38, 56, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46
            New-HTMLChartSpark -Data $Value1 -TitleText '$1500,43' -SubTitleText 'Sales in January'
        }
        New-HTMLPanel {
            $Value1 = @(7, 45, 54, 38, 56, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46)
            $Value2 = @(47, 5, 4, 8, 56, 24, 5, 31, 7, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46)
            New-HTMLChartSpark -Data $Value1, $Value2
        }
    }
    New-HTMLContent -HeaderText '-1 section' -CanCollapse {
        New-HTMLPanel {
            $GroupedBar = @()
            $GroupedBar += 400, 430, 448
            $GroupedBar1 = @()
            $GroupedBar1 += 420, 450, 448
            New-HTMLChart -Data $GroupedBar, $GroupedBar1 -DataNames 'People count in  2019', 'People count in 2018' -DataCategories 'Poland', 'Europe', 'Germany'
        }
        New-HTMLPanel {
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
        New-HTMLPanel {
            $Data1 = 44, 55, 57, 56, 61, 58, 63, 60, 66
            $Data2 = 76, 85, 101, 98, 87, 105, 91, 114, 94
            $Data3 = 35, 41, 36, 26, 45, 48, 52, 53, 41
            $DataName = "Net Profit", "Revenue", "Free Cash Flow"
            $DataCategories = "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct"
            New-HTMLChart -Data $Data1, $Data2, $Data3 -DataNames $DataName -DataCategories $DataCategories -Horizontal $false
        }
    }
    New-HTMLContent -HeaderText 'Section 3rd with 3 columns' {
        New-HTMLPanel {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLChart -Data @(400, 430, 448), @(450, 0, 200) -DataNames 'People count', 'People death' -DataCategories '2015', '2016', '2017' -Type 'line' -LineColor 'Blue', 'Green'
        }
        New-HTMLPanel {
            New-HTMLChart -Data @(400, 430, 448) -DataCategories 'Poland', 'Europe', 'Germany' -Type 'donut'
        }
    }
}

[string] $DynamicHTMLPath = Save-HTML -HTML $DynamicHTML -FilePath $PSScriptRoot\Example15.html