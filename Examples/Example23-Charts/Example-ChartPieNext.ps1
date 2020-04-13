Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My charts' -Online -FilePath $PSScriptRoot\Example-ChartPieNext.html {
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Pie Charts - Defaults' -CanCollapse {
            New-HTMLPanel {
                New-HTMLChart -Gradient {
                    New-ChartPie -Name 'Test' -Value 20
                    New-ChartPie -Name 'Test1' -Value 30
                    New-ChartPie -Name 'Test2' -Value 40
                    New-ChartPie -Name 'Test1' -Value 30
                    New-ChartPie -Name 'Test2' -Value 40
                }
            }
        }
        New-HTMLSection -HeaderText 'Pie Charts - Monochromatic with Color Green' -CanCollapse {
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartTheme -Monochrome -Color Green
                    New-ChartPie -Name 'Test' -Value 20
                    New-ChartPie -Name 'Test1' -Value 30
                    New-ChartPie -Name 'Test2' -Value 40
                    New-ChartPie -Name 'Test1' -Value 30
                    New-ChartPie -Name 'Test2' -Value 40
                }
            }
        }
        New-HTMLSection -HeaderText 'Donut Charts - Defaults' -CanCollapse {
            New-HTMLPanel {
                New-HTMLChart -Gradient {
                    New-ChartDonut -Name 'Test' -Value 20
                    New-ChartDonut -Name 'Test1' -Value 30
                    New-ChartDonut -Name 'Test2' -Value 40
                    New-ChartDonut -Name 'Test1' -Value 30
                    New-ChartDonut -Name 'Test2' -Value 40
                }
            }
        }
        New-HTMLSection -HeaderText 'Pie Charts - Diff colors' -CanCollapse {
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartPie -Name 'Test' -Value 20 -Color Red
                    New-ChartPie -Name 'Test1' -Value 30 -Color Red
                    New-ChartPie -Name 'Test2' -Value 40 -Color DarkGrey
                    New-ChartPie -Name 'Test1' -Value 30 -Color LimeGreen
                    New-ChartPie -Name 'Test2' -Value 40 -Color MediumVioletRed
                }
            }
        }
    }
} -ShowHTML