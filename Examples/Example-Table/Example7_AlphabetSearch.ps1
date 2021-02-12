Import-Module .\PSWriteHTML.psd1 -Force

#$Process = Get-Process | Select-Object -First 30
$ProcessSmaller = Get-Process | Select-Object -First 4 -Property Name, Id, PriorityClass, Responding

New-HTML {
    #New-HTMLSection -Invisible {
        #New-HTMLSection -HeaderText 'Standard Table with Search Highlight' {
        #    New-HTMLTable -DataTable $ProcessSmaller -EnableSearchHighlight
        #}
       # New-HTMLSection -HeaderText 'Standard Table with Alphabet Search' {
            New-HTMLTable -DataTable $ProcessSmaller -EnableSearchAlphabet
        #}
    #}
} -ShowHTML -Online -FilePath $PSScriptRoot\Example7_AlphabetSearch.html -Format