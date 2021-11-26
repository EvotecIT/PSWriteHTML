Import-Module .\PSWriteHTML.psd1 -Force

$ProcessesAll = Get-Process | Select-Object -First 3

New-HTML -TitleText 'Title' -Online -FilePath $PSScriptRoot\Example-TableAdvancedFreeze1.html -ShowHTML {
    New-HTMLSection -HeaderText 'Search Builder 1' {
        New-HTMLTable -DataTable $ProcessesAll -SearchBuilder -Buttons excelHtml5, copyHtml5, csvHtml5
    }
    New-HTMLSection -HeaderText 'Search Builder as button' {
        New-HTMLTable -DataTable $ProcessesAll
    }
    # This won't really work - button + searchBuilder
    New-HTMLSection -HeaderText 'Search Builder + button' {
        # Search Builder will be disabled, button will work
        New-HTMLTable -DataTable $ProcessesAll -SearchBuilder
    }
}

New-HTML -TitleText 'Title' -FilePath $PSScriptRoot\Example-TableAdvancedFreeze2.html -ShowHTML {
    New-HTMLSection -HeaderText 'Search Builder 1' {
        New-HTMLTable -DataTable $ProcessesAll -SearchBuilder -Buttons excelHtml5, copyHtml5, csvHtml5
    }
    New-HTMLSection -HeaderText 'Search Builder as button' {
        New-HTMLTable -DataTable $ProcessesAll
    }
    # This won't really work - button + searchBuilder
    New-HTMLSection -HeaderText 'Search Builder + button' {
        # Search Builder will be disabled, button will work
        New-HTMLTable -DataTable $ProcessesAll -SearchBuilder
    }
}