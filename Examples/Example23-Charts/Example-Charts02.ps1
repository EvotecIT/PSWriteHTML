
Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My title' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example23_02.html {
    New-HTMLTabOptions -SlimTabs
    New-HTMLTab -Name 'Bar Charts' -IconRegular chart-bar {
        New-HTMLSection -HeaderText 'Bar Charts 1 - Bar Stacked' -CanCollapse {
            New-HTMLPanel {
                $Data1 = 400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380
                $Data2 = 44, 55, 41, 64, 22, 43, 21
                $Data3 = 53, 32, 33, 52, 13, 44, 32
                $DataNames1 = 'South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan', 'United States', 'China', 'Germany'

                New-HTMLChart -Type 'Bar' {
                    New-ChartBarOptions -Type barStacked
                    New-ChartLegend -Name 'People', 'Pets', 'Furniture'
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        New-ChartBar -Name $DataNames1[$i] -Value $Data1[$i], $Data2[$i], $Data3[$i]
                    }
                }
            }
        }
        New-HTMLSection -HeaderText 'Bar Charts 1 - Bar Stacked 2' -CanCollapse {
            New-HTMLPanel {
                $Data1 = 400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380
                $Data2 = 44, 55, 41, 64, 22, 43, 21
                $Data3 = 53, 32, 33, 52, 13, 44, 32
                $DataNames1 = 'South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan', 'United States', 'China', 'Germany'
                New-HTMLChartBar -Data $Data1, $Data2, $Data3 -DataNames $DataNames1 -Type barStacked -DataLegend 'People', 'Pets', 'Furniture'
            }
        }
    }
} -ShowHTML




