Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example29-01.html" {
    #New-HTMLHeader {
    #    New-HTMLImage -Source 'https://evotec.pl/wp-content/uploads/2015/05/Logo-evotec-012.png' -UrlLink 'https://evotec.pl/' -AlternativeText 'My other text' -Class 'otehr' -Width '100%'
    #}
    New-HTMLHeader {
        New-HTMLPanel -Invisible {
            New-HTMLImage -Source 'https://evotec.pl/wp-content/uploads/2015/05/Logo-evotec-012.png' -UrlLink 'https://evotec.pl/' -AlternativeText 'My other text' -Width '50%'
        } -AlignContentText right
    }
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLTable -DataTable (Get-Process | Select-Object -First 2)
    }
} -ShowHTML -Online