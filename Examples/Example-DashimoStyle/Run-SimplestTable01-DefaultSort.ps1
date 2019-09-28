
$Process = Get-Process | Select-Object -First 30

Dashboard -Name 'Dashimo Test' -FilePath $PSScriptRoot\Output\DashboardEasy01.html -AutoRefresh 15 -Show {
    Table -DataTable $Process -DefaultSortIndex 4 -ScrollCollapse -HideFooter -Buttons @()

    Table -DataTable $Process -DefaultSortColumn 'WorkingSet' -ScrollCollapse -HideFooter -Buttons @()

    Table -DataTable $Process -DefaultSortColumn 'WorkingSet' -DefaultSortOrder Descending -ScrollCollapse -HideFooter -Buttons @()
}