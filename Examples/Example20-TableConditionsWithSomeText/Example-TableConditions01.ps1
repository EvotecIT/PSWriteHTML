Import-Module .\PSWriteHTML.psd1 -Force

$Process = Get-Process | Select-Object -First 20

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example-TableConditions02.html {
    New-HTMLSection -HeaderText 'Test' {
        New-HTMLTable -DataTable $Process -PagingOptions @(50, 100, 150, 200) {
            New-HTMLTableCondition -Name 'Handle12' -Type number -Operator gt -Value 300 -BackgroundColor Yellow -Row
            New-HTMLTableCondition -Name 'ID' -Type number -Operator gt -Value 16000 -BackgroundColor Green -HighlightHeaders Name, Handles
            New-HTMLTableCondition -Name 'Name' -Type string -Operator eq -Value '1password' -BackgroundColor Gold -Row
        } -DataStore JavaScript
    }
    New-HTMLSection -HeaderText 'Test' {
        New-HTMLTable -DataTable $Process -PagingOptions @(50, 100, 150, 200) -DefaultSortColumn 'PriorityClass' {
            New-HTMLTableCondition -Name 'HandleCount' -Type number -Operator gt -Value 300 -BackgroundColor Yellow
            New-HTMLTableCondition -Name 'ID' -Type number -Operator gt -Value 16000 -BackgroundColor Green
            New-HTMLTableCondition -Name 'Name' -Type string -Operator eq -Value 'browser_broker' -BackgroundColor Gold -Row
        }
    }
    New-HTMLTable -DataTable $Process -DefaultSortIndex 10 -OrderMulti {
        New-HTMLTableCondition -Name 'HandleCount' -Type number -Operator gt -Value 300 -BackgroundColor Yellow
        New-HTMLTableCondition -Name 'ID' -Type number -Operator gt -Value 16000 -BackgroundColor Green
        New-HTMLTableCondition -Name 'Name' -Type string -Operator eq -Value 'browser_broker' -BackgroundColor Gold -Row
    }
} -ShowHTML