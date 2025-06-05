Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'UseAbsoluteValues Feature Examples' -FilePath "$PSScriptRoot\Example-UseAbsoluteValues.html" {
    New-HTMLSectionStyle -BorderRadius 0px -HeaderBackGroundColor DarkSlateGray -HeaderTextColor White
    New-HTMLSection -HeaderText "Understanding UseAbsoluteValues" -Content {
        New-HTMLText -Text @"
The UseAbsoluteValues parameter controls how custom sectors are interpreted:

• Default (Percentage-based): Sector ranges are treated as percentages of the gauge range
• UseAbsoluteValues: Sector ranges are treated as absolute values matching the gauge scale

This is particularly useful for real-world monitoring scenarios where you want sectors to match specific thresholds.
"@ -FontSize 14px
    } -Invisible

    New-HTMLSection -HeaderText "Side-by-Side Comparison" -Invisible {
        New-HTMLPanel {
            New-HTMLText -Text 'Percentage-based (Default)' -Color Blue -Alignment center -FontSize 18px -FontWeight bold
            New-HTMLText -Text 'Gauge: 0-100, Value: 75' -Alignment center -FontSize 12px
            New-HTMLText -Text 'Sectors: 0-50%, 51-80%, 81-100%' -Alignment center -FontSize 12px
            New-HTMLGage -Label 'CPU Usage %' -MinValue 0 -MaxValue 100 -Value 75 -Counter {
                New-GageSector -Color Green -Min 0 -Max 50
                New-GageSector -Color Yellow -Min 51 -Max 80
                New-GageSector -Color Red -Min 81 -Max 100
            }
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Absolute Values' -Color Red -Alignment center -FontSize 18px -FontWeight bold
            New-HTMLText -Text 'Gauge: 0-100, Value: 75' -Alignment center -FontSize 12px
            New-HTMLText -Text 'Sectors: 0-50, 51-80, 81-100' -Alignment center -FontSize 12px
            New-HTMLGage -Label 'CPU Usage %' -MinValue 0 -MaxValue 100 -Value 75 -Counter -UseAbsoluteValues {
                New-GageSector -Color Green -Min 0 -Max 50
                New-GageSector -Color Yellow -Min 51 -Max 80
                New-GageSector -Color Red -Min 81 -Max 100
            }
        }
    }

    New-HTMLSection -HeaderText "Real-World Monitoring Examples" -Invisible {
        New-HTMLPanel {
            New-HTMLText -Text 'Memory Usage (GB)' -Color DarkBlue -Alignment center -FontSize 16px
            New-HTMLText -Text 'Absolute thresholds: <8GB, 8-12GB, >12GB' -Alignment center -FontSize 11px
            New-HTMLGage -Label 'RAM Usage' -MinValue 0 -MaxValue 16 -Value 10.5 -Counter -UseAbsoluteValues -ValueSymbol 'GB' -DecimalNumbers 1 {
                New-GageSector -Color Green -Min 0 -Max 8
                New-GageSector -Color Yellow -Min 8 -Max 12
                New-GageSector -Color Red -Min 12 -Max 16
            }
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Network Bandwidth (Mbps)' -Color Purple -Alignment center -FontSize 16px
            New-HTMLText -Text 'Absolute thresholds: <100, 100-500, >500' -Alignment center -FontSize 11px
            New-HTMLGage -Label 'Current Speed' -MinValue 0 -MaxValue 1000 -Value 650 -Counter -UseAbsoluteValues -ValueSymbol 'Mbps' {
                New-GageSector -Color Green -Min 0 -Max 100
                New-GageSector -Color Yellow -Min 100 -Max 500
                New-GageSector -Color Red -Min 500 -Max 1000
            }
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Temperature (°C)' -Color OrangeRed -Alignment center -FontSize 16px
            New-HTMLText -Text 'Absolute thresholds: <60°C, 60-80°C, >80°C' -Alignment center -FontSize 11px
            New-HTMLGage -Label 'Server Temp' -MinValue 0 -MaxValue 100 -Value 72 -Counter -UseAbsoluteValues -ValueSymbol '°C' {
                New-GageSector -Color Green -Min 0 -Max 60
                New-GageSector -Color Yellow -Min 60 -Max 80
                New-GageSector -Color Red -Min 80 -Max 100
            }
        }
    }

    New-HTMLSection -HeaderText "Database Connection Pool Example" -Invisible {
        New-HTMLPanel {
            New-HTMLText -Text 'Connection Pool Status' -Color DarkGreen -Alignment center -FontSize 18px
            New-HTMLText -Text 'Max: 200 connections' -Alignment center -FontSize 12px
            New-HTMLGage -Label 'Active Connections' -MinValue 0 -MaxValue 200 -Value 145 -Counter -UseAbsoluteValues {
                New-GageSector -Color Green -Min 0 -Max 100
                New-GageSector -Color Yellow -Min 100 -Max 150
                New-GageSector -Color Orange -Min 150 -Max 180
                New-GageSector -Color Red -Min 180 -Max 200
            }
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Query Response Time' -Color Indigo -Alignment center -FontSize 18px
            New-HTMLText -Text 'Response time in milliseconds' -Alignment center -FontSize 12px
            New-HTMLGage -Label 'Avg Response' -MinValue 0 -MaxValue 5000 -Value 1250 -Counter -UseAbsoluteValues -ValueSymbol 'ms' {
                New-GageSector -Color Green -Min 0 -Max 1000
                New-GageSector -Color Yellow -Min 1000 -Max 2500
                New-GageSector -Color Orange -Min 2500 -Max 4000
                New-GageSector -Color Red -Min 4000 -Max 5000
            }
        }
    }

    New-HTMLSection -HeaderText "Storage and Capacity Planning" -Invisible {
        New-HTMLPanel {
            New-HTMLText -Text 'Disk Space (TB)' -Color DarkCyan -Alignment center -FontSize 16px
            New-HTMLText -Text 'Absolute capacity thresholds' -Alignment center -FontSize 11px
            New-HTMLGage -Label 'Storage Used' -MinValue 0 -MaxValue 50 -Value 32.7 -Counter -UseAbsoluteValues -ValueSymbol 'TB' -DecimalNumbers 1 {
                New-GageSector -Color Green -Min 0 -Max 25
                New-GageSector -Color Yellow -Min 25 -Max 40
                New-GageSector -Color Red -Min 40 -Max 50
            }
        }
        New-HTMLPanel {
            New-HTMLText -Text 'API Rate Limiting' -Color Crimson -Alignment center -FontSize 16px
            New-HTMLText -Text 'Requests per minute' -Alignment center -FontSize 11px
            New-HTMLGage -Label 'Current Rate' -MinValue 0 -MaxValue 10000 -Value 7500 -Counter -UseAbsoluteValues -ValueSymbol '/min' {
                New-GageSector -Color Green -Min 0 -Max 5000
                New-GageSector -Color Yellow -Min 5000 -Max 7300
                New-GageSector -Color Red -Min 7300 -Max 10000
            }
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Queue Length' -Color DarkOliveGreen -Alignment center -FontSize 16px
            New-HTMLText -Text 'Messages in processing queue' -Alignment center -FontSize 11px
            New-HTMLGage -Label 'Queue Size' -MinValue 0 -MaxValue 1000 -Value 425 -Counter -UseAbsoluteValues {
                New-GageSector -Color Green -Min 0 -Max 200
                New-GageSector -Color Yellow -Min 200 -Max 500
                New-GageSector -Color Orange -Min 500 -Max 800
                New-GageSector -Color Red -Min 800 -Max 1000
            }
        }
    }

    New-HTMLSection -HeaderText "Financial and Business Metrics" -Invisible {
        New-HTMLPanel {
            New-HTMLText -Text 'Revenue Target' -Color DarkGreen -Alignment center -FontSize 16px
            New-HTMLText -Text 'Monthly revenue in thousands' -Alignment center -FontSize 11px
            New-HTMLGage -Label 'Current Month' -MinValue 0 -MaxValue 1000 -Value 750 -Counter -UseAbsoluteValues -ValueSymbol 'K$' {
                New-GageSector -Color Red -Min 0 -Max 300
                New-GageSector -Color Yellow -Min 300 -Max 600
                New-GageSector -Color Green -Min 600 -Max 1000
            }
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Customer Satisfaction' -Color MediumBlue -Alignment center -FontSize 16px
            New-HTMLText -Text 'Score out of 10' -Alignment center -FontSize 11px
            New-HTMLGage -Label 'CSAT Score' -MinValue 0 -MaxValue 10 -Value 8.5 -Counter -UseAbsoluteValues -DecimalNumbers 1 {
                New-GageSector -Color Red -Min 0 -Max 5
                New-GageSector -Color Yellow -Min 5 -Max 7
                New-GageSector -Color Green -Min 7 -Max 10
            }
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Project Completion' -Color DarkMagenta -Alignment center -FontSize 16px
            New-HTMLText -Text 'Tasks completed out of total' -Alignment center -FontSize 11px
            New-HTMLGage -Label 'Progress' -MinValue 0 -MaxValue 250 -Value 180 -Counter -UseAbsoluteValues -ValueSymbol ' tasks' {
                New-GageSector -Color Red -Min 0 -Max 100
                New-GageSector -Color Yellow -Min 100 -Max 200
                New-GageSector -Color Green -Min 200 -Max 250
            }
        }
    }

} -ShowHTML -Online
