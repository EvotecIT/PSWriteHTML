Import-Module .\PSWriteHTML.psd1 -Force

$ProcessesAll = Get-Process | Select-Object -First 3 #-Property Name, Id, StartTime

New-HTML -TitleText 'Title' -Online -FilePath $PSScriptRoot\Example-SearchBuilder.html -ShowHTML {
    #New-HTMLTableStyle -BackgroundColor Blue -Type RowSelected
    #New-HTMLTableStyle -BackgroundColor Yellow -Type RowHover
    #New-HTMLTableStyle -BackgroundColor Yellow -Type RowHoverSelected

    New-HTMLSection -HeaderText 'Search Builder 1' {
        New-HTMLTable -DataTable $ProcessesAll -SearchBuilder -Buttons excelHtml5, copyHtml5, csvHtml5 {
            #New-HTMLTableContent -ColumnName 'PriorityClass' -BackgroundColor Salmon
            New-HTMLTableContent -ColumnName 'HandleCount' -BackGroundColor Salmon
            New-HTMLTableCondition -ColumnName 'Product' -BackgroundColor Salmon -Value '1Password' -ChildRowFill Both
            New-HTMLTableCondition -ColumnName 'Name' -BackgroundColor AirForceBlue -Value '1password'
        }
        New-HTMLTable -DataTable $ProcessesAll -SearchBuilder -Buttons excelHtml5, copyHtml5, csvHtml5 {
            #New-HTMLTableContent -ColumnName 'PriorityClass' -BackgroundColor Salmon
            New-HTMLTableContent -ColumnName 'HandleCount' -BackGroundColor Salmon
            New-HTMLTableCondition -ColumnName 'Product' -BackgroundColor Salmon -Value '1Password'
            New-HTMLTableCondition -ColumnName 'Name' -BackgroundColor AirForceBlue -Value '1password'

            New-HTMLTableCondition -ColumnName 'VM' -BackgroundColor Alizarin
        } -DataStore JavaScript
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

# New-HTML -TitleText 'Title' -FilePath $PSScriptRoot\Example-SearchBuilder2.html {
#     New-HTMLSection -HeaderText 'Search Builder 1' {
#         New-HTMLTable -DataTable $ProcessesAll -Filtering -ScrollX -SearchBuilder -Buttons excelHtml5, copyHtml5, csvHtml5
#     }
#     New-HTMLSection -HeaderText 'Search Builder as button' {
#         New-HTMLTable -DataTable $ProcessesAll
#     }
#     # This won't really work - button + searchBuilder
#     New-HTMLSection -HeaderText 'Search Builder + button' {
#         # Search Builder will be disabled, button will work
#         New-HTMLTable -DataTable $ProcessesAll -SearchBuilder
#     }
# } -ShowHTML