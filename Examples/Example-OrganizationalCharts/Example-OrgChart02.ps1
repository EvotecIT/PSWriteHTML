Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLSection {
        New-HTMLSection -HeaderText 'Organization Chart 1' {
            New-HTMLOrgChart {
                New-OrgChartNode -Name 'Test' -Title 'Test2' {
                    New-OrgChartNode -Name 'Test' -Title 'Test2'
                    New-OrgChartNode -Name 'Test' -Title 'Test2'
                    New-OrgChartNode -Name 'Test' -Title 'Test2' {
                        New-OrgChartNode -Name 'Test' -Title 'Test2'
                    }
                }
            } -Draggable -Zoom -Pan
        }
        New-HTMLSection -HeaderText 'Organization Chart 2' {
            New-HTMLOrgChart {
                New-OrgChartNode -Name 'Test' -Title 'Test2' {
                    New-OrgChartNode -Name 'Test' -Title 'Test2'
                    New-OrgChartNode -Name 'Test' -Title 'Test2'
                    New-OrgChartNode -Name 'Test' -Title 'Test2' {
                        New-OrgChartNode -Name 'Test' -Title 'Test2'
                    }
                }
            } -Draggable -Pan
        }
    } -Invisible
} -FilePath $PSScriptRoot\Example-OrgChart02.html -ShowHTML -Online