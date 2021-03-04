Import-Module .\PSWriteHTML.psd1 -Force

$Table = Get-Process | Select-Object -First 4 -Property Name, Id, PriorityClass, Handle, HandleCount, WorkingSet

New-HTML -TitleText "Testing Search Pane" -FilePath "$PSScriptRoot\Example-TableSearchBuilder.html" {
    # Hide Buttons
    New-HTMLSection -HeaderText "SearchBuilder" -Content {
        New-HTMLTable -DataTable $Table -Filtering {

        } -Buttons @('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'pageLength', 'searchPanes') -SearchBuilder
    }

    New-HTMLSection -HeaderText "SearchPane" -Content {
        New-HTMLTable -DataTable $Table -Filtering {

        } -SearchPane
    }
} -ShowHTML -Online -Format