Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'Enhanced JustGage Features Demo' -FilePath "$PSScriptRoot\Example-Gages-Enhanced.html" {
    New-HTMLSection -HeaderText "Basic Gages with Sizing" -Invisible {
        New-HTMLPanel {
            New-HTMLText -Text 'Standard Size' -Color Red -Alignment center -FontSize 16px
            New-HTMLGage -Label 'CPU Usage' -MinValue 0 -MaxValue 100 -Value 75 -Counter
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Custom Width & Height' -Color Blue -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Memory Usage' -MinValue 0 -MaxValue 100 -Value 60 -Counter -Width 200 -Height 150
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Large Size' -Color Green -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Disk Usage' -MinValue 0 -MaxValue 100 -Value 45 -Counter -Width 250 -Height 200
        }
    }

    New-HTMLSection -HeaderText "Target Line Feature" -Invisible {
        New-HTMLPanel {
            New-HTMLText -Text 'Performance with Target' -Color Purple -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Performance Score' -MinValue 0 -MaxValue 100 -Value 65 -TargetLine 80 -TargetLineColor "red" -TargetLineWidth 3 -Counter
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Sales with Goal' -Color Orange -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Sales Target' -MinValue 0 -MaxValue 1000 -Value 750 -TargetLine 900 -TargetLineColor "green" -TargetLineWidth 2 -ValueSymbol '$'
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Multiple Targets' -Color DarkBlue -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Quality Score' -MinValue 0 -MaxValue 100 -Value 85 -TargetLine 75 -TargetLineColor "blue" -TargetLineWidth 4
        }
    }

    New-HTMLSection -HeaderText "Level Colors (Default Gradients)" -Invisible {
        New-HTMLPanel {
            New-HTMLText -Text 'Red-Yellow-Green' -Color Black -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Server Health' -MinValue 0 -MaxValue 100 -Value 30 -LevelColors @("red", "yellow", "green") -Counter
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Blue-Purple-Pink' -Color Black -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Custom Colors' -MinValue 0 -MaxValue 100 -Value 70 -LevelColors @("blue", "purple", "pink") -Counter
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Multi-Color Gradient' -Color Black -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Progress' -MinValue 0 -MaxValue 100 -Value 50 -LevelColors @("darkred", "orange", "yellow", "lightgreen", "green") -Counter
        }
    }

    New-HTMLSection -HeaderText "Animation Settings" -Invisible {
        New-HTMLPanel {
            New-HTMLText -Text 'Fast Animation' -Color Red -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Quick Load' -MinValue 0 -MaxValue 100 -Value 80 -StartAnimationTime 300 -StartAnimationType "bounce" -Counter
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Slow Animation' -Color Blue -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Smooth Load' -MinValue 0 -MaxValue 100 -Value 60 -StartAnimationTime 1500 -StartAnimationType "<>" -Counter
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Linear Animation' -Color Green -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Linear Progress' -MinValue 0 -MaxValue 100 -Value 90 -StartAnimationTime 1000 -StartAnimationType "linear" -Counter
        }
    }

    New-HTMLSection -HeaderText "Donut Gages with Start Angle" -Invisible {
        New-HTMLPanel {
            New-HTMLText -Text 'Default Start (90°)' -Color Purple -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Standard Donut' -Type Donut -MinValue 0 -MaxValue 100 -Value 75 -Counter
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Start at 0°' -Color Orange -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Right Start' -Type Donut -MinValue 0 -MaxValue 100 -Value 60 -DonutStartAngle 0 -Counter
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Start at 180°' -Color DarkRed -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Bottom Start' -Type Donut -MinValue 0 -MaxValue 100 -Value 45 -DonutStartAngle 180 -Counter
        }
    }

    New-HTMLSection -HeaderText "Font Size Controls" -Invisible {
        New-HTMLPanel {
            New-HTMLText -Text 'Large Value Font' -Color Navy -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Big Numbers' -MinValue 0 -MaxValue 100 -Value 85 -ValueMinFontSize 24 -LabelMinFontSize 14 -Counter
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Small Fonts' -Color Maroon -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Compact Display' -MinValue 0 -MaxValue 100 -Value 55 -ValueMinFontSize 12 -LabelMinFontSize 8 -MinLabelMinFontSize 6 -MaxLabelMinFontSize 6
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Mixed Font Sizes' -Color DarkGreen -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Custom Sizing' -MinValue 0 -MaxValue 100 -Value 70 -ValueMinFontSize 20 -LabelMinFontSize 12 -MinLabelMinFontSize 8 -MaxLabelMinFontSize 8
        }
    }

    New-HTMLSection -HeaderText "Differential Mode" -Invisible {
        New-HTMLPanel {
            New-HTMLText -Text 'Normal Fill (from min)' -Color Black -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Standard' -MinValue -50 -MaxValue 50 -Value 25 -Counter
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Differential Fill (from center)' -Color Black -Alignment center -FontSize 16px
            New-HTMLGage -Label 'From Center' -MinValue -50 -MaxValue 50 -Value 25 -Differential -Counter
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Negative Differential' -Color Black -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Negative Value' -MinValue -50 -MaxValue 50 -Value -15 -Differential -Counter
        }
    }

    New-HTMLSection -HeaderText "Combined Advanced Features" -Invisible {
        New-HTMLPanel {
            New-HTMLText -Text 'Ultimate Gage' -Color DarkBlue -Alignment center -FontSize 18px
            New-HTMLGage -Label 'System Performance' -MinValue 0 -MaxValue 100 -Value 78 -Counter -Width 300 -Height 250 -TargetLine 85 -TargetLineColor "red" -TargetLineWidth 3 -LevelColors @("red", "orange", "yellow", "lightgreen", "green") -StartAnimationTime 1200 -StartAnimationType "bounce" -ValueMinFontSize 22 -LabelMinFontSize 14 -ValueSymbol '%'
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Donut with All Features' -Color DarkRed -Alignment center -FontSize 18px
            New-HTMLGage -Label 'Revenue Target' -Type Donut -MinValue 0 -MaxValue 1000000 -Value 750000 -Counter -Width 280 -Height 240 -TargetLine 900000 -TargetLineColor "blue" -TargetLineWidth 4 -DonutStartAngle 45 -HumanFriendly -ValueSymbol '$' -StartAnimationTime 1500 -StartAnimationType "<>"
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Differential with Target' -Color DarkGreen -Alignment center -FontSize 18px
            New-HTMLGage -Label 'Profit/Loss' -MinValue -100 -MaxValue 100 -Value 35 -Differential -Counter -Width 260 -Height 220 -TargetLine 50 -TargetLineColor "green" -TargetLineWidth 2 -LevelColors @("darkred", "red", "yellow", "lightgreen", "green") -ValueSymbol '%'
        }
    }

    New-HTMLSection -HeaderText "Custom Sectors with New Features" -Invisible {
        New-HTMLPanel {
            New-HTMLText -Text 'Sectors with Target Line' -Color Purple -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Quality Score' -Value 65 -Counter -TargetLine 75 -TargetLineColor "black" -TargetLineWidth 2 -Width 200 -Height 160 {
                New-GageSector -Color "red" -Min 0 -Max 40
                New-GageSector -Color "yellow" -Min 41 -Max 70
                New-GageSector -Color "green" -Min 71 -Max 100
            }
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Animated Sectors' -Color Orange -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Performance' -Value 85 -Counter -StartAnimationTime 2000 -StartAnimationType "bounce" -Width 220 -Height 180 {
                New-GageSector -Color "darkred" -Min 0 -Max 25
                New-GageSector -Color "orange" -Min 26 -Max 50
                New-GageSector -Color "yellow" -Min 51 -Max 75
                New-GageSector -Color "lightgreen" -Min 76 -Max 90
                New-GageSector -Color "green" -Min 91 -Max 100
            }
        }
        New-HTMLPanel {
            New-HTMLText -Text 'Donut Sectors with Features' -Color DarkBlue -Alignment center -FontSize 16px
            New-HTMLGage -Label 'Status' -Type Donut -Value 70 -Counter -DonutStartAngle 270 -TargetLine 80 -TargetLineColor "red" -Width 240 -Height 200 {
                New-GageSector -Color "red" -Min 0 -Max 50
                New-GageSector -Color "yellow" -Min 51 -Max 75
                New-GageSector -Color "green" -Min 76 -Max 100
            }
        }
    }
} -ShowHTML -Online
