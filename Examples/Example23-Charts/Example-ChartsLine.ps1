Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'Charts - Line' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example-ChartsLine.html {
    New-HTMLTabOptions -SlimTabs
    New-HTMLTab -Name 'Line Charts' -IconRegular hourglass {
        New-HTMLSection -HeaderText 'Line Charts - Test' -CanCollapse {
            New-HTMLPanel {
                New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
                    New-ChartCategory -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
                    New-ChartLine -Name 'Incidents per month' -Value 10, 41, 35, 51, 49, 62, 69, 91, 148
                    New-ChartLine -Name 'Incidents per month resolved' -Value 5, 10, 20, 31, 49, 62, 69, 91, 148
                    #New-ChartLine -Name 'Test1' -Value 2
                    #New-ChartLine -Name 'Test2' -Value 3
                }
            }
            New-HTMLPanel {
                New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
                    New-ChartCategory -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
                    New-ChartLine -Name 'Incidents per month' -Value 10, 41, 35, 51, 49, 62, 69, 91, 148 -Color Red
                    New-ChartLine -Name 'Incidents per month resolved' -Value 5, 10, 20, 31, 49, 62, 69, 91, 148 -Color Green
                    #New-ChartLine -Name 'Test1' -Value 2
                    #New-ChartLine -Name 'Test2' -Value 3
                }
            }
            <#
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartLegend -Name 'Time', 'Money', 'Taxes'
                    New-ChartBar -Name 'Test' -Value 1, 2, 3
                    New-ChartBar -Name 'Test1' -Value 2, 5, 7
                    New-ChartBar -Name 'Test2' -Value 3, 1, 2
                }
            }
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartLegend -Name 'Time'
                    for ($i = 0; $i -le 5; $i++) {
                        New-ChartBar -Name "Test $i" -Value $i
                    }
                }
            }
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartBarOptions -Vertical -DataLabelsColor GreenYellow
                    New-ChartLegend -Name 'Time'
                    for ($i = 0; $i -le 5; $i++) {
                        New-ChartBar -Name "Test $i" -Value $i
                    }
                }
            }
            #>
        }
    }
} -Show