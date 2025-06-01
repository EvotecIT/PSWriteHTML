Import-Module "$PSScriptRoot\..\..\PSWriteHTML.psd1" -Force

New-HTML {
    New-HTMLSectionStyle -BorderRadius 0px -HeaderBackGroundColor 'DarkSlateGray'

    # Shadow Intensity Presets Section
    New-HTMLSection -HeaderText 'Shadow Intensity Presets' {
        New-HTMLSection -Invisible {
            # None - No shadow
            New-HTMLInfoCard -Title "No Shadow" -Number "Clean" -Subtitle "Minimal look" -Icon "💫" -ShadowIntensity 'None'

            # Subtle - Very light shadow
            New-HTMLInfoCard -Title "Subtle Shadow" -Number "Light" -Subtitle "Barely visible" -Icon "👻" -ShadowIntensity 'Subtle'

            # Normal - Standard shadow (default)
            New-HTMLInfoCard -Title "Normal Shadow" -Number "Standard" -Subtitle "Default setting" -Icon "📊" -ShadowIntensity 'Normal'

            # Bold - Strong, very visible shadow
            New-HTMLInfoCard -Title "Bold Shadow" -Number "Strong" -Subtitle "Very visible" -Icon "🎯" -ShadowIntensity 'Bold'

            # ExtraBold - Maximum impact shadow
            New-HTMLInfoCard -Title "Extra Bold" -Number "Maximum" -Subtitle "Super visible!" -Icon "💥" -ShadowIntensity 'ExtraBold'
        }
    }

    # Custom Shadow Controls Section
    New-HTMLSection -HeaderText 'Custom Shadow Controls' {
        New-HTMLSection -Invisible {
            # Custom blur radius
            New-HTMLInfoCard -Title "Custom Blur" -Number "Blur 20" -Subtitle "Very soft edges" -Icon "🌊" -ShadowIntensity 'Custom' -ShadowBlur 20 -ShadowColor 'rgba(0, 100, 200, 0.3)'

            # Custom spread
            New-HTMLInfoCard -Title "Custom Spread" -Number "Spread 6" -Subtitle "Extended shadow" -Icon "📡" -ShadowIntensity 'Custom' -ShadowBlur 12 -ShadowSpread 6 -ShadowColor 'rgba(200, 0, 100, 0.25)'

            # Extreme custom settings
            New-HTMLInfoCard -Title "Extreme Custom" -Number "Max Power" -Subtitle "All settings maxed" -Icon "⚡" -ShadowIntensity 'Custom' -ShadowBlur 25 -ShadowSpread 8 -ShadowColor 'rgba(255, 0, 0, 0.4)'
        }
    }

    # Bold Shadows with Different Directions
    New-HTMLSection -HeaderText 'Bold Shadows - All Directions' {
        New-HTMLSection -Invisible {
            New-HTMLInfoCard -Title "Bold Bottom" -Number "⬇️" -Subtitle "Downward impact" -Icon "📈" -ShadowIntensity 'Bold' -ShadowDirection 'Bottom'
            New-HTMLInfoCard -Title "Bold Top" -Number "⬆️" -Subtitle "Upward lift" -Icon "🚀" -ShadowIntensity 'Bold' -ShadowDirection 'Top'
            New-HTMLInfoCard -Title "Bold Left" -Number "⬅️" -Subtitle "Westward depth" -Icon "🌅" -ShadowIntensity 'Bold' -ShadowDirection 'Left'
            New-HTMLInfoCard -Title "Bold Right" -Number "➡️" -Subtitle "Eastward depth" -Icon "🌇" -ShadowIntensity 'Bold' -ShadowDirection 'Right'
            New-HTMLInfoCard -Title "Bold All Around" -Number "💡" -Subtitle "360° glow effect" -Icon "🔆" -ShadowIntensity 'Bold' -ShadowDirection 'All'
        }
    }

    # Colored Bold Shadows
    New-HTMLSection -HeaderText 'Colored Bold Shadows' {
        New-HTMLSection -Invisible {
            # Bold red shadow
            New-HTMLInfoCard -Title "Bold Red" -Number "Fire" -Subtitle "Intense red glow" -Icon "🔥" -ShadowIntensity 'Bold' -ShadowColor 'rgba(255, 0, 0, 0.4)'

            # Bold blue shadow
            New-HTMLInfoCard -Title "Bold Blue" -Number "Ocean" -Subtitle "Deep blue depth" -Icon "🌊" -ShadowIntensity 'Bold' -ShadowColor 'rgba(0, 100, 255, 0.4)'

            # Bold green shadow
            New-HTMLInfoCard -Title "Bold Green" -Number "Nature" -Subtitle "Forest green aura" -Icon "🌲" -ShadowIntensity 'Bold' -ShadowColor 'rgba(0, 200, 50, 0.4)'

            # Bold purple shadow
            New-HTMLInfoCard -Title "Bold Purple" -Number "Magic" -Subtitle "Mystical purple" -Icon "🔮" -ShadowIntensity 'Bold' -ShadowColor 'rgba(150, 0, 255, 0.4)'

            # Bold gold shadow
            New-HTMLInfoCard -Title "Bold Gold" -Number "Wealth" -Subtitle "Golden luxury" -Icon "👑" -ShadowIntensity 'Bold' -ShadowColor 'rgba(255, 215, 0, 0.5)'
        }
    }

    # ExtraBold Showcase
    New-HTMLSection -HeaderText 'ExtraBold - Maximum Impact' {
        New-HTMLSection -Invisible {
            New-HTMLInfoCard -Title "MAXIMUM IMPACT" -Number "100%" -Subtitle "Can't miss this shadow!" -Icon "💥" -ShadowIntensity 'ExtraBold' -ShadowColor 'rgba(0, 0, 0, 0.6)'
            New-HTMLInfoCard -Title "SUPER VISIBLE" -Number "BOLD" -Subtitle "Extremely prominent" -Icon "⚡" -ShadowIntensity 'ExtraBold' -ShadowColor 'rgba(255, 50, 50, 0.5)'
            New-HTMLInfoCard -Title "ULTRA DEPTH" -Number "DEEP" -Subtitle "Maximum 3D effect" -Icon "🎯" -ShadowIntensity 'ExtraBold' -ShadowDirection 'All'
        }
    }

} -FilePath "$PSScriptRoot\Example-InfoCard-ShadowShowcase.html" -TitleText "InfoCard Shadow Showcase" -Online -Show