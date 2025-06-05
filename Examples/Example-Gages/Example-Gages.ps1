Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example-Gages.html" { New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLText -Text 'Title' -Color Red -Alignment center -FontSize 20px
            New-HTMLGage -Label 'Fixes' -MinValue 0 -MaxValue 100 -Value 50 -Counter
        }
        New-HTMLPanel -Invisible {
            New-HTMLText -Text 'Title' -Color Red -Alignment center -FontSize 20px
            New-HTMLGage -Label 'Fixes' -MinValue 0 -MaxValue 100 -Value 50 -Counter
        }
        New-HTMLPanel {
            # Notice how counter forces the number goes up from 0 to 5000
            New-HTMLGage -Label 'Open Tickets' -MinValue 0 -MaxValue 50000 -Value 5000 -Counter
        }
        New-HTMLPanel {
            # Notice how lack of counter displays final value of 3000
            New-HTMLGage -Label 'Closed Tickets' -MinValue 0 -MaxValue 50000 -Value 3000
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Gaugage Width Scale' -MinValue 0 -MaxValue 100 -Value 30 -GaugageWidth 0.6
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Tickets' -MinValue 0 -MaxValue 100 -Value 30 -GaugageWidth 1
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Tickets' -MinValue 0 -MaxValue 100 -Value 70 -GaugageWidth 1
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Tickets' -MinValue 0 -MaxValue 100 -Value 30 -GaugageWidth 0
        }
    }
    New-HTMLSection -HeaderText "New Features: Target Lines & Level Colors" -Invisible {
        New-HTMLPanel {
            New-HTMLText -Text 'With Target Line' -Color Blue -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Performance' -MinValue 0 -MaxValue 100 -Value 65 -TargetLine 80 -TargetLineColor "red" -TargetLineWidth 3 -Counter
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Level Colors' -Color Green -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Health Score' -MinValue 0 -MaxValue 100 -Value 75 -LevelColors @("red", "yellow", "green") -Counter
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Custom Size' -Color Purple -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Custom Gage' -MinValue 0 -MaxValue 100 -Value 85 -Width 200 -Height 150 -Counter
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Animated' -Color Orange -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Animated Load' -MinValue 0 -MaxValue 100 -Value 90 -StartAnimationTime 1500 -StartAnimationType "bounce" -Counter
        }
    }
    New-HTMLSection -HeaderText "Differential Mode & Donut Features" -Invisible {
        New-HTMLPanel {
            New-HTMLText -Text 'Normal Fill' -Color Black -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Standard' -MinValue -50 -MaxValue 50 -Value 25 -Counter
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Differential Fill' -Color Black -Alignment center -FontSize 16px
            New-HTMLGage -Label 'From Center' -MinValue -50 -MaxValue 50 -Value 25 -Differential -Counter
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Donut Start Angle' -Color Navy -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Custom Start' -Type Donut -MinValue 0 -MaxValue 100 -Value 60 -DonutStartAngle 180 -Counter
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Font Size Control' -Color DarkGreen -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Big Text' -MinValue 0 -MaxValue 100 -Value 80 -ValueMinFontSize 20 -LabelMinFontSize 12 -Counter
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLGage -Label 'Fixes' -Value 30 -Counter {
                New-GageSector -Color Blue -Min 0 -Max 50
                New-GageSector -Color Red -Min 51 -Max 100
            }
        }
        New-HTMLPanel {
            # Notice how counter forces the number goes up from 0 to 5000
            New-HTMLGage -Label 'Fixes' -Value 40 -MaxValue 1000 -Counter -ValueSymbol '$' {
                New-GageSector -Color Blue -Min 0 -Max 50
                New-GageSector -Color Red -Min 51 -Max 100
                New-GageSector -Color Yellow -Min 101 -Max 1000
            }
        }
        New-HTMLPanel {
            # Notice how lack of counter displays final value of 3000
            New-HTMLGage -Label 'Closed Tickets' -MinValue 0 -MaxValue 50000 -Value 3000
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Gaugage Width Scale' -MinValue 0 -MaxValue 100 -Value 30 -GaugageWidth 0.6
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Tickets' -MinValue 0 -MaxValue 100 -Value 30 -GaugageWidth 1
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Tickets' -MinValue 0 -MaxValue 100 -Value 70 -GaugageWidth 1
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Tickets' -MinValue 0 -MaxValue 100 -Value 30 -GaugageWidth 0
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLGage -Label 'Fixes' -MinValue 0 -MaxValue 100 -Value 50 -Counter -Pointer -MinText 'Minimal' -ValueColor GordonsGreen -PointerColor Gray -LabelColor Black
        }
        New-HTMLPanel {
            # Notice how counter forces the number goes up from 0 to 5000
            New-HTMLGage -Label 'Open Tickets' -MinValue 0 -MaxValue 50000 -Value 5000 -Counter -Pointer
        }
        New-HTMLPanel {
            # Notice how lack of counter displays final value of 3000
            New-HTMLGage -Label 'Closed Tickets' -MinValue 0 -MaxValue 50000 -Value 3000 -Pointer
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Tickets' -MinValue 0 -MaxValue 100 -Value 30 -GaugageWidth 0.6 -Pointer
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Tickets' -MinValue 0 -MaxValue 100 -Value 30 -GaugageWidth 1 -Pointer
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Tickets' -MinValue 0 -MaxValue 100 -Value 70 -GaugageWidth 1 -Pointer
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Tickets' -MinValue 0 -MaxValue 100 -Value 30 -GaugageWidth 0 -Pointer
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLGage -Label 'Fixes' -MinValue 0 -MaxValue 100 -Value 50 -Counter -LabelColor Blue -BackgroundGaugageColor Almond
        }
        New-HTMLPanel {
            # Notice how counter forces the number goes up from 0 to 5000
            New-HTMLGage -Label 'Open Tickets' -MinValue 0 -MaxValue 50000 -Value 5000 -Counter -BackgroundGaugageColor BlueDiamond -ShowInnerShadow
        }
        New-HTMLPanel {
            # Notice how lack of counter displays final value of 3000
            New-HTMLGage -Label 'Closed Tickets' -MinValue 0 -MaxValue 50000 -Value 3000 -Pointer
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Gage' -MinValue 0 -MaxValue 100 -Value 30 -GaugageWidth 0.6 -Pointer -PointerTopLength 10
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Gage' -MinValue 0 -MaxValue 100 -Value 30 -GaugageWidth 1 -Pointer -PointerTopLength -15 -PointerBottomLength 10 -PointerBottomWidth 12 -PointerColor GreenYellow
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Gage' -MinValue 0 -MaxValue 100 -Value 30 -GaugageWidth 1 -Pointer -PointerTopLength 15 -PointerBottomLength 10 -PointerBottomWidth 12 -PointerColor GreenYellow
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Gage' -MinValue 0 -MaxValue 100 -Value 30 -GaugageWidth 0 -Pointer -PointerTopLength 1 -PointerBottomLength 0 -PointerBottomWidth 3 -PointerColor GreenYellow
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLGage -Label 'Fixes' -MinValue 0 -MaxValue 100 -Value 65 -Pointer
        }
        New-HTMLPanel {
            # Notice how counter forces the number goes up from 0 to 5000
            New-HTMLGage -Label 'Open Tickets' -MinValue 0 -MaxValue 100 -Value 45 -PointerTopLength -15 -PointerBottomLength 10 -PointerBottomWidth 12 -PointerStrokeWidth 3 -PointerStrokeLinecap round
        }
        New-HTMLPanel {
            # Notice how lack of counter displays final value of 3000
            New-HTMLGage -Label 'Closed Tickets' -MinValue 0 -MaxValue 100 -Value 40 -PointerTopLength 10 -PointerBottomLength 10 -PointerBottomWidth 8 -PointerColor Blue
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Gage' -MinValue 0 -MaxValue 100 -Value 70 -PointerTopLength 8 -PointerBottomLength -20 -PointerBottomWidth 6 -ValueColor Red
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Gage' -MinValue 0 -MaxValue 100 -Value 30 -GaugageWidth 1 -Pointer -PointerTopLength -15 -PointerBottomLength 10 -PointerBottomWidth 12
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Gage' -MinValue 0 -MaxValue 100 -Value 30 -GaugageWidth 1 -Pointer -PointerTopLength 15 -PointerBottomLength 10 -PointerBottomWidth 12
        }
        New-HTMLPanel {
            New-HTMLGage -Label 'Testing Gage' -MinValue 0 -MaxValue 100 -Value 30 -GaugageWidth 0 -Pointer -PointerTopLength 1 -PointerBottomLength 0 -PointerBottomWidth 3
        }
    }
    New-HTMLSection -HeaderText "UseAbsoluteValues Feature Comparison" -Invisible {
        New-HTMLPanel {
            New-HTMLText -Text 'Percentage-based sectors (default)' -Color Blue -Alignment center -FontSize 16px
            New-HTMLText -Text 'Same gauge (0-100), same sectors (0-60, 61-80, 81-100)' -Alignment center -FontSize 12px
            New-HTMLText -Text 'Interpreted as: 0-60%, 61-80%, 81-100%' -Alignment center -FontSize 10px
            New-HTMLGage -Label 'Server CPU %' -MinValue 0 -MaxValue 100 -Value 85 -Counter {
                New-GageSector -Color Green -Min 0 -Max 60
                New-GageSector -Color Yellow -Min 61 -Max 80
                New-GageSector -Color Red -Min 81 -Max 100
            }
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Absolute value sectors' -Color Red -Alignment center -FontSize 16px
            New-HTMLText -Text 'Same gauge (0-100), same sectors (0-60, 61-80, 81-100)' -Alignment center -FontSize 12px
            New-HTMLText -Text 'Interpreted as: 0-60, 61-80, 81-100 (absolute values)' -Alignment center -FontSize 10px
            New-HTMLGage -Label 'Server CPU %' -MinValue 0 -MaxValue 100 -Value 85 -Counter -UseAbsoluteValues {
                New-GageSector -Color Green -Min 0 -Max 60
                New-GageSector -Color Yellow -Min 61 -Max 80
                New-GageSector -Color Red -Min 81 -Max 100
            }
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Network Traffic (Mbps)' -Color Purple -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Current Speed' -MinValue 0 -MaxValue 1000 -Value 750 -Counter -UseAbsoluteValues -ValueSymbol 'Mbps' {
                New-GageSector -Color Green -Min 0 -Max 300
                New-GageSector -Color Yellow -Min 301 -Max 700
                New-GageSector -Color Orange -Min 701 -Max 900
                New-GageSector -Color Red -Min 901 -Max 1000
            }
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Temperature Monitoring' -Color DarkBlue -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Server Temp (°C)' -MinValue 0 -MaxValue 100 -Value 65 -Counter -UseAbsoluteValues -ValueSymbol '°C' {
                New-GageSector -Color Blue -Min 0 -Max 40
                New-GageSector -Color Green -Min 41 -Max 60
                New-GageSector -Color Yellow -Min 61 -Max 75
                New-GageSector -Color Orange -Min 76 -Max 85
                New-GageSector -Color Red -Min 86 -Max 100
            }
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Disk Space Usage (TB)' -Color DarkGreen -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Storage Used' -MinValue 0 -MaxValue 10 -Value 7.5 -Counter -UseAbsoluteValues -ValueSymbol 'TB' -DecimalNumbers 1 {
                New-GageSector -Color Green -Min 0 -Max 5
                New-GageSector -Color Yellow -Min 5 -Max 8
                New-GageSector -Color Red -Min 8 -Max 10
            }
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Database Connections' -Color Maroon -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Active Connections' -MinValue 0 -MaxValue 500 -Value 320 -Counter -UseAbsoluteValues {
                New-GageSector -Color Green -Min 0 -Max 200
                New-GageSector -Color Yellow -Min 201 -Max 350
                New-GageSector -Color Orange -Min 351 -Max 450
                New-GageSector -Color Red -Min 451 -Max 500
            }
        }
    }

} -ShowHTML -Online