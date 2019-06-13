<#

$Table = Get-Process | Select -First 5

$Output = @(
    '<link href="Accordion.css" type="text/css" rel="stylesheet" />'
    New-HTMLSection1 -TextHeader 'Testoor' {
        New-HTMLSubSection -Text 'Test1' -TextHeader 'negative', '13'
        New-HTMLSubSection -Text 'Test2' -TextHeader 'negative', '14'
        New-HTMLSubSection -Text 'Test3' -TextHeader 'negative', '15'
        New-HTMLSubSection -Text 'Test4' -TextHeader 'negative', '16' {
            New-HTMLTable -DataTable $Table -HideFooter
        }
    }
)

Set-Content -Value $Output -Path 'C:\Users\przemyslaw.klys\OneDrive - Evotec\Support\GitHub\PSWriteHTML\Ignore\AccordionTabs\Accordion-Test.html'

#>

Import-Module .\PSWriteHTML.psd1 -Force

$Process = Get-Process | Select-Object -First 10

New-HTML -TitleText 'My title' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example21.html -Show {

    New-HTMLSection1 -TextHeader 'Testoor' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Process -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $Table -HideFooter
        }
        New-HTMLSubSection -Text 'Test1' -TextHeader 'negative', '13' {
            New-HTMLTable -DataTable $Process -HideFooter
        }
        New-HTMLSubSection -Text 'Test1' -TextHeader 'negative', '13' {
            New-HTMLTable -DataTable $Table -HideFooter
        }
        <#

        New-HTMLSubSection -Text 'Test1' -TextHeader 'negative', '13'

        New-HTMLSubSection -Text 'Test2' -TextHeader 'negative', '14'
        New-HTMLSubSection -Text 'Test3' -TextHeader 'negative', '15'
        New-HTMLSubSection -Text 'Test4' -TextHeader 'negative', '16' {
            New-HTMLTable -DataTable $Table -HideFooter
        }
        #>
    }
    New-HTMLSection -HeaderText 'Test' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Process -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $Table -HideFooter
        }
    }
}