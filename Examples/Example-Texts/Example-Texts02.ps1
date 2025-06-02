Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example-Texts02.html" {
    New-HTMLHeader {
        New-HTMLSection -Invisible {
            New-HTMLPanel -Invisible {
                New-HTMLImage -Source 'https://evotec.pl/wp-content/uploads/2015/05/Logo-evotec-012.png' -UrlLink 'https://evotec.pl/' -AlternativeText 'My other text' -Class 'otehr' -Width '50%'
            }
            New-HTMLPanel -Invisible {
                New-HTMLImage -Source 'https://evotec.pl/wp-content/uploads/2015/05/Logo-evotec-012.png' -UrlLink 'https://evotec.pl/' -AlternativeText 'My other text' -Width '20%'
            } -AlignContentText right
        }
    }
    New-HTMLFooter {
        New-HTMLPanel {
            New-HTMLText -Text "Report generated on ", (New-HTMLDate -InputDate (Get-Date)) -Color None, Blue -FontSize 10, 10
            New-HTMLText -Text "Report generated on ", (New-HTMLDate -InputDate (Get-Date -Year 2022)) -Color None, Blue -FontSize 10, 10
            New-HTMLText -Text "Report generated on ", (New-HTMLDate -InputDate (Get-Date -Year 2022) -DoNotIncludeFromNow) -Color None, Blue -FontSize 10, 10
            New-HTMLText -Text "Report generated on ", (New-HTMLDate -InputDate (Get-Date -Year 2024 -Month 11)) -Color None, Blue -FontSize 10, 10
        } -Invisible -AlignContentText right
    }
} -ShowHTML -Online