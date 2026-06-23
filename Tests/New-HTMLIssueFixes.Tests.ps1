BeforeAll {
    Import-Module (Join-Path $PSScriptRoot '..\PSWriteHTML.psd1') -Force
}

Describe 'Issue-oriented HTML fixes' {
    It 'renders table cell alignment, header borders, custom footer, column widths, row grouping hide, and SearchBuilder button language' {
        $FilePath = Join-Path $TestDrive 'table-issue-fixes.html'
        $Data = @(
            [PSCustomObject]@{ Team = 'A'; Notes = "First`nSecond"; Count = 2 }
            [PSCustomObject]@{ Team = 'B'; Notes = 'Third'; Count = 3 }
        )

        New-HTML -FilePath $FilePath -Online {
            New-HTMLTable -DataTable $Data -DataTableID 'issueTable' -Filtering -DisableStateSave {
                New-TableButtonSearchBuilder -ButtonName 'Advanced filters' -DepthLimit 3
                New-TableHeader -Names 'Team', 'Notes', 'Count' -BorderStyle solid -BorderWidth 2 -BorderColor '#4b5563'
                New-TableContent -ColumnName 'Notes' -VerticalAlignment top
                New-TableColumnOption -ColumnIndex 1 -Width '30%'
                New-TableRowGrouping -Name 'Team' -SortOrder Descending -HideGroupedColumn
                New-TableFooter -ValueByColumn @{ Team = 'Totals'; Count = 5 } -FontWeight bold
            }
        }

        $Content = Get-Content -LiteralPath $FilePath -Raw
        $Content | Should -Match 'vertical-align:\s*top'
        $Content | Should -Match 'border-style:\s*solid'
        $Content | Should -Match 'border-width:\s*2px'
        $Content | Should -Match 'First<br>Second'
        $Content | Should -Match '<tfoot>'
        $Content | Should -Match 'pswritehtml-filter-row'
        $Content | Should -Match 'pswritehtml-static-footer-row'
        $Content | Should -Match 'tfoot tr:not\(.pswritehtml-static-footer-row\) th'
        $Content | Should -Match '<th style="font-weight:\s*bold">Totals</th>'
        $Content | Should -Match '<th style="font-weight:\s*bold">5</th>'
        $Content | Should -Match '<col style="width:\s*30%">'
        $Content | Should -Match '"button":\s*"Advanced filters"'
        $Content | Should -Match '"order":\s*\[\s*\[\s*0,\s*"desc"\s*\]\s*\]'
        $Content | Should -Match '"targets":\s*0\s*,\s*"visible":\s*false'
    }

    It 'does not render an empty summary heading when no title is provided' {
        $FilePath = Join-Path $TestDrive 'summary-no-title.html'

        New-HTML -FilePath $FilePath -Online {
            New-HTMLSummary {
                New-HTMLSummaryItem -Text 'Visible item'
            }
        }

        $Content = Get-Content -LiteralPath $FilePath -Raw
        $Content | Should -Not -Match 'summary-title'
        $Content | Should -Match 'Visible item'
    }

    It 'sets a tab panel default tab from New-HTMLTab' {
        $FilePath = Join-Path $TestDrive 'default-tab.html'

        New-HTML -FilePath $FilePath -Online {
            New-HTMLTabPanel {
                New-HTMLTab -Name 'First' { New-HTMLText -Text 'First content' }
                New-HTMLTab -Name 'Second' -Default { New-HTMLText -Text 'Second content' }
            }
        }

        $Content = Get-Content -LiteralPath $FilePath -Raw
        $Content | Should -Match '"selected":\s*1'
    }

    It 'sets a standalone default tab at runtime without leaving the first pane active' {
        $FilePath = Join-Path $TestDrive 'standalone-default-tab.html'

        New-HTML -FilePath $FilePath -Online {
            New-HTMLTab -Name 'First' -AnchorName 'first-tab' {
                New-HTMLText -Text 'First content'
            }
            New-HTMLTab -Name 'Second' -AnchorName 'second-tab' -Default {
                New-HTMLText -Text 'Second content'
            }
        }

        $Content = Get-Content -LiteralPath $FilePath -Raw
        $Content | Should -Match 'var tabId = "second-tab"'
        $Content | Should -Match 'var paneId = "second-tab-Content"'
        $Content | Should -Match "child\.classList\.remove\('active'\)"
        $Content | Should -Match "pane\.classList\.add\('active'\)"
    }
}
