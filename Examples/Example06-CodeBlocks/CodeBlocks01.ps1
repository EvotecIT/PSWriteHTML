Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -Online -FilePath "$PSScriptRoot\CodeBlocks02.html" -ShowHTML {
    New-HTMLTab -TabName 'Coding' {
        New-HTMLSection -HeaderText 'This shows PowerShell Language' {
            New-HTMLCodeBlock -Code $CodeBlock -Style 'PowerShell' -Group 'Test123' -Title 'PowerShell Code 1' -Theme godzilla -Highlight '2-5, 13'
            New-HTMLCodeBlock -Code $CodeBlock -Style 'PowerShell' -Group 'Test123' -Title 'PowerShell Code 2'
        }
        New-HTMLSection -HeaderText 'This shows PowerShell Language' {
            New-HTMLCodeBlock -Code $CodeBlockJS -Style 'JavaScript' -Theme enlighter -Highlight '2, 5'
        }
        New-HTMLSection -HeaderText 'XML Language' {
            New-HTMLCodeBlock -Code $CodeBlocksXML -Style 'xml' -Highlight '12, 19'
        }
    }
}