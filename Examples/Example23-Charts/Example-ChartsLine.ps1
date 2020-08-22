Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'Charts - Line' -Online -FilePath $PSScriptRoot\Example-ChartsLine.html {
    New-HTMLTabStyle -SlimTabs
    New-HTMLTab -Name 'Line Charts' -IconRegular hourglass {
        New-HTMLSection -HeaderText 'Line Charts - Test' -CanCollapse {
            New-HTMLPanel {
                New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
                    New-ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
                    New-ChartLine -Name 'Incidents per month' -Value 10, 41, 35, 51, 49, 62, 69, 91, 148
                    New-ChartLine -Name 'Incidents per month resolved' -Value 5, 10, 20, 31, 49, 62, 69, 91, 148
                }
            }
            New-HTMLPanel {
                New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
                    New-ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
                    New-ChartLine -Name 'Incidents per month' -Value 10, 41, 35, 51, 49, 62, 69, 91, 148 -Color Red -Cap square -Dash 5
                    New-ChartLine -Name 'Incidents per month resolved' -Value 5, 10, 20, 31, 49, 62, 69, 91, 148 -Color Green -Curve stepline -Width 10
                    #New-ChartLine -Name 'Test1' -Value 2
                    #New-ChartLine -Name 'Test2' -Value 3
                }
            }

        }
        New-HTMLSection -HeaderText 'Line Charts - Test' -CanCollapse {
            New-HTMLPanel {
                New-HTMLChart -Title 'Product Trends by Month' -TitleAlignment center {
                    New-ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
                    New-ChartLine -Name 'Desktop' -Value 10, 41, 35, 51, 49, 62, 69, 91, 148
                }
            }
            New-HTMLPanel {
                New-HTMLChart -Title 'Average High & Low Temperature' -TitleAlignment left {
                    New-ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'
                    New-ChartLine -Name "High - 2013" -Value 28, 29, 33, 36, 32, 32, 33 #-Color Red -Cap square -Dash 5
                    New-ChartLine -Name  "Low - 2013" -Value 12, 11, 14, 18, 17, 13, 13 #-Color Green -Curve stepline -Width 10
                }
            }

        }
        New-HTMLSection -HeaderText 'Line Charts - Test' -CanCollapse {
            New-HTMLPanel {
                New-HTMLChart -Title 'Product Trends by Month' -TitleAlignment center {
                    New-ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
                    New-ChartLine -Name 'Desktop' -Value 10, 41, 35, 51, 49, 62, 69, 91, 148
                }
            }
            New-HTMLPanel {
                New-HTMLChart -Title 'Average High & Low Temperature' -TitleAlignment left {
                    New-ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'
                    New-ChartLine -Name "High - 2013" -Value 28, 29, 33, 36, 32, 32, 33 -Color Red -Cap square -Dash 5
                    New-ChartLine -Name  "Low - 2013" -Value 12, 11, 14, 18, 17, 13, 13 -Color BlueViolet

                }
            }

        }
        New-HTMLSection -HeaderText 'Line Charts - Test' -CanCollapse {
            New-HTMLPanel {
                New-HTMLChart -Title 'Product Trends by Month' -TitleAlignment center {
                    New-ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
                    New-ChartLine -Name 'Desktop' -Value 10, 41, 35, 51, 49, 62, 69, 91, 148 -Curve stepline -Width 10
                }
            }
            New-HTMLPanel {
                New-HTMLChart -Title 'Average High & Low Temperature' -TitleAlignment left {
                    # This controls how the grid looks like
                    New-ChartGrid -Show -Position front -xAxisLinesShow -StrokeDash 5 -RowColors Aquamarine, DarkCyan
                    # This is category (responsible for values on axis X)
                    New-ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul' -TitleText 'Month'
                    New-ChartAxisY -TitleText 'Temperature' -Show -ShowAlways
                    # Data and control of data
                    New-ChartLine -Name "High - 2013" -Value 28, 29, 33, 36, 32, 32, 33 -Curve smooth #-Color Red -Cap square -Dash 5
                    New-ChartLine -Name  "Low - 2013" -Value 12, 11, 14, 18, 17, 13, 13 -Curve smooth #-Color Green -Curve stepline -Width 10

                }
            }

        }
    }
} -Show