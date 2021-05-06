Import-Module .\PSWriteHTML.psd1 -Force


New-HTML -TitleText 'Database-Reports' -Temporary -Online -ShowHTML {
    New-HTMLSection -HeaderText 'Database-Report' -BorderRadius 15px -Wrap wrap {
        New-HTMLSection -HeaderText 'Database-Summary' -HeaderTextColor black -HeaderBackGroundColor limegreen -BorderRadius 15px -CanCollapse {
            New-HTMLPanel -BackgroundColor gainsboro -BorderRadius 15px {
                New-HTMLTable -DataTable ($OutputDatabasesSum | Select-Object -Last 1) -DisablePaging -DisableSearch -HideButtons -HideFooter -ScrollCollapse -FixedHeader -Style cell-border
            }
        }
        New-HTMLSection -HeaderText 'Database-Details' -HeaderTextColor black -HeaderBackGroundColor limegreen -BorderRadius 15px -CanCollapse {
            New-HTMLPanel -BackgroundColor gainsboro -BorderRadius 15px {
                New-HTMLTable -DataTable $OutputDatabases -PagingLength 10 -HideFooter -ScrollCollapse -FixedHeader -Style cell-border -Buttons excelHtml5, pageLength, searchPanes {
                    New-TableCondition -Name 'DatabaseIndexState' -Operator eq -Value 'Failed' -BackgroundColor red -Color white -ComparisonType string
                    New-TableCondition -Name 'DatabaseIndexState' -Operator eq -Value 'FailedAndSuspended' -BackgroundColor red -Color white -ComparisonType string
                    New-TableCondition -Name 'DatabaseIndexState' -Operator eq -Value 'NotApplicable' -BackgroundColor orange -Color white -ComparisonType string
                    New-TableCondition -Name 'DatabaseIndexState' -Operator eq -Value 'Crawling' -BackgroundColor orange -Color white -ComparisonType string
                }
            }
        }
    }
}