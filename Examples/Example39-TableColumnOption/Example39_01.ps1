Import-Module "$PSSCriptRoot\..\..\PSWriteHTML.psd1" -Force

$Process = Get-Process | Select-Object -First 20
$ProcessesLimited = $Process | Select-Object -Property Id, Name, PriorityClass, ProductVersion, Company, Path, Description

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example39_01.html {
    New-HTMLSection -HeaderText 'Test' {
        New-HTMLTable -DataTable $ProcessesLimited -PagingOptions @(5, 10, 50, 100) {
            New-TableColumnOption -ColumnIndex 0, 1 -Hidden $false
            New-TableColumnOption -AllColumns -Hidden $true
        }
    }
    New-HTMLSection -HeaderText 'Test' {
        New-HTMLTable -DataTable $ProcessesLimited -PagingOptions @(5, 10, 50, 100) -DefaultSortColumn 'Id' {
            New-TableColumnOption -ColumnIndex (0..5) -Width 50
            New-TableColumnOption -ColumnIndex 1 -Sortable $true
            New-TableColumnOption -ColumnIndex 1, 3, 4 -Searchable $true
            New-TableColumnOption -AllColumns -Sortable $false -Searchable $false

        }
    }
    New-HTMLTable -DataTable $ProcessesLimited -DefaultSortIndex 0 -OrderMulti {
        New-TableColumnOption -ColumnIndex 0 -Sortable $true
        New-TableColumnOption -AllColumns -Sortable $false
    }
} -ShowHTML
