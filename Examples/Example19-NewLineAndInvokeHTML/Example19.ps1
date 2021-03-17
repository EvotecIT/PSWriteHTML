Import-Module .\PSWriteHTML.psd1 -Force

$Test1 = [PSCustomobject] @{
    'First column' = 'Test'
    'Second column' = '<br>MyIdol<br><strong>Test</strong>'
    'Example' = "`r`nTesting how PowerShell NewLines are treated $([Environment]::NewLine) Or how HTML tags are treated<br> Get it?"
}

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example19.html -Verbose {
    New-HTMLSection -HeaderText 'Showing how tags are invoked. So BR and other tags like A HREF should be converted' {
        New-HTMLTable -DataTable $Test1 -PagingOptions @(50, 100, 150, 200) -Filtering -FilteringLocation Bottom -InvokeHTMLTags
    }
    New-HTMLSection -HeaderText 'Showing how PowerShell new lines such us `r`n and [Environment]::NewLine are changed into new lines in HTML' {
        New-HTMLTable -DataTable $Test1 -PagingOptions @(50, 100, 150, 200) -Filtering -FilteringLocation Bottom
    }
    New-HTMLSection -HeaderText 'Showing Same data but with Disable PowerShell NewLine' {
        New-HTMLTable -DataTable $Test1 -PagingOptions @(50, 100, 150, 200) -Filtering -FilteringLocation Bottom -DisableNewLine
    }
    New-HTMLSection -HeaderText 'Showing Same data but with Disable PowerShell NewLine but with InvokeHTMLTags' {
        New-HTMLTable -DataTable $Test1 -PagingOptions @(50, 100, 150, 200) -Filtering -FilteringLocation Bottom -DisableNewLine -InvokeHTMLTags
    }

} -ShowHTML