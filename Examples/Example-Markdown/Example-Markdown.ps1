
Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLSection {
        # as an array of strings
        New-HTMLMarkdown -Content '# Hello, Markdown!', '## Hello, Markdown!', 'Ok this is a test', '### Hello, Markdown!'
    }
    New-HTMLSection {
        # as a scriptblock
        New-HTMLMarkdown {
            '# Testing Header 1'
            'This is TOC'
            ' [TOC]'
            '## Testing Header 2'
            'Ok this is a test'
            '## Testing Header 3'
            'Ok this is a test'
            '## Testing Header 4'
            ' [TOC]'
            'Ok this is a test'
            '### Testing Header 5'
        } -EnableTOC
    }
    New-HTMLSection -Invisible {
        # as a file
        New-HTMLSection {
            New-HTMLMarkdown -FilePath "$PSScriptRoot\..\..\readme.md"
        }
        New-HTMLSection {
            New-HTMLMarkdown -FilePath "C:\Support\GitHub\ADEssentials\readme.md" -SanitezeHTML
        }

        New-HTMLSection {
            New-HTMLMarkdown -FilePath "C:\Support\GitHub\PSTeams\readme.md" -EnableOpenLinksInNewWindow
        }
        New-HTMLSection {
            New-HTMLMarkdown -FilePath "C:\Support\GitHub\PowerFederatedDirectory\README.MD"
        }
    }
} -ShowHTML:$true -FilePath $PSScriptRoot\Example-Markdown.html -Online