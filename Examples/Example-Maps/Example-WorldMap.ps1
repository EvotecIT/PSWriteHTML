Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLSectionStyle -BorderRadius 0px -HeaderBackGroundColor Grey -RemoveShadow
    New-HTMLSection -HeaderText 'Example Map' {
        New-HTMLSection -Invisible {
            New-HTMLPanel {
                New-HTMLMap -Map world_countries {
                    New-MapArea -Area 'PL' -Href 'https://en.wikipedia.org/wiki/Poland' -Value 100 -Tooltip {
                        New-HTMLText -Text @(
                            'Poland'
                            '<br>'
                            'People count: 100'
                        ) -Color Black, Black, Blue -FontWeight bold, normal, normal -SkipParagraph -FontSize 15px, 14px, 14px
                    }
                    New-MapArea -Area 'DE' -Href 'https://en.wikipedia.org/wiki/Germany' -Value 200 -Tooltip {
                        New-HTMLText -Text @(
                            'Germany'
                            '<br>'
                            'People count: 200'
                        ) -Color Black, Black, Blue -FontWeight bold, normal, normal -SkipParagraph -FontSize 15px, 14px, 14px
                    }

                    New-MapLegendOption -Type 'Area' -Mode horizontal
                    New-MapLegendOption -Type 'Plot' -Mode horizontal

                    New-MapLegendSlice -Type 'Area' -Label 'Population to 100' -Min 0 -Max 100 -SliceColor '#FF0000' -StrokeWidth 0
                    New-MapLegendSlice -Type 'Area' -Label 'Population to 200' -Min 100 -Max 200 -SliceColor '#00FF00' -StrokeWidth 0
                    New-MapLegendSlice -Type 'Area' -Label 'Population to 300' -Min 101 -SliceColor '#0000FF' -StrokeWidth 0

                    New-MapLegendSlice -Size 5 -Type 'Plot' -Label 'Population to 100' -Min 0 -Max 100 -SliceColor '#FF0000' -HoverTransform 's1.5' -HoverStrokeWidth 1
                    New-MapLegendSlice -Size 10 -Type 'Plot' -Label 'Population to 200' -Min 100 -Max 1000000 -SliceColor '#00FF00' -HoverTransform 's1.5' -HoverStrokeWidth 1
                    New-MapLegendSlice -Size 15 -Type 'Plot' -Label 'Population to 300' -Min 1000001 -Max 3000000 -SliceColor '#0000FF' -HoverTransform 's1.5' -HoverStrokeWidth 1

                    New-MapPlot -Plot 'warsaw' -Latitude 52.2297 -Longitude 21.0122 -Href 'https://en.wikipedia.org/wiki/Warsaw' -Value 1000000 -Tooltip {
                        New-HTMLText -Text @(
                            'Warsaw'
                            '<br>'
                            'Population: 1000000'
                        ) -Color Black, Black, Blue -FontWeight bold, normal, normal -SkipParagraph -FontSize 15px, 14px, 14px
                    }
                } -ShowAreaLegend -AreaTitle "Population" -ShowPlotLegend -PlotTitle "Cities"
            }
        }
    }
} -ShowHTML -Online -FilePath $PSScriptRoot\Example-WorldMap.html