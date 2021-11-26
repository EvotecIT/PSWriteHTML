Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My charts' -Online -FilePath $PSScriptRoot\Example-ChartRadial.html {
    New-HTMLTabStyle -SlimTabs
    New-HTMLTab -Name 'Radial Charts' -IconRegular chart-bar {
        New-HTMLSection -HeaderText 'Radial Charts - Different features' -CanCollapse {
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartTheme -Palette palette5
                    New-ChartRadialOptions -CircleType FullCircleBottom
                    New-ChartRadial -Name 'Test 1' -Value 20
                    New-ChartRadial -Name 'Test 2' -Value 50
                    New-ChartRadial -Name 'Test 3' -Value 50
                    New-ChartRadial -Name 'Test 4' -Value 50
                    New-ChartRadial -Name 'Test 5' -Value 50
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
                    New-ChartRadial -Name 'All Users' -Value 20
                    New-ChartRadial -Name 'All Computers' -Value 50 
                }
            }
        }
    }
    New-HTMLTab -Name 'Radial Charts 2' {
        New-HTMLSection -Invisible {
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartLegend -Floating -FontSize 16px -LegendPosition left -OffsetX 160 -OffsetY 15 -UseSeriesColors
                    New-ChartRadialOptions -StartAngle 0 -EndAngle 270
                    New-ChartRadial -Name 'Vimeo' -Value 76 -Color '#1ab7ea'
                    New-ChartRadial -Name 'Messenger' -Value 67 -Color '#0084ff'
                    New-ChartRadial -Name 'Facebook' -Value 61 -Color '#39539E'
                    New-ChartRadial -Name 'LinkedIn' -Value 90 -Color '#0077B5'
                }
            }
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartLegend -Floating -FontSize 16px -LegendPosition left -OffsetX 160 -OffsetY 15
                    New-ChartTheme -Palette palette1
                    New-ChartRadialOptions -StartAngle 0 -EndAngle 270
                    New-ChartRadial -Name 'Vimeo' -Value 76
                    New-ChartRadial -Name 'Messenger' -Value 67
                    New-ChartRadial -Name 'Facebook' -Value 61
                    New-ChartRadial -Name 'LinkedIn' -Value 90
                }
            }
        }
        New-HTMLSection -Invisible {
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartLegend -Floating -FontSize 16px -LegendPosition left
                    New-ChartRadialOptions -CircleType SemiCircleGauge
                    New-ChartRadial -Name 'Vimeo' -Value 76 -Color '#1ab7ea'
                    New-ChartRadial -Name 'Messenger' -Value 67 -Color '#0084ff'
                    New-ChartRadial -Name 'Facebook' -Value 61 -Color '#39539E'
                    New-ChartRadial -Name 'LinkedIn' -Value 90 -Color '#0077B5'
                }
            }
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartLegend -LegendPosition bottom
                    New-ChartTheme -Palette palette1
                    New-ChartRadialOptions -CircleType Speedometer
                    New-ChartRadial -Name 'Vimeo' -Value 76
                    New-ChartRadial -Name 'Messenger' -Value 67
                    New-ChartRadial -Name 'Facebook' -Value 61
                    New-ChartRadial -Name 'LinkedIn' -Value 90
                }
            }
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartLegend -LegendPosition bottom
                    New-ChartTheme -Mode dark
                    New-ChartRadialOptions -CircleType Speedometer
                    New-ChartRadial -Name 'Vimeo' -Value 76
                    New-ChartRadial -Name 'Messenger' -Value 67
                    New-ChartRadial -Name 'Facebook' -Value 61
                    New-ChartRadial -Name 'LinkedIn' -Value 90
                }
            }
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartLegend -LegendPosition bottom
                    New-ChartTheme -Monochrome
                    New-ChartRadialOptions -CircleType SemiCircleGauge
                    New-ChartRadial -Name 'Vimeo' -Value 76
                    New-ChartRadial -Name 'Messenger' -Value 67
                    New-ChartRadial -Name 'Facebook' -Value 61
                    New-ChartRadial -Name 'LinkedIn' -Value 90
                }
            }
        }
        New-HTMLSection -Invisible {
            New-HTMLPanel {
                New-HTMLChart {
                    #New-ChartLegend -Floating -FontSize 16px -LegendPosition left -
                    #New-ChartRadialOptions -CircleType SemiCircleGauge
                    New-ChartRadial -Name 'Vimeo' -Value 76 -Color '#1ab7ea'
                    New-ChartRadial -Name 'Messenger' -Value 67 -Color '#0084ff'
                    New-ChartRadial -Name 'Facebook' -Value 61 -Color '#39539E'
                    New-ChartRadial -Name 'LinkedIn' -Value 90 -Color '#0077B5'
                }
            }
        }
    }
} -ShowHTML