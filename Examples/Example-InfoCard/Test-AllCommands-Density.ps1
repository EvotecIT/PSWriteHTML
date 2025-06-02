Import-Module "$PSScriptRoot\..\..\PSWriteHTML.psd1" -Force

New-HTML {
    New-HTMLSection -HeaderText "🧪 Testing Density Parameter Across All Commands" -Wrap wrap {

        New-HTMLText -Text @"
<h3>Testing all three commands with the new Density parameter:</h3>
<ul>
<li><strong>New-HTMLSection</strong> - Main layout sections</li>
<li><strong>New-HTMLPanel</strong> - Individual panels within sections</li>
<li><strong>New-HTMLContainer</strong> - Generic containers</li>
</ul>
"@ -Color Black

        # Test New-HTMLSection with Density
        New-HTMLSection -HeaderText "✅ New-HTMLSection with Density = Comfortable" -Density Comfortable {
            New-HTMLInfoCard -Title "Section Test 1" -Number "100%" -Subtitle "Testing New-HTMLSection" -Icon "📝" -IconColor '#0078d4'
            New-HTMLInfoCard -Title "Section Test 2" -Number "100%" -Subtitle "With Density parameter" -Icon "📊" -IconColor '#0078d4'
            New-HTMLInfoCard -Title "Section Test 3" -Number "100%" -Subtitle "Should wrap nicely" -Icon "📈" -IconColor '#0078d4'
        }

        # Test New-HTMLPanel with Density
        New-HTMLSection -HeaderText "✅ New-HTMLPanel with Density = Dense" {
            New-HTMLPanel -Density Dense {
                New-HTMLInfoCard -Title "Panel Test A" -Number "✓" -Subtitle "Testing New-HTMLPanel" -Icon "🔧" -IconColor '#198754' -Style "Compact"
                New-HTMLInfoCard -Title "Panel Test B" -Number "✓" -Subtitle "With Density parameter" -Icon "⚙️" -IconColor '#198754' -Style "Compact"
                New-HTMLInfoCard -Title "Panel Test C" -Number "✓" -Subtitle "Dense layout works" -Icon "🛠️" -IconColor '#198754' -Style "Compact"
                New-HTMLInfoCard -Title "Panel Test D" -Number "✓" -Subtitle "More cards per row" -Icon "🔩" -IconColor '#198754' -Style "Compact"
                New-HTMLInfoCard -Title "Panel Test E" -Number "✓" -Subtitle "Efficient spacing" -Icon "🔨" -IconColor '#198754' -Style "Compact"
            }
        }

        # Test New-HTMLContainer with Density
        New-HTMLSection -HeaderText "✅ New-HTMLContainer with Density = Spacious" {
            New-HTMLContainer -Density Spacious {
                New-HTMLInfoCard -Title "Container Test I" -Number "OK" -Subtitle "Testing New-HTMLContainer" -Icon "📦" -IconColor '#6f42c1'
                New-HTMLInfoCard -Title "Container Test II" -Number "OK" -Subtitle "With Density parameter" -Icon "📋" -IconColor '#6f42c1'
                New-HTMLInfoCard -Title "Container Test III" -Number "OK" -Subtitle "Spacious layout" -Icon "📑" -IconColor '#6f42c1'
            }
        }

        # Test clean density-only approach
        New-HTMLSection -HeaderText "🎯 Clean Density-Only Approach" -Density VeryDense {
            New-HTMLInfoCard -Title "Clean 1" -Number "Perfect" -Subtitle "Only Density parameter needed" -Icon "🎯" -IconColor '#ffc107' -Style "Compact"
            New-HTMLInfoCard -Title "Clean 2" -Number "Simple" -Subtitle "No confusing parameters" -Icon "✨" -IconColor '#ffc107' -Style "Compact"
            New-HTMLInfoCard -Title "Clean 3" -Number "Intuitive" -Subtitle "Just pick density level" -Icon "🎨" -IconColor '#ffc107' -Style "Compact"
            New-HTMLInfoCard -Title "Clean 4" -Number "Easy" -Subtitle "VeryDense = small cards" -Icon "📏" -IconColor '#ffc107' -Style "Compact"
            New-HTMLInfoCard -Title "Clean 5" -Number "Nice" -Subtitle "Automatic wrapping" -Icon "🔄" -IconColor '#ffc107' -Style "Compact"
        }

        New-HTMLText -Text @"
<h3>📋 Test Results:</h3>
<ul>
<li>✅ <strong>New-HTMLSection</strong> supports Density parameter</li>
<li>✅ <strong>New-HTMLPanel</strong> supports Density parameter</li>
<li>✅ <strong>New-HTMLContainer</strong> supports Density parameter</li>
<li>✅ <strong>Clean API</strong> - no confusing MinItemsPerRow or ResponsiveWrap parameters!</li>
</ul>

<p><strong>🎯 Perfect!</strong> Simple, intuitive Density parameter works across all three commands.</p>
<p><em>Resize browser window to test responsive behavior.</em></p>
"@ -Color Black
    }
} -FilePath "$PSScriptRoot\Test-AllCommands-Density.html" -TitleText "Density Parameter Tests" -Online -Show