Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLOrgChart {
        New-OrgChartNode -Name 'Test' -Title 'Test2' {
            New-OrgChartNode -Name 'Test' -Title 'Test2'
            New-OrgChartNode -Name 'Test' -Title 'Test2'
            New-OrgChartNode -Name 'Test' -Title 'Test2' {
                New-OrgChartNode -Name 'Test' -Title 'Test2'
            }
        }
    } -AllowExport -ExportExtension pdf -Draggable
} -FilePath $PSScriptRoot\Example-OrgChart01.html -ShowHTML -Online