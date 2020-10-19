#Import-Module .\PSWriteHTML.psd1 -Force


$Properties = @(
    'Name'
    'Id'
    'PriorityClass'
    'FileVersion'
    'HandleCount'
    'WorkingSet'
    'PagedMemorySize'
    'PrivateMemorySize'
    'VirtualMemorySize'
    'TotalProcessorTime'
)
$ProcessesAll = Get-Process | Select-Object -First 10
$Processes = $ProcessesAll | Select-Object -First 10 -Property $Properties

New-HTML -TitleText 'Title' -Online -FilePath $PSScriptRoot\Example24_02.html -ShowHTML {
    New-HTMLSection -HeaderText 'Section 1' {
        New-HTMLContainer {
            New-HTMLPanel {
                New-HTMLTable -DataTable $Processes -HideFooter -ScrollCollapse {

                    New-HTMLTableHeader -Names 'Name', 'ID' -Title 'Process Information' -Color Red -FontWeight lighter -Alignment left -BackGroundColor LightBlue

                    New-HTMLTableHeader -Names 'PagedMemorySize', 'PrivateMemorySize', 'VirtualMemorySize' -Title 'Memory' -Color White -BackGroundColor Blue
                    New-HTMLTableHeader -Names 'Name' -BackGroundColor Red -Color WhiteSmoke
                    New-HTMLTableHeader -Names 'Id' -BackGroundColor Blue -Color White
                    New-HTMLTableHeader -Names 'PriorityClass', 'FileVersion', 'HandleCount' -BackGroundColor Gold -Color White
                    New-HTMLTableHeader -BackGroundColor Green -Color White -Title 'Full Title'
                    New-HTMLTableCondition -Name 'HandleCount' -ComparisonType number -Operator gt -Value 500 -BackgroundColor Gray -Color White
                    New-HTMLTableCondition -Name 'FileVersion' -ComparisonType string -Operator eq -Value '1.36.1' -BackgroundColor Gold -Color White -FontWeight bold -Alignment center -TextDecoration line-through
                    New-HTMLTableContent -Names 'Name' -RowIndex 5 -BackGroundColor Blue
                    New-HTMLTableContent -Names 'Name' -RowIndex 1 -BackGroundColor Yellow
                    New-HTMLTableContent -Names 'HandleCount' -RowIndex 1 -BackGroundColor Yellow
                }
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Processes -HideFooter -Simplify {
                    New-HTMLTableContent -ColumnIndex 2, 3, 4, 5 -RowIndex 7, 6 -Text 'Replace 4 columns, over 2 rows' -Alignment center -Color Green -FontWeight bold -BackGroundColor Yellow
                }
            }
        }
    }
    New-HTMLSection -HeaderText 'Section 2' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter -ScrollCollapse {

                New-HTMLTableHeader -Names 'Name', 'ID' -Title 'Process Information' -Color Red -FontWeight lighter -Alignment left -BackGroundColor LightBlue
                New-HTMLTableHeader -Names 'PagedMemorySize', 'PrivateMemorySize', 'VirtualMemorySize' -Title 'Memory' -Color White -BackGroundColor Blue
                New-HTMLTableHeader -Names 'Name' -BackGroundColor Red -Color WhiteSmoke
                New-HTMLTableHeader -Names 'Id' -BackGroundColor Blue -Color White
                New-HTMLTableHeader -Names 'PriorityClass', 'FileVersion', 'HandleCount' -BackGroundColor Gold -Color White
                New-HTMLTableHeader -BackGroundColor Green -Color White -Title 'Full Title'
                New-HTMLTableCondition -Name 'HandleCount' -ComparisonType number -Operator gt -Value 500 -BackgroundColor Gray -Color White
                New-HTMLTableCondition -Name 'FileVersion' -ComparisonType string -Operator eq -Value '1.36.1' -BackgroundColor Gold -Color White -FontWeight bold -Alignment center -TextDecoration line-through

                New-HTMLTableContent -RowIndex 5, 3 -BackGroundColor Blue -Color White

                New-HTMLTableContent -ColumnName 'Name', 'PagedMemorySize' -BackGroundColor Gold -Color Green

                New-HTMLTableContent -ColumnIndex 5, 2 -BackGroundColor Green -Color White

                New-HTMLTableContent -ColumnIndex 2 -RowIndex 2 -Text 'Test' -Alignment center -Color Green -FontWeight bold -BackGroundColor Yellow
                New-HTMLTableContent -ColumnIndex 2 -RowIndex 5 -Text 'Test 1' -Alignment center -Color Green -FontWeight bold -BackGroundColor Yellow

                New-HTMLTableContent -ColumnIndex 2, 3, 4, 5 -RowIndex 7, 6 -Text 'Replace 4 columns' -Alignment center -Color Green -FontWeight bold -BackGroundColor Yellow


                New-HTMLTableContent -Names 'Name' -RowIndex 5 -BackGroundColor Blue
                New-HTMLTableContent -Names 'Name' -RowIndex 1 -BackGroundColor Yellow
                New-HTMLTableContent -Names 'HandleCount' -RowIndex 1 -BackGroundColor Yellow -FontStyle italic
                New-HTMLTableContent -Names 'HandleCount' -RowIndex 2 -BackGroundColor Blue -Color White -FontStyle italic
                New-HTMLTableContent -ColumnIndex 8 -RowIndex 2 -BackGroundColor Blue -Color White -FontStyle italic
                New-HTMLTableContent -ColumnIndex 3 -RowIndex 6 -BackGroundColor Blue -Color White -FontStyle italic
                New-HTMLTableContent -ColumnIndex 1 -RowIndex 4 -BackGroundColor Blue -Color White -FontStyle italic

                New-HTMLTableCondition -Name 'FileVersion' -ComparisonType string -Operator eq -Value '1.36.1' -BackgroundColor Gold -Color White -FontWeight bold -Alignment center -TextDecoration line-through -Inline
                New-HTMLTableCondition -Name 'FileVersion' -ComparisonType string -Operator eq -Value '10.1905.30.0' -BackgroundColor Green -Color White -FontWeight bold -Alignment center -TextDecoration line-through -Inline -Row
                New-HTMLTableCondition -Name 'FileVersion' -ComparisonType string -Operator eq -Value '1.36.1' -BackgroundColor Red -Color White -FontWeight bold -Inline -row
                New-HTMLTableCondition -Name 'Name' -Operator ne -Value 'AppVShNotify' -BackgroundColor Red -Color White -Inline -row
                New-HTMLTableCondition -ComparisonType 'number' -Name 'Id' -Operator gt -Value 15000 -BackgroundColor Green -Color White -Inline #-row
                New-HTMLTableCondition -ComparisonType 'number' -Name 'Id' -Operator lt -Value 15000 -BackgroundColor Red -Color White -Inline #-row
                New-HTMLTableCondition -ComparisonType string -Name 'Name' -Operator eq -Value 'Code' -BackgroundColor blue -Color White -Inline -row
            }
        }
    }
}