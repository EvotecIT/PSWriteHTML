Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My charts' -Online -FilePath $PSScriptRoot\Example-ChartSpark.html {
    New-HTMLTabOptions -SlimTabs
    New-HTMLPanelOption -BorderRadius 0px
    New-HTMLSectionOption -BorderRadius 0px
    New-HTMLTab -Name 'Sparklines Charts' -IconRegular chart-bar {
        New-HTMLSection -HeaderText 'Sparklines - Defaults' {
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartSpark -Name 'Test1' -Value 12, 14, 2, 47, 42, 15, 47, 75, 65, 19, 14 -Color Red
                    New-ChartSpark -Name 'Test2' -Value 15, 19, 20, 20, 11, 13, 70, 30, 45, 20, 18 -Color Yellow
                }
            }
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartSpark -Name 'Test1' -Value 12, 14, 2, 47, 42, 15, 47, 75, 65, 19, 14
                }
            }
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartSpark -Name 'Test1' -Value 12, 14, 2, 47, 42, 15, 47, 75, 65, 19, 14
                }
            }
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartSpark -Name 'Test1' -Value 12, 14, 2, 47, 42, 15, 47, 75, 65, 19, 14
                }
            }
        }
    }
} -ShowHTML