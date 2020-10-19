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
)
$ProcessesAll = Get-Process | Select-Object -First 10
$Processes = $ProcessesAll | Select-Object -First 10 -Property $Properties

New-HTML -TitleText 'Title' -Online:$false -FilePath $PSScriptRoot\Example24_01.html -ShowHTML {
    New-HTMLSection -HeaderText '0 section' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter -ScrollCollapse {
                New-HTMLTableContent -Names 'Name' -RowIndex 5 -BackGroundColor Blue
                New-HTMLTableContent -Names 'Name' -RowIndex 1 -BackGroundColor Yellow
                New-HTMLTableContent -Names 'HandleCount' -RowIndex 1 -BackGroundColor Yellow

                New-HTMLTableContent -ColumnIndex 7 -RowIndex 4 -BackGroundColor Gold -Color Blue -FontStyle italic -Text "I HAVE REPLACED THIS" -FontSize 15 -Alignment center
                New-HTMLTableContent -ColumnName 'Name' -RowIndex 4 -BackGroundColor Gold -Color Blue -FontStyle italic -Text "I HAVE REPLACED THIS" -FontSize 15 -Alignment center
            } #-Simplify
        }
    }
}