Import-Module .\PSWriteHTML.psd1 -Force

$ProcessesAll = Get-Process | Select-Object -First 2 #-Property Name, Id, StartTime

New-HTML -TitleText 'Title' -Online -FilePath $PSScriptRoot\Example-SearchBuilder.html -ShowHTML {
    #New-HTMLTableStyle -BackgroundColor Blue -Type RowSelected
    #New-HTMLTableStyle -BackgroundColor Yellow -Type RowHover
    #New-HTMLTableStyle -BackgroundColor Yellow -Type RowHoverSelected

    New-HTMLSection -HeaderText 'Search Builder 1' {
        New-HTMLTable -DataTable $ProcessesAll -SearchBuilder -Buttons excelHtml5, copyHtml5, csvHtml5, toggleView {

        }

        New-HTMLTable -DataTable $ProcessesAll -SearchBuilder {

        } -Filtering
    }
    # New-HTMLSection -HeaderText 'Search Builder as button' {
    #     New-HTMLTable -DataTable $ProcessesAll
    # }
    # # This won't really work - button + searchBuilder
    # New-HTMLSection -HeaderText 'Search Builder + button' {
    #     # Search Builder will be disabled, button will work
    #     New-HTMLTable -DataTable $ProcessesAll -SearchBuilder
    # }
    # New-HTMLSection -HeaderText 'Search Builder 1' {
    #     New-HTMLTable -DataTable $ProcessesAll -Filtering -ScrollX -SearchBuilder -Buttons excelHtml5, copyHtml5, csvHtml5, toggleView
    # }
    # New-HTMLSection -HeaderText 'Search Builder 2' {
    #     New-HTMLTable -DataTable $ProcessesAll -Filtering -Buttons excelHtml5, copyHtml5, csvHtml5, toggleView -ImmediatelyShowHiddenDetails
    # }
    New-HTMLSection -HeaderText 'Search Builder 3' {
        New-HTMLTable -DataTable $ProcessesAll -Filtering -ScrollX -SearchBuilder -Buttons excelHtml5, copyHtml5, csvHtml5, toggleView -ImmediatelyShowHiddenDetails
    }
    # New-HTMLSection -HeaderText 'Search Builder as button' {
    #     New-HTMLTable -DataTable $ProcessesAll
    # }
    # # This won't really work - button + searchBuilder
    # New-HTMLSection -HeaderText 'Search Builder + button' {
    #     # Search Builder will be disabled, button will work
    #     New-HTMLTable -DataTable $ProcessesAll -SearchBuilder
    # }
}