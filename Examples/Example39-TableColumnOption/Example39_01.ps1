Import-Module "$($PSSCriptRoot)\..\..\PSWriteHTML.psm1" -Force

$Process = Get-Process | Select-Object -First 20

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example39_01.html {
    New-HTMLContent -HeaderText 'Test' {
        New-HTMLTable -DataTable $Process -PagingOptions @(5, 10, 50, 100) {
            New-HTMLTableColumnOption -ColumnIndex 0 -Visible
            New-HTMLTableColumnOption -AllColumns -Hidden            
        }
    }
    New-HTMLContent -HeaderText 'Test' {
        New-HTMLTable -DataTable $Process -PagingOptions @(5, 10, 50, 100) -DefaultSortColumn 'PriorityClass' {
            New-HTMLTableColumnOption -ColumnIndex (0..1) -Width 50 -Visible
            New-HTMLTableColumnOption -ColumnIndex (2..3) -Width 300 -Visible -DisableSearch
            New-HTMLTableColumnOption -AllColumns -Hidden

        }
    }
    New-HTMLTable -DataTable $Process -DefaultSortIndex 0 -OrderMulti {
        New-HTMLTableColumnOption -ColumnIndex 0 -EnableOrdering -DisableSearch
        New-HTMLTableColumnOption -AllColumns -DisableOrdering
    }
} -ShowHTML
