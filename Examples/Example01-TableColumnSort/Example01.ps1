Import-Module .\PSWriteHTML.psd1 -Force

$Process = Get-Process | Select-Object -First 3
$ProcessSmaller = Get-Process | Select-Object -First 5

New-HTML -Name 'Dashimo Test' -FilePath $PSScriptRoot\Example01.html -AutoRefresh 15 -Show {
    New-HTMLTable -DataTable $ProcessSmaller -DefaultSortIndex 4 -ScrollCollapse -HideFooter -Buttons @()

   # New-HTMLTable -DataTable $Process -DefaultSortColumn 'WorkingSet' -ScrollCollapse -HideFooter -Buttons @()

  #  New-HTMLTable -DataTable $Process -DefaultSortColumn 'WorkingSet' -ScrollCollapse -DefaultSortOrder Descending -HideFooter -Buttons @()

    New-HTMLTable -DataTable $ProcessSmaller -DefaultSortIndex 4 -ScrollCollapse -HideFooter -Buttons @() -hideHeader

#    New-HTMLTable -DataTable $Process -DefaultSortColumn 'WorkingSet' -ScrollCollapse -HideFooter -Buttons @() -hideHeader

 #   New-HTMLTable -DataTable $Process -DefaultSortColumn 'WorkingSet' -ScrollCollapse -DefaultSortOrder Descending -HideFooter -Buttons @() -hideHeader
}