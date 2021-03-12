Import-Module .\PSWriteHTML.psd1 -Force

$Process = Get-Process | Select-Object -First 10

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example20.html -Show {
    New-HTMLSection -HeaderText 'Test' -BackgroundColor Azure {
        New-HTMLTable -DataTable $Process -PagingOptions @(50, 100, 150, 200) -Find 'chrome' {
            New-HTMLTableButtonPDF
            New-HTMLTableCondition -Name 'HandleCount' -Type number -Operator gt -Value 300 -BackgroundColor Yellow
            New-HTMLTableCondition -Name 'ID' -Type number -Operator gt -Value 16000 -BackgroundColor Green
            New-HTMLTableCondition -Name 'Name' -Type string -Operator eq -Value 'browser_broker' -BackgroundColor Gold -Row
        } -PreContent {
            New-HTMLText -Text 'This will be before. You can put other html here.' -Alignment center -Color Red -FontSize 20
        } -PostContent {
            New-HTMLText -Text 'This will be after table. You can put other html here.' -Alignment center -Color Blue -FontSize 20
        } -ResponsivePriorityOrder NonpagedSystemMemorySize, PeakWorkingSet64, Company -ResponsivePriorityOrderIndex 20
        New-HTMLTable -DataTable $Process -PagingOptions @(50, 100, 150, 200) -DefaultSortColumn 'PriorityClass' {
            New-HTMLText -Text 'This also works... ' -Alignment center -Color Red -FontSize 20
            New-HTMLText -Text 'But it doesnt have the same control' -Alignment center -Color Red -FontSize 20
            New-HTMLTableCondition -Name 'HandleCount' -Type number -Operator gt -Value 300 -BackgroundColor Yellow
            New-HTMLTableCondition -Name 'ID' -Type number -Operator gt -Value 16000 -BackgroundColor Green
            New-HTMLTableCondition -Name 'Name' -Type string -Operator eq -Value 'browser_broker' -BackgroundColor Gold -Row
        }
    }
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
                New-HTMLTableCondition -Name 'HandleCount' -Type number -Operator gt -Value 300 -BackgroundColor Yellow
                New-HTMLTableCondition -Name 'ID' -Type number -Operator gt -Value 16000 -BackgroundColor Green
                New-HTMLTableCondition -Name 'Name' -Type string -Operator eq -Value 'browser_broker' -BackgroundColor Gold -Row
            }
            New-HTMLText -Text 'Test test2' -Alignment center -Color Red -FontSize 20
        }
    }
    New-HTMLTable -DataTable $Process -DefaultSortIndex 10 -OrderMulti {
        New-HTMLTableCondition -Name 'HandleCount' -Type number -Operator gt -Value 300 -BackgroundColor Yellow
        New-HTMLTableCondition -Name 'ID' -Type number -Operator gt -Value 16000 -BackgroundColor Green
        New-HTMLTableCondition -Name 'Name' -Type string -Operator eq -Value 'browser_broker' -BackgroundColor Gold -Row
    }
}
