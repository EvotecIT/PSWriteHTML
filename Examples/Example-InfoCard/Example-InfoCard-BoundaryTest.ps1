Import-Module ..\..\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLSection -HeaderText "InfoCard Boundary Respect Test" -Wrap wrap {
        New-HTMLSection -Invisible -Density Comfortable {
            New-HTMLInfoCard -Title "Total Applications" -Number 55 -Subtitle "In Panel 1" -Icon "📱" -IconColor '#0078d4'
            New-HTMLInfoCard -Title "App Registrations" -Number 63 -Subtitle "In Panel 2" -Icon "📋" -IconColor '#0078d4'
            New-HTMLInfoCard -Title "Enterprise Apps" -Number 45454 -Subtitle "In Panel 3" -Icon "🏢" -IconColor '#0078d4'
            New-HTMLInfoCard -Title "Microsoft Apps" -Number 123 -Subtitle "In Panel 4" -Icon "🏢" -IconColor '#0078d4'
        }
        New-HTMLSection -Invisible {
                New-HTMLInfoCard -Title "Managed Identities" -Number 13 -Subtitle "Should fit in panel" -Icon "🔐" -IconColor '#0078d4' -Style "Compact"
                New-HTMLInfoCard -Title "Apps w/ Delegated Permissions" -Number 19 -Subtitle "Should not overflow" -Icon "👥" -IconColor '#0078d4' -Style "Compact"
                New-HTMLInfoCard -Title "Apps w/ Application Permissions" -Number 500 -Subtitle "Fits nicely" -Icon "🔑" -IconColor '#0078d4' -Style "Compact"
                New-HTMLInfoCard -Title "Apps with No Sign-In Activity" -Number 2300 -Subtitle "Stays in bounds" -Icon "⚠️" -IconColor '#d13438' -Style "Compact"
        }
        New-HTMLSection -Invisible {
                New-HTMLInfoCard -Title "Managed Identities" -Number 13 -Subtitle "Should fit in panel" -Icon "🔐" -IconColor '#0078d4' -Style "Compact"
                New-HTMLInfoCard -Title "Apps w/ Delegated Permissions" -Number 19 -Subtitle "Should not overflow" -Icon "👥" -IconColor '#0078d4' -Style "Compact"
                New-HTMLInfoCard -Title "Apps w/ Application Permissions" -Number 500 -Subtitle "Fits nicely" -Icon "🔑" -IconColor '#0078d4' -Style "Compact"
                New-HTMLInfoCard -Title "Apps with No Sign-In Activity" -Number 2300 -Subtitle "Stays in bounds" -Icon "⚠️" -IconColor '#d13438' -Style "Compact"
        }
    }
} -FilePath "$PSScriptRoot\Example-InfoCard-BoundaryTest.html" -Online -Show