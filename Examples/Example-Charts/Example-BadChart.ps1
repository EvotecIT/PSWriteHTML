Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My title' -Online {
    New-HTMLTabStyle -SlimTabs
    New-HTMLTab -Name 'Bar Charts - Bar Stacked' -IconSolid audio-description {
        New-HTMLSection -HeaderText 'Bar Charts - Stacked' -CanCollapse {
            New-HTMLPanel {
                #$Data1 = 44, 55, 0, 0, 22, 43, 21
                #$Data1 = , , , , , ,
                $Data1 = $null, $null, $null, $null, $null, $null, $null
                $Data2 = 53, 32, 33, 52, 13, 43, 32
                $Data3 = 12, 17, 11, 9, , , 20
                $Data4 = 9, 7, 5, 8, 6, 9, 4
                $Data5 = 25, 12, 19, 32, , , 10
                $DataNames1 = 2008, 2009, 2010, 2011, 2012, 2013, 2014
                New-HTMLChart -Title 'Finctional Books Sales' {
                    New-ChartBarOptions -Type barStacked
                    New-ChartLegend -Names 'Marine Sprite', 'Striking Calf', 'Tank Picture', 'Tank Picture', 'Bucket Slope', 'Reborn Kid', 'Other' -LegendPosition top
                    for ($i = 0; $i -lt $Data1.Count; $i++) {
                        New-ChartBar -Name $DataNames1[$i] -Value $Data1[$i], $Data2[$i], $Data3[$i], $Data4[$i], $Data5[$i]
                    }
                }
            }
        }
    }

} -ShowHTML -FilePath $PSScriptRoot\Example-BadChart.html