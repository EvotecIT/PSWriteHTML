Import-Module .\PSWriteHTML.psd1 -Force

#$Process = Get-Process | Select-Object -First 30
$ProcessSmaller = Get-ADUser -Filter * | Select-Object -First 15 # -Property Name, Id, PriorityClass, Responding

New-HTML {
    New-HTMLSection -HeaderText 'Standard Table with Alphabet Search' {
        New-HTMLTable -DataTable $ProcessSmaller -AlphabetSearch {

        }
        New-HTMLTable -DataTable $ProcessSmaller -AlphabetSearch {
            New-TableAlphabetSearch -ColumnName Name -AddNumbers
        }
    }
    New-HTMLSection -HeaderText 'Standard Table with Alphabet Search' {
        New-HTMLTable -DataTable $ProcessSmaller -AlphabetSearch {
            New-TableAlphabetSearch -ColumnName SID -CaseSensitive
        }
    }
    New-HTMLSection -HeaderText 'Standard Table with Alphabet Search' {
        New-HTMLTable -DataTable $ProcessSmaller -AlphabetSearch {

        }
    }
} -ShowHTML -FilePath $PSScriptRoot\Example7_AlphabetSearch2.html -Format -Online