Import-Module ..\..\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLSection -HeaderText "ResponsiveWrap Test - Resize Browser to See Effect" -Wrap wrap {

        # Row 1: 4 cards with ResponsiveWrap - should wrap intelligently
        New-HTMLSection -HeaderText "Row 1: ResponsiveWrap (MinItemsPerRow = 3)" -Density Spacious {
            New-HTMLInfoCard -Title "Total Applications" -Number 55 -Subtitle "Should wrap nicely" -Icon "📱" -IconColor '#0078d4'
            New-HTMLInfoCard -Title "App Registrations" -Number 63 -Subtitle "Responsive behavior" -Icon "📋" -IconColor '#0078d4'
            New-HTMLInfoCard -Title "Enterprise Apps" -Number 45454 -Subtitle "Auto wrap when needed" -Icon "🏢" -IconColor '#0078d4'
            New-HTMLInfoCard -Title "Microsoft Apps" -Number 123 -Subtitle "Intelligent layout" -Icon "Ⓜ️" -IconColor '#0078d4'
        }

        # Row 2: Same cards with traditional Invisible section for comparison
        New-HTMLSection -HeaderText "Row 2: Traditional Invisible (No ResponsiveWrap)" -Density Spacious {
            New-HTMLSection -Invisible {
                New-HTMLInfoCard -Title "Total Applications" -Number 55 -Subtitle "Traditional layout" -Icon "📱" -IconColor '#d13438'
                New-HTMLInfoCard -Title "App Registrations" -Number 63 -Subtitle "May get cut off" -Icon "📋" -IconColor '#d13438'
                New-HTMLInfoCard -Title "Enterprise Apps" -Number 45454 -Subtitle "No intelligent wrap" -Icon "🏢" -IconColor '#d13438'
                New-HTMLInfoCard -Title "Microsoft Apps" -Number 123 -Subtitle "Fixed layout" -Icon "Ⓜ️" -IconColor '#d13438'
            }
        }

        # Row 3: ResponsiveWrap with more cards - MinItemsPerRow = 2
        New-HTMLSection -HeaderText "Row 3: ResponsiveWrap (MinItemsPerRow = 2)" -Density Spacious {
            New-HTMLInfoCard -Title "Managed Identities" -Number 13 -Subtitle "Min 2 per row" -Icon "🔐" -IconColor '#198754' -Style "Compact"
            New-HTMLInfoCard -Title "Delegated Permissions" -Number 19 -Subtitle "Better responsive" -Icon "👥" -IconColor '#198754' -Style "Compact"
            New-HTMLInfoCard -Title "Application Permissions" -Number 500 -Subtitle "Wraps at smaller sizes" -Icon "🔑" -IconColor '#198754' -Style "Compact"
            New-HTMLInfoCard -Title "No Sign-In Activity" -Number 2300 -Subtitle "Maintains alignment" -Icon "⚠️" -IconColor '#198754' -Style "Compact"
            New-HTMLInfoCard -Title "Security Alerts" -Number 5 -Subtitle "Extra card for demo" -Icon "🛡️" -IconColor '#198754' -Style "Compact"
            New-HTMLInfoCard -Title "Active Users" -Number 1250 -Subtitle "Shows wrapping behavior" -Icon "👤" -IconColor '#198754' -Style "Compact"
        }

        # Row 4: Mixed content with ResponsiveWrap
        New-HTMLSection -HeaderText "Row 4: Mixed Content with ResponsiveWrap" -Density Spacious {
            New-HTMLInfoCard -Title "Performance" -Number "Excellent" -Subtitle "Good performance" -Icon "📊" -IconColor '#6f42c1' -Style "Fixed"
            New-HTMLInfoCard -Title "Uptime" -Number "99.9%" -Subtitle "High availability" -Icon "⏰" -IconColor '#6f42c1' -Style "Fixed"
            New-HTMLInfoCard -Title "Users Online" -Number 847 -Subtitle "Active right now" -Icon "🌐" -IconColor '#6f42c1' -Style "Fixed"
            New-HTMLInfoCard -Title "System Health" -Number "Healthy" -Subtitle "All systems operational" -Icon "✅" -IconColor '#6f42c1' -Style "Fixed"
        }
    }

    New-HTMLSection -HeaderText "Instructions" {
        New-HTMLText -Text @"
<h3>How to Test:</h3>
<ol>
<li><strong>Resize your browser window</strong> from wide to narrow</li>
<li><strong>Row 1 & 3 & 4</strong> use ResponsiveWrap - cards should intelligently wrap to new lines when space runs out</li>
<li><strong>Row 2</strong> uses traditional Invisible section - cards may get cut off or become too cramped</li>
<li><strong>MinItemsPerRow parameter</strong> controls minimum cards per row before wrapping:
   <ul>
   <li>Row 1: MinItemsPerRow = 3 (tries to keep 3+ cards per row)</li>
   <li>Row 3: MinItemsPerRow = 2 (tries to keep 2+ cards per row)</li>
   <li>Row 4: MinItemsPerRow = 4 (tries to keep 4+ cards per row)</li>
   </ul>
</li>
<li><strong>On mobile devices</strong> (< 768px), all cards should stack vertically</li>
</ol>
"@ -Color Black
    }
} -FilePath "$PSScriptRoot\Example-ResponsiveWrap-Test.html" -Online -Show