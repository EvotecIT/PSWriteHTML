Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -Name 'Test' -FilePath "$PSScriptRoot\Example-Carousel02.html" -Show {
    New-HTMLSection -Invisible {
        New-HTMLSection -Invisible {
            New-HTMLCarousel {
                New-CarouselSlide {
                    New-HTMLPanel {
                        New-HTMLChart {
                            New-ChartLegend -LegendPosition bottom -HorizontalAlign right -Color Red, Blue, Yellow -DisableOnItemHoverHighlightDataSeries -DisableOnItemClickToggleDataSeries
                            New-ChartAxisY -LabelMaxWidth 200 -LabelAlign left -Show -LabelFontColor Red, Blue, Green -TitleText 'This is title for y Axis' -TitleColor Red
                            New-ChartBarOptions -Distributed
                            New-ChartBar -Name 'Test very long' -Value 1
                            New-ChartBar -Name 'Test1' -Value 20
                            New-ChartBar -Name 'Test2 and even longer title' -Value 30
                        } -Title 'Testing Title' -TitleAlignment center -SubTitle 'Because SubTitles are better' -SubTitleAlignment center -SubTitleFontSize 30 -TitleColor Gold
                    }
                }
                New-CarouselSlide {
                    New-HTMLText -Text 'Slide 2'
                }
            }
        }
        New-HTMLSection -Invisible {

        }
    }
} -Online -Format