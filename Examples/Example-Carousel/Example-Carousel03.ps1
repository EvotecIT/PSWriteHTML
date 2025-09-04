Import-Module .\PSWriteHTML.psd1 -Force

# Minimal demo showing carousels + charts + tables inside tabs
# Charts/tables in the non-active tab should render correctly on first show

$Data = Get-Process |
    Select-Object -First 12 Name, Id, CPU

New-HTML -Name 'Tabs + Carousel' -FilePath "$PSScriptRoot\Example-Carousel03.html" -Format -Show {
    New-HTMLTab -Name 'Tab 1' -Heading 'First' {
        New-HTMLSection -HeaderText 'Visible Tab' -Invisible {
            New-HTMLCarousel {
                New-CarouselSlide {
                    New-HTMLChart {
                        New-ChartPie -Name 'A' -Value 10
                        New-ChartPie -Name 'B' -Value 20
                        New-ChartPie -Name 'C' -Value 30
                    } -Title 'Pie - Tab 1'
                }
                New-CarouselSlide {
                    New-HTMLText -Text 'Second slide (Tab 1)'
                }
            }
        }
        New-HTMLSection -HeaderText 'Table' -Invisible {
            New-HTMLTable -DataTable $Data -HideFooter
        }
    }

    New-HTMLTab -Name 'Tab 2' -Heading 'Second' {
        # This tab is initially hidden; content should reflow on tab activation
        New-HTMLSection -HeaderText 'Hidden Tab (initial)' -Invisible {
            New-HTMLCarousel {
                New-CarouselSlide {
                    New-HTMLChart {
                        New-ChartPie -Name 'X' -Value 30
                        New-ChartPie -Name 'Y' -Value 40
                        New-ChartPie -Name 'Z' -Value 50
                    } -Title 'Pie - Tab 2'
                }
                New-CarouselSlide {
                    New-HTMLText -Text 'Second slide (Tab 2)'
                }
            }
        }
        New-HTMLSection -HeaderText 'Table in hidden Tab' -Invisible {
            New-HTMLTable -DataTable $Data -HideFooter
        }

        # Collapsible section to verify reflow on show/hide
        New-HTMLSection -HeaderText 'Collapsible Carousel' -CanCollapse -Collapsed {
            New-HTMLCarousel {
                New-CarouselSlide {
                    New-HTMLChart {
                        New-ChartLegend -LegendPosition bottom -HorizontalAlign right
                        New-ChartBarOptions -Distributed
                        New-ChartBar -Name 'One' -Value 10
                        New-ChartBar -Name 'Two' -Value 20
                        New-ChartBar -Name 'Three' -Value 15
                    } -Title 'Bar - Collapsible'
                }
                New-CarouselSlide {
                    New-HTMLText -Text 'Collapsed initially; open to reflow.'
                }
            }
        }
    }
}
