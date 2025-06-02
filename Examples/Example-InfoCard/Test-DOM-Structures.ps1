Import-Module "$PSScriptRoot\..\..\PSWriteHTML.psd1" -Force

New-HTML {
    New-HTMLSection -HeaderText "🔍 DOM Structure Differences - All Working Now!" -Wrap nowrap {

        New-HTMLText -Text @"
<h3>📋 Testing Different DOM Structures:</h3>
<p>Each command creates a different DOM structure, so we needed CSS rules for both:</p>
<ul>
<li><strong>Sections:</strong> <code>.responsive-wrap-container > .collapsable > .flexPanel</code></li>
<li><strong>Panels/Containers:</strong> <code>.responsive-wrap-container > .flexPanel</code></li>
</ul>
"@ -Color Black

        # Test 1: New-HTMLSection (has .collapsable wrapper)
        New-HTMLSection -HeaderText "✅ Section with Density = Dense" -Density Dense {
            New-HTMLInfoCard -Title "Section A" -Number "Works!" -Subtitle "Has .collapsable wrapper" -Icon "📝" -IconColor '#0078d4' -Style "Compact"
            New-HTMLInfoCard -Title "Section B" -Number "Works!" -Subtitle "Dense spacing" -Icon "📊" -IconColor '#0078d4' -Style "Compact"
            New-HTMLInfoCard -Title "Section C" -Number "Works!" -Subtitle "Small cards" -Icon "📈" -IconColor '#0078d4' -Style "Compact"
            New-HTMLInfoCard -Title "Section D" -Number "Works!" -Subtitle "More per row" -Icon "📉" -IconColor '#0078d4' -Style "Compact"
            New-HTMLInfoCard -Title "Section E" -Number "Works!" -Subtitle "Dense layout" -Icon "📋" -IconColor '#0078d4' -Style "Compact"
        }

        # Test 2: New-HTMLPanel (direct .flexPanel children)
        New-HTMLSection -HeaderText "✅ Panel with Density = Comfortable" {
            New-HTMLPanel -Density Comfortable {
                New-HTMLInfoCard -Title "Panel 1" -Number "Fixed!" -Subtitle "Direct .flexPanel child" -Icon "🔧" -IconColor '#198754'
                New-HTMLInfoCard -Title "Panel 2" -Number "Fixed!" -Subtitle "Comfortable spacing" -Icon "⚙️" -IconColor '#198754'
                New-HTMLInfoCard -Title "Panel 3" -Number "Fixed!" -Subtitle "Medium sized cards" -Icon "🛠️" -IconColor '#198754'
                New-HTMLInfoCard -Title "Panel 4" -Number "Fixed!" -Subtitle "Good balance" -Icon "🔩" -IconColor '#198754'
            }
        }

        # Test 3: New-HTMLContainer (also direct .flexPanel children)
        New-HTMLSection -HeaderText "✅ Container with Density = Spacious" {
            New-HTMLContainer -Density Spacious {
                New-HTMLInfoCard -Title "Container I" -Number "Perfect" -Subtitle "Also direct .flexPanel" -Icon "📦" -IconColor '#6f42c1'
                New-HTMLInfoCard -Title "Container II" -Number "Perfect" -Subtitle "Spacious layout" -Icon "📋" -IconColor '#6f42c1'
                New-HTMLInfoCard -Title "Container III" -Number "Perfect" -Subtitle "Large cards" -Icon "📑" -IconColor '#6f42c1'
            }
        }

        # Test 4: Mixed densities in one section
        New-HTMLSection -HeaderText "🎯 Mixed Test - All Working Together" -Density VeryDense {
            New-HTMLInfoCard -Title "Mix 1" -Number "Great!" -Subtitle "VeryDense section" -Icon "1️⃣" -IconColor '#dc3545' -Style "Compact"
            New-HTMLInfoCard -Title "Mix 2" -Number "Great!" -Subtitle "Tiny cards" -Icon "2️⃣" -IconColor '#dc3545' -Style "Compact"
            New-HTMLInfoCard -Title "Mix 3" -Number "Great!" -Subtitle "Maximum density" -Icon "3️⃣" -IconColor '#dc3545' -Style "Compact"
            New-HTMLInfoCard -Title "Mix 4" -Number "Great!" -Subtitle "Lots per row" -Icon "4️⃣" -IconColor '#dc3545' -Style "Compact"
            New-HTMLInfoCard -Title "Mix 5" -Number "Great!" -Subtitle "Efficient layout" -Icon "5️⃣" -IconColor '#dc3545' -Style "Compact"
            New-HTMLInfoCard -Title "Mix 6" -Number "Great!" -Subtitle "Perfect wrapping" -Icon "6️⃣" -IconColor '#dc3545' -Style "Compact"
            New-HTMLInfoCard -Title "Mix 7" -Number "Great!" -Subtitle "All working now" -Icon "7️⃣" -IconColor '#dc3545' -Style "Compact"
            New-HTMLInfoCard -Title "Mix 8" -Number "Great!" -Subtitle "CSS fixed!" -Icon "8️⃣" -IconColor '#dc3545' -Style "Compact"
        }

        New-HTMLText -Text @"
<h3>🎯 Problem Solved!</h3>
<p><strong>CSS Fix Applied:</strong> Added rules for both DOM structures</p>
<ul>
<li>✅ <strong>Sections</strong> work (with .collapsable wrapper)</li>
<li>✅ <strong>Panels</strong> work (direct .flexPanel children)</li>
<li>✅ <strong>Containers</strong> work (direct .flexPanel children)</li>
</ul>
<p><em>Resize browser window to test responsive behavior on all types!</em></p>
"@ -Color Black
    }
} -FilePath "$PSScriptRoot\Test-DOM-Structures.html" -TitleText "DOM Structure Tests" -Online -Show