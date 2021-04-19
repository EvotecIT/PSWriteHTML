Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example32-01.html" {
    New-HTMLSection -Invisible {
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

} -ShowHTML -Online