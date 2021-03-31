Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example-ChartsBar.html {
    New-HTMLTabStyle -SlimTabs
    New-HTMLTab -Name 'Bar Charts - Bar' -IconRegular chart-bar {
        New-HTMLSection -HeaderText 'Bar Charts - Test' -CanCollapse {
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartBar -Name 'Test' -Value 1
                    New-ChartBar -Name 'Test1' -Value 2
                    New-ChartBar -Name 'Test2' -Value 3
                } -Title 'Testing Title' -TitleAlignment center
            }
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartToolbar -Download
                    New-ChartLegend -Name 'Time', 'Money', 'Taxes' -Color '#024DA1', '#AFD135', Green
                    New-ChartBar -Name 'Test' -Value 1, 2, 3
                    New-ChartBar -Name 'Test1' -Value 2, 5, 7
                    New-ChartBar -Name 'Test2' -Value 3, 1, 2
                } -Title 'Testing Title' -TitleAlignment center
            }
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartToolbar -Download
                    New-ChartBarOptions -Gradient
                    New-ChartLegend -Name 'Time', 'Money', 'Taxes' -LegendPosition bottom -HorizontalAlign right -Color Red, Blue, Yellow -DisableOnItemHoverHighlightDataSeries -DisableOnItemClickToggleDataSeries
                    New-ChartBar -Name 'Test' -Value 1, 2, 3
                    New-ChartBar -Name 'Test1' -Value 2, 5, 7
                    New-ChartBar -Name 'Test2' -Value 3, 1, 2
                } -Title 'Testing Title' -TitleAlignment center
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
        }
        New-HTMLSection -HeaderText 'Bar Charts - Test' -CanCollapse {
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartBarOptions -Distributed
                    New-ChartBar -Name 'Test' -Value 1
                    New-ChartBar -Name 'Test1' -Value 2
                    New-ChartBar -Name 'Test2' -Value 3
                } -Title 'Testing Title' -TitleAlignment center
            }
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartBarOptions -Distributed
                    New-ChartLegend -Name 'Time'
                    for ($i = 0; $i -le 5; $i++) {
                        New-ChartBar -Name "Test $i" -Value $i
                    }
                }
            }
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartBarOptions -Vertical -Distributed
                    New-ChartLegend -Name 'Time'
                    for ($i = 0; $i -le 10; $i++) {
                        New-ChartBar -Name "Test $i" -Value $i
                    }
                }
            }
        }
        New-HTMLSection -HeaderText 'Bar Charts - Test Colors' -CanCollapse {
            New-HTMLPanel -Invisible {
                New-HTMLChart {
                    New-ChartLegend -Name 'Time'
                    New-ChartBar -Name 'Test' -Value 1
                    New-ChartBar -Name 'Test1' -Value 2
                    New-ChartBar -Name 'Test2' -Value 3
                }
            }
            New-HTMLPanel -Invisible {
                New-HTMLChart {
                    New-ChartLegend -Name 'Time', 'Money', 'Taxes'
                    New-ChartBar -Name 'Test' -Value 1, 2, 3
                    New-ChartBar -Name 'Test1' -Value 2, 5, 7
                    New-ChartBar -Name 'Test2' -Value 3, 1, 2
                }
            }
            New-HTMLPanel -Invisible {
                New-HTMLChart {
                    New-ChartLegend -Name 'Time'
                    for ($i = 0; $i -le 5; $i++) {
                        New-ChartBar -Name "Test $i" -Value $i
                    }
                }
            }
            New-HTMLPanel -Invisible {
                New-HTMLChart {
                    New-ChartBarOptions -Vertical -DataLabelsColor GreenYellow -Gradient
                    New-ChartLegend -Name 'Time'
                    for ($i = 0; $i -le 5; $i++) {
                        New-ChartBar -Name "Test $i" -Value $i
                    }
                }
            }
        }
        New-HTMLSection -HeaderText 'Bar Charts - Standard Bar' -CanCollapse {
            New-HTMLPanel {
                $Data1 = 400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380
                $DataNames1 = 'South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan', 'United States', 'China', 'Germany'
                New-HTMLChart {
                    New-ChartLegend -Name 'Number of bottles'
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        New-ChartBar -Name $DataNames1[$i] -Value $Data1[$i]
                    }
                }
            }

            New-HTMLPanel {
                $Data1 = 44, 55, 41, 64, 22, 43, 21
                $Data2 = 53, 32, 33, 52, 13, 44, 32
                $DataNames1 = 2001, 2002, 2003, 2004, 2005, 2006, 2007

                New-HTMLChart -Title 'Born vs Dead' -TitleAlignment center {
                    #New-ChartBarOptions
                    New-ChartLegend -Name 'Born', 'Died'
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        New-ChartBar -Name $DataNames1[$i] -Value $Data1[$i], $Data2[$i]
                    }
                }
            }
        }
        New-HTMLSection -HeaderText 'Bar Charts - Standard Bar Vertical' -CanCollapse {

            New-HTMLPanel {
                $Data1 = 400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380
                $DataNames1 = 'South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan', 'United States', 'China', 'Germany'
                New-HTMLChart {
                    New-ChartBarOptions -Vertical
                    New-ChartLegend -Name 'Number of bottles'
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        New-ChartBar -Name $DataNames1[$i] -Value $Data1[$i]
                    }
                }
            }

            New-HTMLPanel {
                $Data1 = 44, 55, 41, 64, 22, 43, 21
                $Data2 = 53, 32, 33, 52, 13, 44, 32
                $DataNames1 = 2001, 2002, 2003, 2004, 2005, 2006, 2007

                New-HTMLChart -Title 'Born vs Dead' -TitleAlignment center {
                    New-ChartBarOptions -Vertical
                    New-ChartLegend -Name 'Born', 'Died'
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        New-ChartBar -Name $DataNames1[$i] -Value $Data1[$i], $Data2[$i]
                    }
                }
            }
        }
        New-HTMLSection -HeaderText 'Bar Charts - Standard Bar Vertical & Patterned' -CanCollapse {

            New-HTMLPanel {
                $Data1 = 400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380
                $DataNames1 = 'South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan', 'United States', 'China', 'Germany'
                New-HTMLChart {
                    New-ChartBarOptions -Vertical -Patterned
                    New-ChartLegend -Name 'Number of bottles'
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        New-ChartBar -Name $DataNames1[$i] -Value $Data1[$i]
                    }
                }
            }

            New-HTMLPanel {
                $Data1 = 44, 55, 41, 64, 22, 43, 21
                $Data2 = 53, 32, 33, 52, 13, 44, 32
                $DataNames1 = 2001, 2002, 2003, 2004, 2005, 2006, 2007

                New-HTMLChart -Title 'Born vs Dead' -TitleAlignment center {
                    New-ChartBarOptions -Vertical -Patterned
                    New-ChartLegend -Name 'Born', 'Died'
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        New-ChartBar -Name $DataNames1[$i] -Value $Data1[$i], $Data2[$i]
                    }
                }
            }
        }
    }
    New-HTMLTab -Name 'Bar Charts - Bar Stacked' -IconRegular chart-bar {

        New-HTMLSection -HeaderText 'Bar Charts 1 - Bar Stacked' -CanCollapse {
            # One way to build charts but with 2 values
            New-HTMLPanel {
                $Data1 = 400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380
                $Data2 = 44, 55, 41, 64, 22, 43, 21
                $Data3 = 53, 32, 33, 52, 13, 44, 32
                $DataNames1 = 'South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan', 'United States', 'China', 'Germany'

                New-HTMLChart {
                    New-ChartBarOptions -Type barStacked
                    New-ChartLegend -Name 'People', 'Pets', 'Furniture'
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        New-ChartBar -Name $DataNames1[$i] -Value $Data1[$i], $Data2[$i], $Data3[$i]
                    }
                }
            }
            New-HTMLPanel {
                $DataNames1 = 2001, 2002, 2003, 2004, 2005, 2006, 2007
                New-HTMLChart -Title 'Pets vs People' -TitleAlignment center {
                    New-ChartBarOptions -Type barStacked
                    New-ChartLegend -Name 'People', 'Pets'
                    New-ChartBar -Name $DataNames1[0] -Value 44, 53
                    New-ChartBar -Name $DataNames1[1] -Value 55, 32
                    New-ChartBar -Name $DataNames1[2] -Value 41, 33
                    New-ChartBar -Name $DataNames1[3] -Value 64, 52
                    New-ChartBar -Name $DataNames1[4] -Value 22, 13
                    New-ChartBar -Name $DataNames1[5] -Value 43, 44
                    New-ChartBar -Name $DataNames1[6] -Value 21, 32
                }
            }
        }
    }
    New-HTMLTab -Name 'Bar Charts - Bar Stacked 100%' -IconSolid audio-description {
        New-HTMLSection -HeaderText 'Bar Charts - Stacked 100%' -CanCollapse {
            New-HTMLPanel {
                $Data1 = 44, 55, 41, 37, 22, 43, 21
                $Data2 = 53, 32, 33, 52, 13, 43, 32
                $Data3 = 12, 17, 11, 9, 15, 11, 20
                $Data4 = 9, 7, 5, 8, 6, 9, 4
                $Data5 = 25, 12, 19, 32, 25, 24, 10
                $DataNames1 = 2008, 2009, 2010, 2011, 2012, 2013, 2014
                New-HTMLChart -Title 'Finctional Books Sales' {
                    New-ChartBarOptions -Type barStacked100Percent
                    New-ChartLegend -Names 'Marine Sprite', 'Striking Calf', 'Tank Picture', 'Tank Picture', 'Bucket Slope', 'Reborn Kid', 'Other' -LegendPosition top
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        New-ChartBar -Name $DataNames1[$i] -Value $Data1[$i], $Data2[$i], $Data3[$i], $Data4[$i], $Data5[$i]
                    }
                }
            }
            New-HTMLPanel {
                $Data1 = 44, 55, 41, 64, 22, 43, 21
                $Data2 = 53, 32, 33, 52, 13, 44, 32
                $DataNames1 = 2001, 2002, 2003, 2004, 2005, 2006, 2007
                New-HTMLChart -Title 'Pets vs People' -TitleAlignment center {
                    New-ChartBarOptions -Type barStacked100Percent -Gradient
                    New-ChartLegend -Names 'People', 'Pets' -LegendPosition bottom
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        New-ChartBar -Name $DataNames1[$i] -Value $Data1[$i], $Data2[$i]
                    }
                }
            }
        }
    }
    New-HTMLTab -Name 'Bar Charts - Bar Stacked Plus/Minus' -IconRegular file {
        New-HTMLSection -HeaderText 'Bar Charts - Stacked 100%' -CanCollapse {
            New-HTMLPanel {
                $Data1 = -0.8, -1.05, -1.06, -1.18, -1.4, -2.2, -2.85, -3.7, -3.96, -4.22, -4.3, -4.4, -4.1, -4, -4.1, -3.4, -3.1, -2.8
                $Data2 = 0.4, 0.65, 0.76, 0.88, 1.5, 2.1, 2.9, 3.8, 3.9, 4.2, 4, 4.3, 4.1, 4.2, 4.5, 3.9, 3.5, 3
                $DataLegend = 'Males', 'Females' # should match amount of data sets
                $DataNames = '85+', '80-84', '75-79', '70-74', '65-69', '60-64', '55-59', '50-54', '45-49', '40-44', '35-39', '30-34', '25-29', '20-24', '15-19', '10-14', '5-9', '0-4'

                New-HTMLChart -Title 'Mauritius population pyramid 2011' {
                    New-ChartBarOptions -Type barStacked
                    New-ChartLegend -Names $DataLegend -LegendPosition top
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        New-ChartBar -Name $DataNames[$i] -Value $Data1[$i], $Data2[$i]
                    }
                }
            }
            New-HTMLPanel {
                $Data1 = -0.8, -1.05, -1.06, -1.18, -1.4, -2.2, -2.85, -3.7, -3.96, -4.22, -4.3, -4.4, -4.1, -4, -4.1, -3.4, -3.1, -2.8
                $Data2 = 0.4, 0.65, 0.76, 0.88, 1.5, 2.1, 2.9, 3.8, 3.9, 4.2, 4, 4.3, 4.1, 4.2, 4.5, 3.9, 3.5, 3
                $DataLegend = 'Males', 'Females' # should match amount of data sets
                $DataNames = '85+', '80-84', '75-79', '70-74', '65-69', '60-64', '55-59', '50-54', '45-49', '40-44', '35-39', '30-34', '25-29', '20-24', '15-19', '10-14', '5-9', '0-4'

                New-HTMLChart -Title 'Mauritius population pyramid 2011' {
                    New-ChartBarOptions -Type barStacked -Vertical
                    New-ChartLegend -Names $DataLegend -LegendPosition top
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        New-ChartBar -Name $DataNames[$i] -Value $Data1[$i], $Data2[$i]
                    }
                }
            }
        }
    }
} -Show