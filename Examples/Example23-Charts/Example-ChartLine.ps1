Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'Charts - Line' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example-ChartsLine.html {
    New-HTMLTabOptions -SlimTabs
    New-HTMLTab -Name 'Line Charts' -IconRegular hourglass {
        New-HTMLSection -HeaderText 'Line Charts - Test' -CanCollapse {
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartLegend -Name 'Time'
                    New-ChartLine -Name 'Test' -Value 1,15,20,30,50
                    New-ChartLine -Name 'Test1' -Value 2,15,20,30,50
                    New-ChartLine -Name 'Test2' -Value 3,15,20,30,50
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