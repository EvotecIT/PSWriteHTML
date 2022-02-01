Import-Module .\PSWriteHTML.psd1 -Force

$PRocess = @(
    [PSCustomObject] @{ PRI = 1; ID =	7; Text = "Placeholder Text" }
    [PSCustomObject] @{ PRI = 1; ID =	5; Text = "Placeholder Text" }
    [PSCustomObject] @{ PRI = 2; ID =	4; Text = "Placeholder Text" }
    [PSCustomObject] @{ PRI = 2; ID =	2; Text = "Placeholder Text" }
    [PSCustomObject] @{ PRI = 3; ID =	1; Text = "Placeholder Text" }
    [PSCustomObject] @{ PRI = 3; ID =	6; Text = "Placeholder Text" }
    [PSCustomObject] @{ PRI = 3; ID =	3; Text = "Placeholder Text" }
)

Dashboard -Name 'Dashimo Test' -FilePath $PSScriptRoot\DashboardEasy01.html -Show {
    #Table -DataTable $Process -DefaultSortIndex 2 -ScrollCollapse -HideFooter -Buttons @()

    #Table -DataTable $Process -DefaultSortColumn 'PRI' -ScrollCollapse -HideFooter -Buttons @()

    #Table -DataTable $Process -DefaultSortColumn 'ID' -DefaultSortOrder Descending -ScrollCollapse -HideFooter -Buttons @()

    Table -DataTable $Process -DefaultSortColumn 'PRI', 'Id' -DefaultSortOrder Descending, Ascending -ScrollCollapse -HideFooter -Buttons @()

    Table -DataTable $Process -DefaultSortColumn 'PRI', 'Id' -DefaultSortOrder Descending, Descending -ScrollCollapse -HideFooter -Buttons @()
} -Online