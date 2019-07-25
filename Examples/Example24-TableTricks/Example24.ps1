Import-Module .\PSWriteHTML.psd1 -Force

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
    <#
    'SI'
    'Handles'
    'VM'
    'WS'
    'PM'
    'NPM'
    #>
)
$ProcessesAll = Get-Process | Select-Object -First 30
$Processes = $ProcessesAll | Select-Object -First 30 -Property $Properties

New-HTML -TitleText 'Title' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example08.html -ShowHTML {
    New-HTMLContent -HeaderText '0 section' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter -ScrollCollapse {

                New-HTMLTableHeader -Names 'Name', 'ID' -Title 'Process Information' -Color Red -FontWeight lighter -Alignment left -BackGroundColor LightBlue

                New-HTMLTableHeader -Names 'PagedMemorySize', 'PrivateMemorySize', 'VirtualMemorySize' -Title 'Memory' -Color White -BackGroundColor Blue
                New-HTMLTableHeader -Names 'Name' -BackGroundColor Red -Color WhiteSmoke
                New-HTMLTableHeader -Names 'Id' -BackGroundColor Blue -Color White
                New-HTMLTableHeader -Names 'PriorityClass', 'FileVersion', 'HandleCount' -BackGroundColor Gold -Color White
                New-HTMLTableHeader -BackGroundColor Green -Color White -Title 'Full Title'
                #New-HTMLTableCondition -Name 'HandleCount' -ComparisonType number -Operator gt -Value 500 -BackgroundColor Gray -Color White
                # New-HTMLTableCondition -Name 'FileVersion' -ComparisonType string -Operator eq -Value '1.36.1' -BackgroundColor Gold -Color White -FontWeight bold -Alignment center -TextDecoration line-through

                #New-HTMLTableContent -Names 'Name' -Row 5 -BackGroundColor Blue
                #New-HTMLTableContent -Names 'Name' -Row 1 -BackGroundColor Yellow
                #New-HTMLTableContent -Names 'HandleCount' -Row 1 -BackGroundColor Yellow
            }

            New-HTMLTable -DataTable $Processes -HideFooter -ScrollCollapse {
                New-HTMLTableHeader -Names 'Name', 'ID' -Title 'Process Information' -Color Red -FontWeight lighter -Alignment left -BackGroundColor LightBlue

                New-HTMLTableHeader -Names 'PagedMemorySize', 'PrivateMemorySize', 'VirtualMemorySize' -Title 'Memory' -Color White -BackGroundColor Blue
                New-HTMLTableHeader -Names 'Name' -BackGroundColor Red -Color WhiteSmoke
                New-HTMLTableHeader -Names 'Id' -BackGroundColor Blue -Color White
                New-HTMLTableHeader -Names 'PriorityClass', 'FileVersion', 'HandleCount' -BackGroundColor Gold -Color White
                New-HTMLTableHeader -BackGroundColor Green -Color White -Title 'Full Title'
                <#
                New-HTMLTableHeader -Names 'Name', 'ID' -Title 'Process Information' -Color Red -FontWeight lighter -Alignment left -BackGroundColor LightBlue
                New-HTMLTableHeader -Names 'PagedMemorySize', 'PrivateMemorySize', 'VirtualMemorySize' -Title 'Memory' -Color White -BackGroundColor Blue
                New-HTMLTableHeader -Names 'Name' -BackGroundColor Red -Color WhiteSmoke
                New-HTMLTableHeader -Names 'Id' -BackGroundColor Blue -Color White
                New-HTMLTableHeader -Names 'PriorityClass', 'FileVersion', 'HandleCount' -BackGroundColor Gold -Color White
                New-HTMLTableHeader -BackGroundColor Green -Color White -Title 'Full Title'
                New-HTMLTableCondition -Name 'HandleCount' -ComparisonType number -Operator gt -Value 500 -BackgroundColor Gray -Color White
                New-HTMLTableCondition -Name 'FileVersion' -ComparisonType string -Operator eq -Value '1.36.1' -BackgroundColor Gold -Color White -FontWeight bold -Alignment center -TextDecoration line-through
                #>
                New-HTMLTableContent -Names 'Name' -Row 5 -BackGroundColor Blue
                New-HTMLTableContent -Names 'Name' -Row 1 -BackGroundColor Yellow
                New-HTMLTableContent -Names 'HandleCount' -Row 1 -BackGroundColor Yellow -FontStyle italic
                New-HTMLTableContent -Names 'HandleCount' -Row 2 -BackGroundColor Blue -Color White -FontStyle italic
                New-HTMLTableContent -ColumnIndex 8 -Row 2 -BackGroundColor Blue -Color White -FontStyle italic
                New-HTMLTableContent -ColumnIndex 3 -Row 6 -BackGroundColor Blue -Color White -FontStyle italic
                New-HTMLTableContent -ColumnIndex 1 -Row 4 -BackGroundColor Blue -Color White -FontStyle italic
            }
        }
    }
}