Import-Module .\PSWriteHTML.psd1 -Force

Dashboard -Name 'Charts - Line' -FilePath $PSScriptRoot\Output\DashboardChartsLine.html {
    TabOptions -SlimTabs
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
} -Show