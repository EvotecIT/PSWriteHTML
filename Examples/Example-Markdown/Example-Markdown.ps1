
Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLSection {
        # as an array of strings
        New-HTMLMarkdown -Content '# Hello, Markdown!', '## Hello, Markdown!', 'Ok this is a test', '### Hello, Markdown!'
    }
    New-HTMLSection {
        # as a scriptblock
        New-HTMLMarkdown {
            '# Hello, Markdown!'
            'This is TOC'
            '[TOC]'
            '## Hello, Markdown!'
            'Ok this is a test'
            '### Hello, Markdown!'
        } -EnableTOC
    }
    New-HTMLSection -Invisible {
        # as a file
        New-HTMLSection {
            New-HTMLMarkdown -FilePath "$PSScriptRoot\..\..\readme.md"
        }
        New-HTMLSection {
            New-HTMLMarkdown -FilePath "$PSScriptRoot\..\..\readme.md" -SanitezeHTML
        }

        New-HTMLSection {
            New-HTMLMarkdown -FilePath "$PSScriptRoot\..\..\readme.md" -EnableOpenLinksInNewWindow
        }
        New-HTMLSection {
            New-HTMLMarkdown -FilePath "C:\Support\GitHub\PowerFederatedDirectory\README.MD" -EnableTOC
        }
    }
} -ShowHTML:$false -Online -FilePath $PSScriptRoot\Example-Markdown.html