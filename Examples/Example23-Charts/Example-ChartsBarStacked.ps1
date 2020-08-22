Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example-ChartsBarStacked.html {
    New-HTMLTabStyle -SlimTabs
    New-HTMLTab -Name 'Bar Charts - Bar Stacked' -IconRegular chart-bar {

        New-HTMLSection -HeaderText 'Bar Charts 1 - Bar Stacked' -CanCollapse {
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
        }
    }

} -Show