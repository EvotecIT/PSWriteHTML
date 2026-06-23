Import-Module .\PSWriteHTML.psd1 -Force

$FilePath = Join-Path $PSScriptRoot 'Example-IssueFixes-ChartsTablesTabs.html'

$Incidents = @(
    [PSCustomObject]@{ Team = 'Identity'; Severity = 'High'; Owner = 'Ava'; Notes = "MFA policy`nConditional Access review"; Count = 7; Hours = 12.5 }
    [PSCustomObject]@{ Team = 'Identity'; Severity = 'Medium'; Owner = 'Ben'; Notes = "Lifecycle workflow`nJoiner validation"; Count = 4; Hours = 6.0 }
    [PSCustomObject]@{ Team = 'Messaging'; Severity = 'High'; Owner = 'Cara'; Notes = "Transport rule`nExternal sender check"; Count = 5; Hours = 8.5 }
    [PSCustomObject]@{ Team = 'Devices'; Severity = 'Low'; Owner = 'Drew'; Notes = "Enrollment profile`nCleanup"; Count = 2; Hours = 3.0 }
)

New-HTML -TitleText 'PSWriteHTML issue fix smoke page' -FilePath $FilePath -Online {
    New-HTMLSection -HeaderText 'Charts' {
        New-HTMLPanel {
            New-HTMLChart -Title 'Area and scatter' {
                New-ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr'
                New-ChartArea -Name 'Resolved' -Value 21, 28, 24, 36 -Color DodgerBlue -Curve smooth
            }
        }
        New-HTMLPanel {
            New-HTMLChart -Title 'Risk spread' {
                New-ChartBubble -Name 'Teams' -X 1, 2, 3, 4 -Y 3, 7, 5, 11 -Z 3, 6, 4, 8 -Color Orange
            }
        }
        New-HTMLPanel {
            New-HTMLChart -Title 'Coverage radar' {
                New-ChartAxisX -Name 'Identity', 'Mail', 'Devices', 'Apps'
                New-ChartRadar -Name 'Current' -Value 72, 64, 81, 69 -Color SeaGreen
            }
        }
    }

    New-HTMLSection -HeaderText 'Tables' {
        New-HTMLTable -DataTable $Incidents -Title 'Operational queue' -Filtering -FilteringLocation Top -DisableStateSave {
            New-TableButtonSearchBuilder -ButtonName 'Advanced filters' -DepthLimit 3
            New-TableHeader -Names 'Team', 'Severity', 'Owner', 'Notes', 'Count', 'Hours' -BackGroundColor '#f6f8fa' -BorderStyle solid -BorderWidth 2 -BorderColor '#4b5563'
            New-TableContent -ColumnName 'Notes' -VerticalAlignment top -WordBreak break-word
            New-TableColumnOption -ColumnIndex 0 -Width '18%'
            New-TableColumnOption -ColumnIndex 1 -Width '14%'
            New-TableColumnOption -ColumnIndex 3 -Width '32%'
            New-TableRowGrouping -Name 'Team' -SortOrder Ascending -HideGroupedColumn -Color '#1f2937' -BackgroundColor '#dbeafe'
            New-TableFooter -ValueByColumn @{
                Severity = 'Totals'
                Count    = ($Incidents | Measure-Object -Property Count -Sum).Sum
                Hours    = ($Incidents | Measure-Object -Property Hours -Sum).Sum
            } -FontWeight bold -BackGroundColor '#f3f4f6' -BorderStyle solid -BorderWidth 2 -BorderColor '#4b5563'
        }
    }

    New-HTMLSection -HeaderText 'Summary and tabs' {
        New-HTMLPanel {
            New-HTMLSummary {
                New-HTMLSummaryItem -Text 'Title-less summaries no longer reserve a blank heading'
                New-HTMLSummaryItem -Text 'The first visible line should be this summary item'
            }
        }
        New-HTMLPanel {
            New-HTMLTabPanel -Theme pills -DisableURLhash {
                New-HTMLTab -Name 'First' {
                    New-HTMLText -Text 'This tab exists, but should not be selected initially.'
                }
                New-HTMLTab -Name 'Default tab' -Default {
                    New-HTMLText -Text 'This tab is selected through New-HTMLTab -Default.'
                }
                New-HTMLTab -Name 'Last' {
                    New-HTMLText -Text 'A normal trailing tab.'
                }
            }
        }
    }

    New-HTMLSection -HeaderText 'Diagram link widths' {
        New-HTMLDiagram -Height '360px' {
            New-DiagramNode -Id 1 -Label 'Intake' -ColorBackground '#bfdbfe'
            New-DiagramNode -Id 2 -Label 'Triage' -ColorBackground '#bbf7d0'
            New-DiagramNode -Id 3 -Label 'Resolve' -ColorBackground '#fde68a'
            New-DiagramLink -From 1 -To 2 -Label 'normal' -Width 2 -HoverWidth 4
            New-DiagramLink -From 2 -To 3 -Label 'weighted' -Value 7 -ArrowsToEnabled
            New-DiagramOptionsLinks -Width 2 -HoverWidth 5 -SmoothType dynamic
        }
    }
}
