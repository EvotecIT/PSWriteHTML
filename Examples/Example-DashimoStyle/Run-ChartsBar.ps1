Import-Module .\PSWriteHTML.psd1 -Force

Dashboard -Name 'Charts - Bar' -FilePath $PSScriptRoot\Output\DashboardChartsBar.html {
    TabOptions -SlimTabs
    Tab -Name 'Bar Charts - Bar' -IconRegular chart-bar {
        Section -Name 'Bar Charts - Test' -Collapsable {
            Panel {
                Chart {
                    ChartLegend -Name 'Time'
                    ChartBar -Name 'Test' -Value 1
                    ChartBar -Name 'Test1' -Value 2
                    ChartBar -Name 'Test2' -Value 3
                }
            }
            Panel {
                Chart {
                    ChartToolbar -Download
                    ChartLegend -Name 'Time', 'Money', 'Taxes'
                    ChartBar -Name 'Test' -Value 1, 2, 3
                    ChartBar -Name 'Test1' -Value 2, 5, 7
                    ChartBar -Name 'Test2' -Value 3, 1, 2
                }
            }
            Panel {
                Chart {
                    ChartLegend -Name 'Time'
                    for ($i = 0; $i -le 5; $i++) {
                        ChartBar -Name "Test $i" -Value $i
                    }
                }
            }
            Panel {
                Chart {
                    ChartBarOptions -Vertical -DataLabelsColor GreenYellow
                    ChartLegend -Name 'Time'
                    for ($i = 0; $i -le 5; $i++) {
                        ChartBar -Name "Test $i" -Value $i
                    }
                }
            }
        }
        Section -Name 'Bar Charts - Test Colors' -Collapsable {
            Panel -Invisible {
                Chart {
                    ChartLegend -Name 'Time'
                    ChartBar -Name 'Test' -Value 1
                    ChartBar -Name 'Test1' -Value 2
                    ChartBar -Name 'Test2' -Value 3
                }
            }
            Panel -Invisible {
                Chart {
                    ChartLegend -Name 'Time', 'Money', 'Taxes'
                    ChartBar -Name 'Test' -Value 1, 2, 3
                    ChartBar -Name 'Test1' -Value 2, 5, 7
                    ChartBar -Name 'Test2' -Value 3, 1, 2
                }
            }
            Panel -Invisible {
                Chart {
                    ChartLegend -Name 'Time'
                    for ($i = 0; $i -le 5; $i++) {
                        ChartBar -Name "Test $i" -Value $i
                    }
                }
            }
            Panel -Invisible {
                Chart {
                    ChartBarOptions -Vertical -DataLabelsColor GreenYellow
                    ChartLegend -Name 'Time'
                    for ($i = 0; $i -le 5; $i++) {
                        ChartBar -Name "Test $i" -Value $i
                    }
                }
            }
        }
        Section -Name 'Bar Charts - Standard Bar' -Collapsable {

            Panel {
                $Data1 = 400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380
                $DataNames1 = 'South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan', 'United States', 'China', 'Germany'
                Chart {
                    ChartLegend -Name 'Number of bottles'
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        ChartBar -Name $DataNames1[$i] -Value $Data1[$i]
                    }
                }
            }

            Panel {
                $Data1 = 44, 55, 41, 64, 22, 43, 21
                $Data2 = 53, 32, 33, 52, 13, 44, 32
                $DataNames1 = 2001, 2002, 2003, 2004, 2005, 2006, 2007

                Chart -Title 'Born vs Dead' -TitleAlignment center {
                    #ChartBarOptions
                    ChartLegend -Name 'Born', 'Died'
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        ChartBar -Name $DataNames1[$i] -Value $Data1[$i], $Data2[$i]
                    }
                }
            }
        }
        Section -Name 'Bar Charts - Standard Bar Vertical' -Collapsable {

            Panel {
                $Data1 = 400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380
                $DataNames1 = 'South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan', 'United States', 'China', 'Germany'
                Chart {
                    ChartBarOptions -Vertical
                    ChartLegend -Name 'Number of bottles'
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        ChartBar -Name $DataNames1[$i] -Value $Data1[$i]
                    }
                }
            }

            Panel {
                $Data1 = 44, 55, 41, 64, 22, 43, 21
                $Data2 = 53, 32, 33, 52, 13, 44, 32
                $DataNames1 = 2001, 2002, 2003, 2004, 2005, 2006, 2007

                Chart -Title 'Born vs Dead' -TitleAlignment center {
                    ChartBarOptions -Vertical
                    ChartLegend -Name 'Born', 'Died'
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        ChartBar -Name $DataNames1[$i] -Value $Data1[$i], $Data2[$i]
                    }
                }
            }
        }
        Section -Name 'Bar Charts - Standard Bar Vertical & Patterned' -Collapsable {

            Panel {
                $Data1 = 400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380
                $DataNames1 = 'South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan', 'United States', 'China', 'Germany'
                Chart {
                    ChartBarOptions -Vertical -Patterned
                    ChartLegend -Name 'Number of bottles'
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        ChartBar -Name $DataNames1[$i] -Value $Data1[$i]
                    }
                }
            }

            Panel {
                $Data1 = 44, 55, 41, 64, 22, 43, 21
                $Data2 = 53, 32, 33, 52, 13, 44, 32
                $DataNames1 = 2001, 2002, 2003, 2004, 2005, 2006, 2007

                Chart -Title 'Born vs Dead' -TitleAlignment center {
                    ChartBarOptions -Vertical -Patterned
                    ChartLegend -Name 'Born', 'Died'
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        ChartBar -Name $DataNames1[$i] -Value $Data1[$i], $Data2[$i]
                    }
                }
            }
        }
    }
    Tab -Name 'Bar Charts - Bar Stacked' -IconRegular chart-bar {

        Section -Name 'Bar Charts 1 - Bar Stacked' -Collapsable {
            # One way to build charts but with 2 values
            Panel {
                $Data1 = 400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380
                $Data2 = 44, 55, 41, 64, 22, 43, 21
                $Data3 = 53, 32, 33, 52, 13, 44, 32
                $DataNames1 = 'South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan', 'United States', 'China', 'Germany'

                Chart {
                    ChartBarOptions -Type barStacked
                    ChartLegend -Name 'People', 'Pets', 'Furniture'
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        ChartBar -Name $DataNames1[$i] -Value $Data1[$i], $Data2[$i], $Data3[$i]
                    }
                }
            }
            Panel {
                $DataNames1 = 2001, 2002, 2003, 2004, 2005, 2006, 2007
                Chart -Title 'Pets vs People' -TitleAlignment center {
                    ChartBarOptions -Type barStacked
                    ChartLegend -Name 'People', 'Pets'
                    ChartBar -Name $DataNames1[0] -Value 44, 53
                    ChartBar -Name $DataNames1[1] -Value 55, 32
                    ChartBar -Name $DataNames1[2] -Value 41, 33
                    ChartBar -Name $DataNames1[3] -Value 64, 52
                    ChartBar -Name $DataNames1[4] -Value 22, 13
                    ChartBar -Name $DataNames1[5] -Value 43, 44
                    ChartBar -Name $DataNames1[6] -Value 21, 32
                }
            }
        }
    }
    Tab -Name 'Bar Charts - Bar Stacked 100%' -IconSolid audio-description {
        Section -Name 'Bar Charts - Stacked 100%' -Collapsable {
            Panel {
                $Data1 = 44, 55, 41, 37, 22, 43, 21
                $Data2 = 53, 32, 33, 52, 13, 43, 32
                $Data3 = 12, 17, 11, 9, 15, 11, 20
                $Data4 = 9, 7, 5, 8, 6, 9, 4
                $Data5 = 25, 12, 19, 32, 25, 24, 10
                $DataNames1 = 2008, 2009, 2010, 2011, 2012, 2013, 2014
                Chart -Title 'Finctional Books Sales' {
                    ChartBarOptions -Type barStacked100Percent
                    ChartLegend -Names 'Marine Sprite', 'Striking Calf', 'Tank Picture', 'Tank Picture', 'Bucket Slope', 'Reborn Kid', 'Other' -LegendPosition top
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        ChartBar -Name $DataNames1[$i] -Value $Data1[$i], $Data2[$i], $Data3[$i], $Data4[$i], $Data5[$i]
                    }
                }
            }
            Panel {
                $Data1 = 44, 55, 41, 64, 22, 43, 21
                $Data2 = 53, 32, 33, 52, 13, 44, 32
                $DataNames1 = 2001, 2002, 2003, 2004, 2005, 2006, 2007
                Chart -Title 'Pets vs People' -TitleAlignment center {
                    ChartBarOptions -Type barStacked100Percent
                    ChartLegend -Names 'People', 'Pets' -LegendPosition bottom
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        ChartBar -Name $DataNames1[$i] -Value $Data1[$i], $Data2[$i]
                    }
                }
            }
        }
    }
    Tab -Name 'Bar Charts - Bar Stacked Plus/Minus' -IconRegular file {
        Section -Name 'Bar Charts - Stacked 100%' -Collapsable {
            Panel {
                $Data1 = -0.8, -1.05, -1.06, -1.18, -1.4, -2.2, -2.85, -3.7, -3.96, -4.22, -4.3, -4.4, -4.1, -4, -4.1, -3.4, -3.1, -2.8
                $Data2 = 0.4, 0.65, 0.76, 0.88, 1.5, 2.1, 2.9, 3.8, 3.9, 4.2, 4, 4.3, 4.1, 4.2, 4.5, 3.9, 3.5, 3
                $DataLegend = 'Males', 'Females' # should match amount of data sets
                $DataNames = '85+', '80-84', '75-79', '70-74', '65-69', '60-64', '55-59', '50-54', '45-49', '40-44', '35-39', '30-34', '25-29', '20-24', '15-19', '10-14', '5-9', '0-4'

                Chart -Title 'Mauritius population pyramid 2011' {
                    ChartBarOptions -Type barStacked
                    ChartLegend -Names $DataLegend -LegendPosition top
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        ChartBar -Name $DataNames[$i] -Value $Data1[$i], $Data2[$i]
                    }
                }

                #ChartBar -Data $Data1, $Data2 -DataNames $DataNames -DataLegend $DataLegend -Type barStacked -DataLabelsEnabled $true -Height 500

            }
            Panel {
                $Data1 = -0.8, -1.05, -1.06, -1.18, -1.4, -2.2, -2.85, -3.7, -3.96, -4.22, -4.3, -4.4, -4.1, -4, -4.1, -3.4, -3.1, -2.8
                $Data2 = 0.4, 0.65, 0.76, 0.88, 1.5, 2.1, 2.9, 3.8, 3.9, 4.2, 4, 4.3, 4.1, 4.2, 4.5, 3.9, 3.5, 3
                $DataLegend = 'Males', 'Females' # should match amount of data sets
                $DataNames = '85+', '80-84', '75-79', '70-74', '65-69', '60-64', '55-59', '50-54', '45-49', '40-44', '35-39', '30-34', '25-29', '20-24', '15-19', '10-14', '5-9', '0-4'

                Chart -Title 'Mauritius population pyramid 2011' {
                    ChartBarOptions -Type barStacked -Vertical
                    ChartLegend -Names $DataLegend -LegendPosition top
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        ChartBar -Name $DataNames[$i] -Value $Data1[$i], $Data2[$i]
                    }
                }
            }
        }
    }
} -Show -Online