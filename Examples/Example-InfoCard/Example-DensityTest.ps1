Import-Module "$PSScriptRoot\..\..\PSWriteHTML.psd1" -Force

New-HTML {
    New-HTMLSection -HeaderText "🎯 New Density Parameter - Intuitive Layout Control!" -Wrap wrap {

        New-HTMLText -Text @"
<h3>✨ Much Better Than MinItemsPerRow!</h3>
<p>Instead of confusing numbers, use descriptive density names:</p>
<ul>
<li><strong>Spacious</strong> - Large cards, lots of breathing room</li>
<li><strong>Comfortable</strong> - Medium cards, balanced layout</li>
<li><strong>Compact</strong> - Smaller cards, efficient use of space</li>
<li><strong>Dense</strong> - Small cards, more content per row</li>
<li><strong>VeryDense</strong> - Tiny cards, maximum density</li>
</ul>
"@ -Color Black

        New-HTMLSection -HeaderText "📏 Spacious Density" -Density Spacious {
            New-HTMLInfoCard -Title "Identity Protection" -Number "Active" -Subtitle "Large cards with plenty of space" -Icon "🛡️" -IconColor '#0078d4'
            New-HTMLInfoCard -Title "Access Reviews" -Number "Enabled" -Subtitle "Roomy layout for better readability" -Icon "👥" -IconColor '#0078d4'
            New-HTMLInfoCard -Title "Authentication" -Number "Secure" -Subtitle "Spacious density for important content" -Icon "🔑" -IconColor '#0078d4'
        }

        New-HTMLSection -HeaderText "🏠 Comfortable Density" -Density Comfortable {
            New-HTMLInfoCard -Title "Microsoft Entra" -Number "100%" -Subtitle "Balanced card size" -Icon "🔷" -IconColor '#198754'
            New-HTMLInfoCard -Title "Tenant Settings" -Number "OK" -Subtitle "Comfortable spacing" -Icon "⚙️" -IconColor '#198754'
            New-HTMLInfoCard -Title "Permissions" -Number "Managed" -Subtitle "Good balance of space" -Icon "📁" -IconColor '#198754'
            New-HTMLInfoCard -Title "Security" -Number "High" -Subtitle "Neither too big nor small" -Icon "🔒" -IconColor '#198754'
        }

        New-HTMLSection -HeaderText "📦 Compact Density" -Density Compact {
            New-HTMLInfoCard -Title "Users" -Number "1,250" -Subtitle "Efficient layout" -Icon "👤" -IconColor '#6f42c1' -Style "Compact"
            New-HTMLInfoCard -Title "Groups" -Number "45" -Subtitle "Space-efficient" -Icon "👥" -IconColor '#6f42c1' -Style "Compact"
            New-HTMLInfoCard -Title "Apps" -Number "123" -Subtitle "Compact design" -Icon "📱" -IconColor '#6f42c1' -Style "Compact"
            New-HTMLInfoCard -Title "Devices" -Number "890" -Subtitle "Good density" -Icon "💻" -IconColor '#6f42c1' -Style "Compact"
            New-HTMLInfoCard -Title "Policies" -Number "12" -Subtitle "Organized layout" -Icon "📋" -IconColor '#6f42c1' -Style "Compact"
        }

        New-HTMLSection -HeaderText "🏗️ Dense Density" -Density Dense {
            New-HTMLInfoCard -Title "CPU" -Number "45%" -Subtitle "High density" -Icon "⚡" -IconColor '#ffc107' -Style "Compact"
            New-HTMLInfoCard -Title "Memory" -Number "67%" -Subtitle "More per row" -Icon "💾" -IconColor '#ffc107' -Style "Compact"
            New-HTMLInfoCard -Title "Disk" -Number "23%" -Subtitle "Dense layout" -Icon "💿" -IconColor '#ffc107' -Style "Compact"
            New-HTMLInfoCard -Title "Network" -Number "12%" -Subtitle "Packed tight" -Icon "🌐" -IconColor '#ffc107' -Style "Compact"
            New-HTMLInfoCard -Title "Uptime" -Number "99.9%" -Subtitle "Efficient use" -Icon "⏰" -IconColor '#ffc107' -Style "Compact"
            New-HTMLInfoCard -Title "Load" -Number "Low" -Subtitle "Maximum info" -Icon "📊" -IconColor '#ffc107' -Style "Compact"
        }

        New-HTMLSection -HeaderText "🔬 VeryDense Density" -Density VeryDense {
            New-HTMLInfoCard -Title "A1" -Number "✓" -Subtitle "Tiny cards" -Icon "1️⃣" -IconColor '#dc3545' -Style "Compact"
            New-HTMLInfoCard -Title "B2" -Number "✓" -Subtitle "Max density" -Icon "2️⃣" -IconColor '#dc3545' -Style "Compact"
            New-HTMLInfoCard -Title "C3" -Number "✓" -Subtitle "Lots of info" -Icon "3️⃣" -IconColor '#dc3545' -Style "Compact"
            New-HTMLInfoCard -Title "D4" -Number "✓" -Subtitle "In small space" -Icon "4️⃣" -IconColor '#dc3545' -Style "Compact"
            New-HTMLInfoCard -Title "E5" -Number "✓" -Subtitle "Very dense" -Icon "5️⃣" -IconColor '#dc3545' -Style "Compact"
            New-HTMLInfoCard -Title "F6" -Number "✓" -Subtitle "Compact view" -Icon "6️⃣" -IconColor '#dc3545' -Style "Compact"
            New-HTMLInfoCard -Title "G7" -Number "✓" -Subtitle "Dashboard" -Icon "7️⃣" -IconColor '#dc3545' -Style "Compact"
            New-HTMLInfoCard -Title "H8" -Number "✓" -Subtitle "Overview" -Icon "8️⃣" -IconColor '#dc3545' -Style "Compact"
        }

        New-HTMLText -Text @"
<h3>📝 How to Use:</h3>
<pre><code># Old way (confusing):
New-HTMLSection -MinItemsPerRow 2 { }

# New way (intuitive):
New-HTMLSection -Density Spacious { }
New-HTMLPanel -Density Comfortable { }
New-HTMLContainer -Density Dense { }</code></pre>

<p><strong>🎯 Perfect!</strong> Now the parameter name matches what it does - control the density/spacing of your layout!</p>
<p><em>Resize your browser window to see responsive behavior in action.</em></p>
"@ -Color Black
    }
} -FilePath "$PSScriptRoot\Example-DensityTest.html" -TitleText "Density Parameter Demo" -Online -Show