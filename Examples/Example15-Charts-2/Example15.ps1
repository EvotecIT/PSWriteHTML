Import-Module .\PSWriteHTML.psd1 -Force

$DynamicHTML = New-HTML -TitleText 'My title' -UseCssLinks:$true -UseJavaScriptLinks:$true {
    <#
    New-HTMLContent -HeaderText 'Bar Charts' -CanCollapse {
        New-HTMLPanel {
            $Data1 = 400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380
            $DataNames1 = 'South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan', 'United States', 'China', 'Germany'
            New-HTMLChartBar -Data $Data1 -DataNames $DataNames1 -DataLegend 'Numer of bottles'
        }
        New-HTMLPanel {
            $Data1 = 44, 55, 41, 64, 22, 43, 21
            $Data2 = 53, 32, 33, 52, 13, 44, 32
            $DataNames1 = 2001, 2002, 2003, 2004, 2005, 2006, 2007
            New-HTMLChartBar -Data $Data1, $Data2 -DataNames $DataNames1 -DataLegend 'Born', 'Died'
        }
    }
    New-HTMLContent -HeaderText 'Bar Charts 1' -CanCollapse {
        New-HTMLPanel {
            $Data1 = 400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380
            $Data2 = 44, 55, 41, 64, 22, 43, 21
            $Data3 = 53, 32, 33, 52, 13, 44, 32
            $DataNames1 = 'South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan', 'United States', 'China', 'Germany'
            New-HTMLChartBar -Data $Data1, $Data2, $Data3 -DataNames $DataNames1 -Type barStacked -DataLegend 'People', 'Pets', 'Furniture'
        }
        New-HTMLPanel {
            $Data1 = 44, 55, 41, 64, 22, 43, 21
            $Data2 = 53, 32, 33, 52, 13, 44, 32
            $DataNames1 = 2001, 2002, 2003, 2004, 2005, 2006, 2007
            New-HTMLChartBar -Data $Data1, $Data2 -DataNames $DataNames1 -Type barStacked -DataLegend 'People', 'Pets'
        }
    }
    New-HTMLContent -HeaderText 'Bar Charts 2' -CanCollapse {
        New-HTMLPanel {
            $Data1 = 400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380
            $Data2 = 44, 55, 41, 64, 22, 43, 21
            $Data3 = 53, 32, 33, 52, 13, 44, 32
            $DataNames1 = 'South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan', 'United States', 'China', 'Germany'
            New-HTMLChartBar -Data $Data1, $Data2, $Data3 -DataNames $DataNames1 -Type barStacked -DataLegend 'People', 'Pets', 'Furniture'
        }
        New-HTMLPanel {
            $Data1 = 44, 55, 41, 64, 22, 43, 21
            $Data2 = 53, 32, 33, 52, 13, 44, 32
            $DataNames1 = 2001, 2002, 2003, 2004, 2005, 2006, 2007
            New-HTMLChartBar -Data $Data1, $Data2 -DataNames $DataNames1 -Type barStacked -DataLegend 'People', 'Pets' -Title 'Pets vs People' -TitleAlignment center
        }
    }
    New-HTMLContent -HeaderText 'Bar Charts 3' -CanCollapse {
        New-HTMLPanel {
            $Data1 = 44, 55, 41, 37, 22, 43, 21
            $Data2 = 53, 32, 33, 52, 13, 43, 32
            $Data3 = 12, 17, 11, 9, 15, 11, 20
            $Data4 = 9, 7, 5, 8, 6, 9, 4
            $Data5 = 25, 12, 19, 32, 25, 24, 10

            $DataLegend = 'Marine Sprite', 'Striking Calf', 'Tank Picture', 'Tank Picture', 'Bucket Slope', 'Reborn Kid', 'Other'

            $DataNames1 = 2008, 2009, 2010, 2011, 2012, 2013, 2014
            New-HTMLChartBar -Data $Data1, $Data2, $Data3, $Data4, $Data5 -DataNames $DataNames1 -Type barStacked100Percent -DataLegend $DataLegend -Title 'Finctional Books Sales' -LegendPosition top #-Formatter 'K'
        }
        New-HTMLPanel {
            $Data1 = 44, 55, 41, 64, 22, 43, 21
            $Data2 = 53, 32, 33, 52, 13, 44, 32
            $DataNames1 = 2001, 2002, 2003, 2004, 2005, 2006, 2007
            New-HTMLChartBar -Data $Data1, $Data2 -DataNames $DataNames1 -Type barStacked100Percent -DataLegend 'People', 'Pets' -Title 'Pets vs People' -TitleAlignment center -LegendPosition top
        }
    }
    New-HTMLContent -HeaderText 'Bar Charts 4' -CanCollapse {
        New-HTMLPanel {
            $Data1 = 44, 55, 41, 37, 22, 43, 21
            $Data2 = 53, 32, 33, 52, 13, 43, 32
            $Data3 = 12, 17, 11, 9, 15, 11, 20
            $Data4 = 9, 7, 5, 8, 6, 9, 4
            $Data5 = 25, 12, 19, 32, 25, 24, 10

            $DataLegend = 'Marine Sprite', 'Striking Calf', 'Tank Picture', 'Tank Picture', 'Bucket Slope', 'Reborn Kid', 'Other'

            $DataNames1 = 2008, 2009, 2010, 2011, 2012, 2013, 2014
            New-HTMLChartBar -Data $Data1, $Data2, $Data3, $Data4, $Data5 -DataNames $DataNames1 -Type barStacked100Percent -DataLegend $DataLegend -Title 'Finctional Books Sales' -LegendPosition top #-Formatter 'K'
        }
        New-HTMLPanel {
            $Data1 = 44, 55, 41, 64, 22, 43, 21
            $Data2 = 53, 32, 33, 52, 13, 44, 32
            $DataNames1 = 2001, 2002, 2003, 2004, 2005, 2006, 2007
            New-HTMLChartBar -Data $Data1, $Data2 -DataNames $DataNames1 -Type barStacked100Percent -DataLegend 'People', 'Pets' -Title 'Pets vs People' -TitleAlignment center -LegendPosition top
        }
    }
    #>
    New-HTMLContent -HeaderText 'Bar Charts 5' -CanCollapse {
        New-HTMLPanel {
            $Data1 = -0.8, -1.05, -1.06, -1.18, -1.4, -2.2, -2.85, -3.7, -3.96, -4.22, -4.3, -4.4, -4.1, -4, -4.1, -3.4, -3.1, -2.8
            $Data2 = 0.4, 0.65, 0.76, 0.88, 1.5, 2.1, 2.9, 3.8, 3.9, 4.2, 4, 4.3, 4.1, 4.2, 4.5, 3.9, 3.5, 3

            $DataLegend = 'Males', 'Females'
            $DataNames = '85+', '80-84', '75-79', '70-74', '65-69', '60-64', '55-59', '50-54', '45-49', '40-44', '35-39', '30-34', '25-29', '20-24', '15-19', '10-14', '5-9', '0-4'
            New-HTMLChartBar -Data $Data1, $Data2 -DataNames $DataNames -DataLegend $DataLegend -Type barStacked -Title 'Mauritius population pyramid 2011' -DataLabelsEnabled $true -Height 500
        }
        New-HTMLPanel {
            $Data1 = -0.8, -1.05, -1.06, -1.18, -1.4, -2.2, -2.85, -3.7, -3.96, -4.22, -4.3, -4.4, -4.1, -4, -4.1, -3.4, -3.1, -2.8
            $Data2 = 0.4, 0.65, 0.76, 0.88, 1.5, 2.1, 2.9, 3.8, 3.9, 4.2, 4, 4.3, 4.1, 4.2, 4.5, 3.9, 3.5, 3

            $DataLegend = 'Males', 'Females'
            $DataNames = '85+', '80-84', '75-79', '70-74', '65-69', '60-64', '55-59', '50-54', '45-49', '40-44', '35-39', '30-34', '25-29', '20-24', '15-19', '10-14', '5-9', '0-4'
            New-HTMLChartBar -Data $Data1, $Data2 -DataNames $DataNames -DataLegend $DataLegend -Type barStacked -Title 'Mauritius population pyramid 2011' -DataLabelsEnabled $false -Height 500
        }
        New-HTMLPanel {
            $Data1 = -0.8, -1.05, -1.06, -1.18, -1.4, -2.2, -2.85, -3.7, -3.96, -4.22, -4.3, -4.4, -4.1, -4, -4.1, -3.4, -3.1, -2.8
            $Data2 = 0.4, 0.65, 0.76, 0.88, 1.5, 2.1, 2.9, 3.8, 3.9, 4.2, 4, 4.3, 4.1, 4.2, 4.5, 3.9, 3.5, 3

            $DataLegend = 'Males', 'Females'
            $DataNames = '85+', '80-84', '75-79', '70-74', '65-69', '60-64', '55-59', '50-54', '45-49', '40-44', '35-39', '30-34', '25-29', '20-24', '15-19', '10-14', '5-9', '0-4'
            New-HTMLChartBar -Data $Data1, $Data2 -DataNames $DataNames -DataLegend $DataLegend -Type barStacked -Title 'Mauritius population pyramid 2011' -DataLabelsEnabled $false -Height 500 -Colors IndianRed, LawnGreen
        }
    }


    <#
    New-HTMLContent -HeaderText 'Radline Charts' -CanCollapse {
        New-HTMLPanel {
            New-HTMLChartRadial -Names 'My data' -Values 95 -Type 1 -CircleType FullCircleTop
        }
        New-HTMLPanel {
            New-HTMLChartRadial -Names 'My data' -Values 95 -Type 2 -CircleType FullCircleBottomLeft
        }
        New-HTMLPanel {
            New-HTMLChartRadial -Names 'My data', 'Ole', 'Bole' -Values 95, 30, 11 -Type 2 -CircleType FullCircleBottomLeft
        }
        New-HTMLPanel {
            New-HTMLChartRadial -Names 'My data', 'My other' -Values 100, 20 -Type 1 -CircleType FullCircleBottom
        }
        New-HTMLPanel {
            New-HTMLChartRadial -Names 'My data' -Values 95 -Type 2 -CircleType Speedometer
        }
    }
    New-HTMLContent -HeaderText 'Radline Charts 1' -CanCollapse {
        New-HTMLPanel {
            New-HTMLChartRadial -Names 'My data', 'My other' -Values 100, 20 -Type 2 -CircleType FullCircleLeft -LabelAverage 'Test'
        }
        New-HTMLPanel {
            New-HTMLChartRadial -Names 'My data', 'My other' -Values 100, 20 -Type 2 -CircleType SemiCircleGauge -LabelAverage 'Test'
        }
        New-HTMLPanel {
            New-HTMLChartRadial -Names 'My data' -Values 20 -Type 1 -CircleType SemiCircleGauge -LabelAverage 'Test' -Verbose
        }
    }
    New-HTMLContent -HeaderText 'Sparkline Charts' -CanCollapse {
        New-HTMLPanel {
            $Value1 = @(7, 45, 54, 38, 56, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46)
            New-HTMLChartSpark -Data $Value1 -TitleText '$1500,43' -SubTitleText 'Money in the bank' -Color DarkSalmon
        }
        New-HTMLPanel {
            $Value1 = 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46, 47, 5, 4, 8, 56, 24, 5, 31, 7
            New-HTMLChartSpark -Data $Value1 -TitleText '$1500,43' -SubTitleText 'Sales in January'
        }
        New-HTMLPanel {
            $Value1 = @(7, 45, 54, 38, 56, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46)
            $Value2 = @(39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46, 47, 5, 4, 8, 56, 24, 5, 31, 7)
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
        New-HTMLContent -HeaderText '-1 section' -CanCollapse {
        New-HTMLPanel {
            # Standard Chart Bar
            New-HTMLChart -Data @(400, 430, 448) -DataNames 'People count' -DataCategories 'Poland', 'Europe', 'Germany'
            New-HTMLChart -Data @(400, 430, 448), @(450, 0, 200) -DataNames 'People count', 'People death' -DataCategories '2015', '2016', '2017' -Type 'line' -LineColor 'Blue', 'Green'
            # New-HTMLChart -Data @(400, 430, 448) -DataCategories 'Poland', 'Europe', 'Germany' -Type 'column'
        }
    }
    #>
}

[string] $DynamicHTMLPath = Save-HTML -HTML $DynamicHTML -FilePath $PSScriptRoot\Example15.html