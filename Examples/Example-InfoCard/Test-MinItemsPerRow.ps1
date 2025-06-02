Import-Module "$PSScriptRoot\..\..\PSWriteHTML.psd1" -Force

New-HTML {
    New-HTMLText -Text "<p><strong>Resize the browser window to see responsive behavior!</strong></p>" -Color Black
    New-HTMLSection -HeaderText "Testing MinItemsPerRow Auto-Enable" -Wrap wrap {

        New-HTMLSection -HeaderText "Test 1" -Density VeryDense {
            New-HTMLInfoCard -Title "Card 1" -Number "50%" -Subtitle "Should be half width" -Icon "📱" -IconColor '#0078d4'
            New-HTMLInfoCard -Title "Card 2" -Number "50%" -Subtitle "Should be half width" -Icon "📋" -IconColor '#0078d4'
            New-HTMLInfoCard -Title "Card 3" -Number "50%" -Subtitle "Should wrap to new row" -Icon "🏢" -IconColor '#0078d4'
            New-HTMLInfoCard -Title "Card 4" -Number "50%" -Subtitle "Should wrap to new row" -Icon "⚙️" -IconColor '#0078d4'
        }

        New-HTMLSection -HeaderText "Test 2" -Density Compact {
            New-HTMLInfoCard -Title "Card A" -Number "33%" -Subtitle "Third width" -Icon "🔧" -IconColor '#198754'
            New-HTMLInfoCard -Title "Card B" -Number "33%" -Subtitle "Third width" -Icon "🔨" -IconColor '#198754'
            New-HTMLInfoCard -Title "Card C" -Number "33%" -Subtitle "Third width" -Icon "🔩" -IconColor '#198754'
            New-HTMLInfoCard -Title "Card D" -Number "33%" -Subtitle "Should wrap" -Icon "⚙️" -IconColor '#198754'
        }


    }
} -FilePath "$PSScriptRoot\Test-MinItemsPerRow.html" -TitleText "MinItemsPerRow Test" -Online -Show