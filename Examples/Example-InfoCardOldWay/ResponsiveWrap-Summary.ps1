Import-Module ..\..\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLSection -HeaderText "✅ SOLUTION: ResponsiveWrap for InfoCards" {

        New-HTMLText -Text @"
<h2>🎯 Problem Solved: InfoCards Now Respect Boundaries and Resize Properly!</h2>
<p><strong>Before:</strong> InfoCards would get cut off or overflow when resizing browser windows</p>
<p><strong>Now:</strong> InfoCards intelligently wrap to new rows and respect container boundaries</p>
"@ -Color Black

        # Demonstration: Traditional vs ResponsiveWrap
        New-HTMLSection -HeaderText "❌ OLD: Traditional Layout" {
            New-HTMLSection -Invisible {
                New-HTMLInfoCard -Title "Card 1" -Number "100%" -Subtitle "May get cut off" -Icon "📱" -IconColor '#d13438'
                New-HTMLInfoCard -Title "Card 2" -Number "100%" -Subtitle "Fixed layout" -Icon "📋" -IconColor '#d13438'
                New-HTMLInfoCard -Title "Card 3" -Number "100%" -Subtitle "No wrapping" -Icon "🏢" -IconColor '#d13438'
                New-HTMLInfoCard -Title "Card 4" -Number "100%" -Subtitle "Overflow issues" -Icon "⚙️" -IconColor '#d13438'
            }
        }

        New-HTMLSection -HeaderText "✅ NEW: ResponsiveWrap Layout" -ResponsiveWrap -MinItemsPerRow 3 {
            New-HTMLInfoCard -Title "Card 1" -Number "100%" -Subtitle "Respects boundaries" -Icon "📱" -IconColor '#198754'
            New-HTMLInfoCard -Title "Card 2" -Number "100%" -Subtitle "Wraps when needed" -Icon "📋" -IconColor '#198754'
            New-HTMLInfoCard -Title "Card 3" -Number "100%" -Subtitle "Perfect alignment" -Icon "🏢" -IconColor '#198754'
            New-HTMLInfoCard -Title "Card 4" -Number "100%" -Subtitle "Intelligent resize" -Icon "⚙️" -IconColor '#198754'
        }

        New-HTMLText -Text @"
<h3>🚀 Usage:</h3>
<pre><code>New-HTMLSection -ResponsiveWrap -MinItemsPerRow 3 {
    New-HTMLInfoCard -Title "Card 1" -Number 100 -Icon "📱"
    New-HTMLInfoCard -Title "Card 2" -Number 200 -Icon "📋"
    # Cards will wrap intelligently when resized!
}</code></pre>

<p><strong>Try resizing your browser window to see the difference!</strong></p>
"@ -Color Black
    }
} -FilePath "$PSScriptRoot\ResponsiveWrap-Summary.html" -TitleText "ResponsiveWrap Solution" -Online -Show