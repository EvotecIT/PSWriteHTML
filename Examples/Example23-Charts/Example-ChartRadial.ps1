Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My charts' -Online -FilePath $PSScriptRoot\Example-ChartRadial.html {
    New-HTMLTabOption -SlimTabs
    New-HTMLTab -Name 'Radial Charts' -IconRegular chart-bar {
        New-HTMLSection -HeaderText 'Radial Charts - Different features' -CanCollapse {
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartTheme -Palette palette5
                    New-ChartRadial -Name 'Test' -Value 20
                    New-ChartRadial -Name 'Test' -Value 50
                    New-ChartRadial -Name 'Test' -Value 50
                    New-ChartRadial -Name 'Test' -Value 50
                    New-ChartRadial -Name 'Test' -Value 50
                }
            }
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartRadial -Name 'Test1' -Value 20 -Color Gray
                    New-ChartRadial -Name 'Test2' -Value 50 -Color DarkMagenta
                    New-ChartRadial -Name 'Test3' -Value 50 -Color Red
                    New-ChartRadial -Name 'Test4' -Value 50 -Color GreenYellow
                    New-ChartRadial -Name 'Test5' -Value 50 -Color LightCyan
                }
            }
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartRadial -Name 'Test' -Value 20
                    New-ChartRadial -Name 'Test' -Value 50
                    New-ChartRadial -Name 'Test' -Value 50
                    New-ChartRadial -Name 'Test' -Value 50
                    New-ChartRadial -Name 'Test' -Value 50
                }
            }
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartTheme -Monochrome
                    New-ChartRadial -Name 'Test1' -Value 20
                    New-ChartRadial -Name 'Test2' -Value 50
                    New-ChartRadial -Name 'Test3' -Value 50
                    New-ChartRadial -Name 'Test4' -Value 50
                    New-ChartRadial -Name 'Test5' -Value 50
                }
            }
            New-HTMLPanel {
                New-HTMLChart -Gradient {
                    New-ChartTheme -Palette palette5
                    New-ChartRadial -Name 'Test7' -Value 20
                    New-ChartRadial -Name 'Test1' -Value 50
                    New-ChartRadial -Name 'Test2' -Value 40
                }
            }
        }
        New-HTMLSection -HeaderText 'Radial Charts - Defaults' -CanCollapse {
            New-HTMLPanel {
                New-HTMLChart -Gradient {
                    New-ChartTheme -Palette palette5
                    New-ChartRadial -Name 'Test' -Value 20
                    New-ChartRadial -Name 'Test' -Value 50
                    New-ChartRadial -Name 'Test' -Value 40
                }
            }
            New-HTMLPanel {
                New-HTMLChart -Patterned {
                    New-ChartRadial -Name 'Test' -Value 20
                }
            }
        }
    }
} -ShowHTML