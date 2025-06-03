Import-Module "$PSScriptRoot\..\..\PSWriteHTML.psd1" -Force

# Create advanced examples file
New-HTML {
    New-HTMLSectionStyle -BorderRadius 0px -HeaderBackGroundColor 'SlateGray'

    # Enhanced Shadow Visibility Section
    New-HTMLSection -HeaderText 'Enhanced Shadow Examples' {
        New-HTMLSection -Invisible -Density Comfortable {
            # Subtle shadow (original)
            New-HTMLInfoCard -Title "Subtle Shadow" -Number "Original" -Subtitle "0.08 opacity" -Icon "👻" -ShadowColor 'rgba(60, 60, 60, 0.08)'

            # Enhanced shadow (new default)
            New-HTMLInfoCard -Title "Enhanced Shadow" -Number "New Default" -Subtitle "0.15 opacity" -Icon "💫" -ShadowColor 'rgba(60, 60, 60, 0.15)'

            # Strong shadow
            New-HTMLInfoCard -Title "Strong Shadow" -Number "Bold" -Subtitle "0.25 opacity" -Icon "🎯" -ShadowColor 'rgba(60, 60, 60, 0.25)'

            # Colored shadow
            New-HTMLInfoCard -Title "Colored Shadow" -Number "Blue" -Subtitle "Custom color" -Icon "💙" -ShadowColor 'rgba(30, 144, 255, 0.2)'
        }
    }

    # Color Format Support Section
    New-HTMLSection -HeaderText 'Flexible Color Format Support' {
        New-HTMLSection -Density Comfortable {
            # 3-character hex codes
            New-HTMLInfoCard -Title "Short Hex" -Number "999" -Subtitle "3-char format" -Icon "🎨" -TitleColor '#f00' -NumberColor '#0a0' -SubtitleColor '#00f'

            # 6-character hex codes
            New-HTMLInfoCard -Title "Long Hex" -Number "100%" -Subtitle "6-char format" -Icon "🌈" -TitleColor '#ff6600' -NumberColor '#009900' -SubtitleColor '#6600ff'

            # RGBA colors
            New-HTMLInfoCard -Title "RGBA Colors" -Number "Alpha" -Subtitle "Transparency support" -Icon "🔮" -TitleColor 'rgba(255, 0, 0, 0.8)' -NumberColor 'rgba(0, 150, 0, 0.9)' -SubtitleColor 'rgba(0, 0, 255, 0.7)'

            # Named colors (existing support)
            New-HTMLInfoCard -Title "Named Colors" -Number "Classic" -Subtitle "Standard names" -Icon "📝" -TitleColor 'DarkSlateBlue' -NumberColor 'DarkGreen' -SubtitleColor 'DarkOrange'
        }
    }

    # Shadow Direction with Enhanced Visibility
    New-HTMLSection -HeaderText 'Directional Shadows (Enhanced)' {
        New-HTMLSection -Invisible -Density Spacious {
            New-HTMLInfoCard -Title "Bottom Shadow" -Number "Default" -Subtitle "Standard direction" -Icon "⬇️" -ShadowDirection 'Bottom' -ShadowColor 'rgba(0, 0, 0, 0.2)'
            New-HTMLInfoCard -Title "Top Shadow" -Number "Upward" -Subtitle "Above the card" -Icon "⬆️" -ShadowDirection 'Top' -ShadowColor 'rgba(255, 0, 0, 0.15)' -ShadowIntensity ExtraBold
            New-HTMLInfoCard -Title "Left Shadow" -Number "Westward" -Subtitle "To the left" -Icon "⬅️" -ShadowDirection 'Left' -ShadowColor 'rgba(0, 255, 0, 0.15)' -ShadowIntensity Bold
            New-HTMLInfoCard -Title "Right Shadow" -Number "Eastward" -Subtitle "To the right" -Icon "➡️" -ShadowDirection 'Right' -ShadowColor 'rgba(0, 0, 255, 0.15)'
            New-HTMLInfoCard -Title "All Around" -Number "Glow" -Subtitle "360° shadow" -Icon "💡" -ShadowDirection 'All' -ShadowColor 'rgba(255, 215, 0, 0.3)'
        }
    }

} -FilePath "$PSScriptRoot\Example-InfoCard-Advanced.html" -TitleText "Advanced InfoCard Features" -Online -Show