Import-Module "$PSScriptRoot\..\..\PSWriteHTML.psd1" -Force

New-HTML {
    New-HTMLHeader {
        New-HTMLSection -Invisible {
            New-HTMLPanel -Invisible {
                New-HTMLImage -Source 'https://evotec.pl/wp-content/uploads/2015/05/Logo-evotec-012.png' -UrlLink 'https://evotec.pl/' -AlternativeText 'My other text' -Class 'otehr' -Width '50%'
            }
            New-HTMLPanel -Invisible {
                New-HTMLImage -Source 'https://evotec.pl/wp-content/uploads/2015/05/Logo-evotec-012.png' -UrlLink 'https://evotec.pl/' -AlternativeText 'My other text' -Width '20%'
            } -AlignContentText right
        }
        New-HTMLPanel {
            New-HTMLText -Text "Report generated on ", (New-HTMLDate -InputDate (Get-Date)) -Color None, Blue -FontSize 10, 10
            New-HTMLText -Text "Report generated on ", (New-HTMLDate -InputDate (Get-Date -Year 2022)) -Color None, Blue -FontSize 10, 10
            New-HTMLText -Text "Report generated on ", (New-HTMLDate -InputDate (Get-Date -Year 2022) -DoNotIncludeFromNow) -Color None, Blue -FontSize 10, 10
            New-HTMLText -Text "Report generated on ", (New-HTMLDate -InputDate (Get-Date -Year 2024 -Month 11)) -Color None, Blue -FontSize 10, 10
        } -Invisible -AlignContentText right
    }
    New-HTMLSectionStyle -BorderRadius 0px -HeaderBackGroundColor '#0078d4'

    # Feature highlights section - now with ResponsiveWrap
    New-HTMLSection -Density Dense {
        # Identity Protection
        New-HTMLInfoCard -Title "Identity Protection" -Subtitle "View risky users, risky workload identities, and risky sign-ins in your tenant." -Icon "🛡️" -IconColor "#0078d4" -Style "Standard" -ShadowIntensity 'Normal' -BorderRadius 2px

        # Access reviews
        New-HTMLInfoCard -Title "Access reviews" -Subtitle "Make sure only the right people have continued access." -Icon "👥" -IconColor "#0078d4" -Style "Standard" -ShadowIntensity 'Normal' -BorderRadius 2px

        # Authentication methods
        New-HTMLInfoCard -Title "Authentication methods" -Subtitle "Configure your users in the authentication methods policy to enable passwordless authentication." -Icon "🔑" -IconColor "#0078d4" -Style "Standard" -ShadowIntensity 'Normal' -BorderRadius 2px

        # Microsoft Entra Domain Services
        New-HTMLInfoCard -Title "Microsoft Entra Domain Services" -Subtitle "Lift-and-shift legacy applications running on-premises into Azure." -Icon "🔷" -IconColor "#0078d4" -Style "Standard" -ShadowIntensity 'Normal' -BorderRadius 2px

        # Tenant restrictions
        New-HTMLInfoCard -Title "Tenant restrictions" -Subtitle "Specify the list of tenants that their users are permitted to access." -Icon "🚫" -IconColor "#dc3545" -Style "Standard" -ShadowIntensity 'Normal' -BorderRadius 2px

        # Entra Permissions Management
        New-HTMLInfoCard -Title "Entra Permissions Management" -Subtitle "Continuous protection of your critical cloud resources from accidental misuse and malicious exploitation of permissions." -Icon "📁" -IconColor "#198754" -Style "Standard" -ShadowIntensity 'Normal' -BorderRadius 2px

        # Privileged Identity Management
        New-HTMLInfoCard -Title "Privileged Identity Management" -Subtitle "Manage, control, and monitor access to important resources in your organization." -Icon "💎" -IconColor "#6f42c1" -Style "Standard" -ShadowIntensity 'Normal' -BorderRadius 2px

        # Conditional Access
        New-HTMLInfoCard -Title "Conditional Access" -Subtitle "Control user access based on Conditional Access policy to bring signals together, to make decisions, and enforce organizational policies." -Icon "🔒" -IconColor "#0078d4" -Style "Standard" -ShadowIntensity 'Normal' -BorderRadius 2px
    }


    # Additional services section
    New-HTMLSection -HeaderText 'Additional Services' {
        New-HTMLSection -Density Spacious {
            # Try Microsoft Entra admin center
            New-HTMLInfoCard -Title "Try Microsoft Entra admin center" -Subtitle "Secure your identity environment with Microsoft Entra ID, permissions management and more." -Icon "🔧" -IconColor "#0078d4" -Style "Standard" -ShadowIntensity 'Normal' -BorderRadius 2px

            # User Profile Card
            New-HTMLInfoCard -Title "Przemysław Klys" -Subtitle "e6a8f1cf-0874-4323-a12f-2bf51bb6dfdd | Global Administrator and 2 other roles" -Icon "👤" -IconColor "#6c757d" -Style "Standard" -ShadowIntensity 'Normal' -BorderRadius 2px

            # Secure Score
            New-HTMLInfoCard -Title "Secure Score for Identity" -Number "28.21%" -Subtitle "Secure score updates can take up to 48 hours." -Icon "🏆" -IconColor "#ffc107" -Style "Standard" -ShadowIntensity 'Normal' -BorderRadius 2px

            # Microsoft Entra Connect
            New-HTMLInfoCard -Title "Microsoft Entra Connect" -Number "✅ Enabled" -Subtitle "Last sync was less than 1 hour ago" -Icon "🔄" -IconColor "#198754" -Style "Standard" -ShadowIntensity 'Normal' -BorderRadius 2px
        }
    }

    # Enhanced styling showcase with different shadow intensities
    New-HTMLSection -HeaderText 'Enhanced Visual Showcase' {
        New-HTMLSection -Density Spacious {
            # ExtraNormal shadows for high-priority items
            New-HTMLInfoCard -Title "HIGH PRIORITY" -Number "Critical" -Subtitle "Maximum visibility shadow" -Icon "⚠️" -IconColor "#dc3545" -ShadowIntensity 'Normal' -ShadowColor 'rgba(220, 53, 69, 0.4)' -BorderRadius 2px

            # Normal colored shadows
            New-HTMLInfoCard -Title "Security Alert" -Number "Active" -Subtitle "Normal red shadow for attention" -Icon "🔴" -IconColor "#dc3545" -ShadowIntensity 'Normal' -ShadowColor 'rgba(220, 53, 69, 0.3)' -BorderRadius 2px

            # Normal with custom color
            New-HTMLInfoCard -Title "Performance" -Number "Good" -Subtitle "Green shadow indicates success" -Icon "✅" -IconColor "#198754" -ShadowIntensity 'Normal' -ShadowColor 'rgba(25, 135, 84, 0.3)' -BorderRadius 2px

            # Custom shadow settings
            New-HTMLInfoCard -Title "Custom Styling" -Number "Advanced" -Subtitle "Custom blur and spread values" -Icon "🎨" -IconColor "#6f42c1" -ShadowIntensity 'Custom' -ShadowBlur 15 -ShadowSpread 3 -ShadowColor 'rgba(111, 66, 193, 0.25)' -BorderRadius 2px
        }
    }

} -FilePath "$PSScriptRoot\Example-MicrosoftEntra.html" -TitleText "Microsoft Entra Interface Recreation" -Online -Show