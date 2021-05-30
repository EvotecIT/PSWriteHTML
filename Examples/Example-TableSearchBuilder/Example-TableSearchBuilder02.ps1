Import-Module .\PSWriteHTML.psd1 -Force

$Table = Get-Process | Select-Object -First 4 -Property Name, Id, PriorityClass, Handle, HandleCount, WorkingSet

New-HTML -TitleText "Testing Search Pane" -FilePath "$PSScriptRoot\Example-TableSearchBuilder02.html" {
    # Do it via buttons
    New-HTMLSection -HeaderText "SearchBuilder" -Content {
        New-HTMLTable -DataTable $Table -Filtering {

        } -Buttons @('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'pageLength', 'searchPanes', 'searchBuilder')
    }
    New-HTMLSection -HeaderText "SearchBuilder" -Content {
        New-HTMLTable -DataTable $Table -Filtering {
            New-TableButtonSearchBuilder -ButtonName 'Advanced Search' -DefaultLogic OR -GreyScale
        }
    }

    New-HTMLSection -HeaderText "SearchPane" -Content {
        New-HTMLTable -DataTable $Table -Filtering {

        } -SearchPane -SearchBuilder
    }
} -ShowHTML -Online -Format