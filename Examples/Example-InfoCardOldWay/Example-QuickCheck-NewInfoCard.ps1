Import-Module ..\..\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLSection -HeaderText "Application Overview" {
        New-HTMLSection -Invisible {
            New-HTMLPanel { New-HTMLInfoCard -Title "Total Applications" -Number 55 -Subtitle "Active Apps" -Icon "📱" -IconColor '#0078d4' }
            New-HTMLPanel { New-HTMLInfoCard -Title "App Registrations" -Number 63 -Subtitle "Registered" -Icon "📋" -IconColor '#0078d4' }
            New-HTMLPanel { New-HTMLInfoCard -Title "Enterprise Apps" -Number 45454 -Subtitle "Enterprise" -Icon "🏢" -IconColor '#0078d4' }
            New-HTMLPanel { New-HTMLInfoCard -Title "Microsoft Apps" -Number 123 -Subtitle "Official" -Icon "Ⓜ️" -IconColor '#0078d4' }
        }
        New-HTMLSection -Invisible {
            New-HTMLPanel { New-HTMLInfoCard -Title "Managed Identities" -Number 13 -Subtitle "System Managed" -Icon "🔐" -IconColor '#0078d4' }
            New-HTMLPanel { New-HTMLInfoCard -Title "Apps w/ Delegated Permissions" -Number 19 -Subtitle "User Consent" -Icon "👥" -IconColor '#0078d4' }
            New-HTMLPanel { New-HTMLInfoCard -Title "Apps w/ Application Permissions" -Number 500 -Subtitle "Admin Consent" -Icon "🔑" -IconColor '#0078d4' }
            New-HTMLPanel { New-HTMLInfoCard -Title "Apps with No Sign-In Activity" -Number 2300 -Subtitle "Inactive" -Icon "⚠️" -IconColor '#d13438' }
        }
    }
} -FilePath "$PSScriptRoot\Example-QuickCheck-NewInfoCard.html" -Online -Show