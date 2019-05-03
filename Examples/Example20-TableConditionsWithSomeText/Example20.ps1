Import-Module .\PSWriteHTML.psd1 -Force

$Process = Get-Process | Select-Object -First 70

New-HTML -TitleText 'My title' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example20.html {
    New-HTMLContent -HeaderText 'Test' {
        New-HTMLTable -DataTable $Process -PagingOptions @(50, 100, 150, 200) -Find 'chrome' {
            New-HTMLText -Text 'Test test' -Alignment center -Color Red -FontSize 20
            New-HTMLTableCondition -Name 'HandleCount' -Type number -Operator gt -Value 300 -BackgroundColor Yellow
            New-HTMLTableCondition -Name 'ID' -Type number -Operator gt -Value 16000 -BackgroundColor Green
            New-HTMLTableCondition -Name 'Name' -Type string -Operator eq -Value 'browser_broker' -BackgroundColor Gold -Row
        }
        New-HTMLTable -DataTable $Process -PagingOptions @(50, 100, 150, 200) -DefaultSortColumn 'PriorityClass' {
            New-HTMLText -Text 'Test test' -Alignment center -Color Red -FontSize 20
            New-HTMLText -Text 'Test test' -Alignment center -Color Red -FontSize 20
            New-HTMLTableCondition -Name 'HandleCount' -Type number -Operator gt -Value 300 -BackgroundColor Yellow
            New-HTMLTableCondition -Name 'ID' -Type number -Operator gt -Value 16000 -BackgroundColor Green
            New-HTMLTableCondition -Name 'Name' -Type string -Operator eq -Value 'browser_broker' -BackgroundColor Gold -Row
        }
    }
    New-HTMLContent -HeaderText 'Test' {
        New-HTMLContainer {
            New-HTMLText -Text 'Test test' -Alignment center -Color Red -FontSize 20
            New-HTMLTable -DataTable $Process -PagingOptions @(50, 100, 150, 200) -DefaultSortColumn 'PriorityClass' {
                New-HTMLTableCondition -Name 'HandleCount' -Type number -Operator gt -Value 300 -BackgroundColor Yellow
                New-HTMLTableCondition -Name 'ID' -Type number -Operator gt -Value 16000 -BackgroundColor Green
                New-HTMLTableCondition -Name 'Name' -Type string -Operator eq -Value 'browser_broker' -BackgroundColor Gold -Row
            }
            New-HTMLText -Text 'Test test' -Alignment center -Color Red -FontSize 20
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
