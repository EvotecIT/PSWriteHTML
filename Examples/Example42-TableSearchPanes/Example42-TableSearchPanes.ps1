Import-Module .\PSWriteHTML.psd1 -Force

$Table = Get-Process | Select-Object -First 4

New-HTML -TitleText "Testing Search Pane" -FilePath "$PSScriptRoot\Example42-TableSearchPanes.html" {
    # Hide Buttons
    New-HTMLSection -HeaderText "Search Pane Button" -Content {
        New-HTMLTable -DataTable $Table -Filtering {

        } -Buttons @('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'pageLength', 'searchPanes')
    }
    New-HTMLSection -HeaderText "Search Pane Built-in" -Content {
        New-HTMLTable -DataTable $Table -Filtering {

        } -SearchPane
    }
} -ShowHTML -Online