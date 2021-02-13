Import-Module .\PSWriteHTML.psd1 -Force

#$Process = Get-Process | Select-Object -First 30
$ProcessSmaller = Get-Process | Select-Object -First 4 -Property Name, Id, PriorityClass, Responding

New-HTML {
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with Search Highlight' {
            New-HTMLTable -DataTable $ProcessSmaller -SearchHighlight
        }
        New-HTMLSection -HeaderText 'Standard Table with Alphabet Search' {
            New-HTMLTable -DataTable $ProcessSmaller -AlphabetSearch
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with Search Builder' {
            New-HTMLTable -DataTable $ProcessSmaller -SearchBuilder
        }
        New-HTMLSection -HeaderText 'Standard Table with Alphabet Search - Advanced' {
            New-HTMLTable -DataTable $ProcessSmaller -AlphabetSearch {
                New-TableAlphabetSearch -ColumnName 'Name' -AddNumbers -CaseSensitive
            }
        }
    }
} -ShowHTML -Online -FilePath $PSScriptRoot\Example7_AlphabetSearch.html -Format