Import-Module .\PSWriteHTML.psd1 -Force

$Process = Get-Process | Select-Object -First 30

Dashboard -Name 'Dashimo Test' -FilePath $PSScriptRoot\Output\DashboardEasy10.html -Show {
    TabOptions -SlimTabs -SelectorColor AntiqueWhite -Transition -LinearGradient -SelectorColorTarget DodgerBlue
    Tab -Name 'Test 0' -IconSolid user-alt -IconColor Green {
        Table -DataTable $Process -HideFooter {
            TableButtonExcel
            TableButtonPageLength
            TableConditionalFormatting -Name 'ID' -ComparisonType number -Operator gt -Value 10000 -Color BlueViolet -Row
            TableConditionalFormatting -Name 'Name' -ComparisonType string -Operator eq -Value 'chrome' -Color White -BackgroundColor Crimson -Row
            TableConditionalFormatting -Name 'PriorityClass' -ComparisonType string -Operator eq -Value 'Idle' -Color White -BackgroundColor Green
        }
    }
    Tab -Name 'Test 1' -IconBrands amazon {
        Section -Name 'Test' -Collapsable {
            Table -DataTable $Process -HideFooter {
                TableConditionalFormatting -Name 'ID' -ComparisonType number -Operator gt -Value 10000 -Color BlueViolet -Row
                TableConditionalFormatting -Name 'Name' -ComparisonType string -Operator eq -Value 'chrome' -Color White -BackgroundColor Crimson -Row
                TableConditionalFormatting -Name 'PriorityClass' -ComparisonType string -Operator eq -Value 'Idle' -Color White -BackgroundColor Green
            }
        }
    }
    Tab -Name 'Test 2' -IconRegular clone -TextColor Gold -IconColor MediumPurple {
        Section -Name 'Test' -Collapsable {
            Table -DataTable $Process -HideFooter {
                TableConditionalFormatting -Name 'ID' -ComparisonType number -Operator gt -Value 10000 -Color BlueViolet -Row
                TableConditionalFormatting -Name 'Name' -ComparisonType string -Operator eq -Value 'chrome' -Color White -BackgroundColor Crimson -Row
                TableConditionalFormatting -Name 'PriorityClass' -ComparisonType string -Operator eq -Value 'Idle' -Color White -BackgroundColor Green
            }
        }
    }
    Tab -Name 'Line Charts' -IconRegular hourglass {
        Section -Name 'Line Charts - Test' -Collapsable {
            Panel {
                Chart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
                    ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
                    ChartLine -Name 'Incidents per month' -Value 10, 41, 35, 51, 49, 62, 69, 91, 148
                    ChartLine -Name 'Incidents per month resolved' -Value 5, 10, 20, 31, 49, 62, 69, 91, 148
                }
            }
            Panel {
                Chart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
                    ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
                    ChartLine -Name 'Incidents per month' -Value 10, 41, 35, 51, 49, 62, 69, 91, 148 -Color Red -Cap square -Dash 5
                    ChartLine -Name 'Incidents per month resolved' -Value 5, 10, 20, 31, 49, 62, 69, 91, 148 -Color Green -Curve stepline -Width 10
                }
            }

        }
        Section -Name 'Line Charts - Test' -Collapsable {
            Panel {
                Chart -Title 'Product Trends by Month' -TitleAlignment center {
                    ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
                    ChartLine -Name 'Desktop' -Value 10, 41, 35, 51, 49, 62, 69, 91, 148
                }
            }
            Panel {
                Chart -Title 'Average High & Low Temperature' -TitleAlignment left {
                    ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'
                    ChartLine -Name "High - 2013" -Value 28, 29, 33, 36, 32, 32, 33 #-Color Red -Cap square -Dash 5
                    ChartLine -Name  "Low - 2013" -Value 12, 11, 14, 18, 17, 13, 13 #-Color Green -Curve stepline -Width 10
                }
            }

        }
        Section -Name 'Line Charts - Test' -Collapsable {
            Panel {
                Chart -Title 'Product Trends by Month' -TitleAlignment center {
                    ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
                    ChartLine -Name 'Desktop' -Value 10, 41, 35, 51, 49, 62, 69, 91, 148
                }
            }
            Panel {
                Chart -Title 'Average High & Low Temperature' -TitleAlignment left {
                    ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'
                    ChartLine -Name "High - 2013" -Value 28, 29, 33, 36, 32, 32, 33 -Color Red -Cap square -Dash 5
                    ChartLine -Name  "Low - 2013" -Value 12, 11, 14, 18, 17, 13, 13 -Color BlueViolet

                }
            }

        }
        Section -Name 'Line Charts - Test' -Collapsable {
            Panel {
                Chart -Title 'Product Trends by Month' -TitleAlignment center {
                    ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
                    ChartLine -Name 'Desktop' -Value 10, 41, 35, 51, 49, 62, 69, 91, 148 -Curve stepline -Width 10
                }
            }
            Panel {
                Chart -Title 'Average High & Low Temperature' -TitleAlignment left {
                    # This controls how the grid looks like
                    ChartGrid -Show -Position front -xAxisLinesShow -StrokeDash 5 -RowColors Aquamarine, DarkCyan
                    # This is category (responsible for values on axis X)
                    ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul' -TitleText 'Month'
                    ChartAxisY -TitleText 'Temperature' -Show -ShowAlways
                    # Data and control of data
                    ChartLine -Name "High - 2013" -Value 28, 29, 33, 36, 32, 32, 33 -Curve smooth #-Color Red -Cap square -Dash 5
                    ChartLine -Name  "Low - 2013" -Value 12, 11, 14, 18, 17, 13, 13 -Curve smooth #-Color Green -Curve stepline -Width 10

                }
            }

        }
    }
} -Online