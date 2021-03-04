Import-Module .\PSWriteHTML.psd1 -Force

$Table = Get-Process | Select-Object -First 20 -Property Name, Id, PriorityClass, Handle, HandleCount, WorkingSet

New-HTML -TitleText "Testing Search Pane" -FilePath "$PSScriptRoot\Example-TableSearchPanes.html" {
    # Hide Buttons
    New-HTMLSection -HeaderText "Search Pane Button" -Content {
        New-HTMLTable -DataTable $Table -Filtering {

        } -Buttons @('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'pageLength', 'searchPanes') -PagingLength 5
        New-HTMLTable -DataTable $Table -Filtering {

        } -Buttons @('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'pageLength', 'searchPanes') -PagingLength 5
    }
    New-HTMLSection -HeaderText 'Testing section' {
        New-HTMLSection -HeaderText "Search Pane Button" -Content {
            New-HTMLTable -DataTable $Table -Filtering {

            } -Buttons @('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'pageLength', 'searchPanes') -PagingLength 5
        }
        New-HTMLSection -HeaderText "Search Pane Button" -Content {
            New-HTMLTable -DataTable $Table -Filtering {

            } -Buttons @('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'pageLength', 'searchPanes') -PagingLength 5
        }
    }
    New-HTMLSection -HeaderText 'Testing section' {
        New-HTMLSection -HeaderText "Search Pane Button" -Content {
            New-HTMLTable -DataTable $Table -Filtering {

            } -Buttons @('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'pageLength', 'searchPanes') -PagingLength 5
        }
        New-HTMLCalendar {
            New-CalendarEvent -Title 'Active Directory Meeting' -Description 'We will talk about stuff' -StartDate (Get-Date)
            New-CalendarEvent -Title 'Lunch' -StartDate (Get-Date).AddDays(2).AddHours(-3) -EndDate  (Get-Date).AddDays(3) -Description 'Very long lunch'
        }
    }
    New-HTMLSection -HeaderText "Search Pane Built-in" -Content {
        New-HTMLTable -DataTable $Table -Filtering {

        } -SearchPane -SearchPaneLocation bottom -SearchBuilder
    }
} -ShowHTML -Online -Format