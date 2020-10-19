Import-Module .\PSWriteHTML.psd1 -Force

#$Process = Get-Process | Select-Object -First 2

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example20_01.html -Show {
    New-HTMLTableOption -DataStore HTML
    <#
    New-HTMLSection -HeaderText 'Test' {
        New-HTMLContainer {
            New-HTMLText -Text 'You can also use Container for that' -Alignment center -Color Red -FontSize 20
            New-HTMLTable -DataTable $Process -PagingOptions @(50, 100, 150, 200) -DefaultSortColumn 'PriorityClass' {
                New-HTMLTableCondition -Name 'HandleCount' -Type number -Operator gt -Value 300 -BackgroundColor Yellow
                New-HTMLTableCondition -Name 'ID' -Type number -Operator gt -Value 16000 -BackgroundColor Green
                New-HTMLTableCondition -Name 'Name' -Type string -Operator eq -Value 'browser_broker' -BackgroundColor Gold -Row
            }
            New-HTMLText -Text 'See?' -Alignment center -Color Red -FontSize 20
            New-HTMLTable -DataTable $Process -PagingOptions @(50, 100, 150, 200) -DefaultSortColumn 'PriorityClass' {
                New-HTMLTableCondition -Name 'HandleCount' -Type number -Operator gt -Value 300 -BackgroundColor Yellow
                New-HTMLTableCondition -Name 'ID' -Type number -Operator gt -Value 16000 -BackgroundColor Green
                New-HTMLTableCondition -Name 'Name' -Type string -Operator eq -Value 'browser_broker' -BackgroundColor Gold -Row
            }
        }
        New-HTMLContainer {
            New-HTMLText -Text 'Test test1' -Alignment center -Color Red -FontSize 20
            New-HTMLTable -DataTable $Process -PagingOptions @(50, 100, 150, 200) -DefaultSortColumn 'PriorityClass' {
                New-HTMLTableCondition -Name 'HandleCount' -Type number -Operator gt -Value 300 -BackgroundColor Yellow -Row
                New-HTMLTableCondition -Name 'ID' -Type number -Operator gt -Value 16000 -BackgroundColor Green
                New-HTMLTableCondition -Name 'Name' -Type string -Operator eq -Value 'browser_broker' -BackgroundColor Gold -Row
            }
            New-HTMLText -Text 'Test test2' -Alignment center -Color Red -FontSize 20
        }
    }
    #>
    $Table = @(
        [PSCustomObject] @{ NumberTest = 1; BoolTest = $false; StringTest = 'string'; StringTest2 = "true" }
        [PSCustomObject] @{ NumberTest = 1; BoolTest = $false; StringTest = 'string'; StringTest2 = "true" }
    )
    New-HTMLTable -DataTable $Table {
        New-HTMLTableCondition -Name 'NumberTest' -Type number -Operator eq -Value 1 -BackgroundColor Yellow
        New-HTMLTableCondition -Name 'BoolTest' -Type bool -Operator eq -Value $false -BackgroundColor Gold
        New-HTMLTableCondition -Name 'StringTest' -Type string -Operator eq -Value 'string' -BackgroundColor Green -FontSize 50
    }
    <#
    New-HTMLTable -DataTable $Process -DefaultSortIndex 10 -OrderMulti {
        New-HTMLTableCondition -Name 'Handles' -Type number -Operator gt -Value 300 -BackgroundColor Yellow -Row
        New-HTMLTableCondition -Name 'Name' -Type string -Operator eq -Value '1Password' -BackgroundColor Gold
        New-HTMLTableCondition -Name 'BasePriority' -Type number -Operator gt -Value 5 -BackgroundColor Green -FontSize 50
    }
    #>
}
