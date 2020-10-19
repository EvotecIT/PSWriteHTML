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

New-HTML -TitleText 'Title' -Online -FilePath $PSScriptRoot\Example08_02.html -ShowHTML {
    New-HTMLSection -HeaderText '2 section' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter {
                New-HTMLTableHeader -Title 'Process Information'
            }
        }
    }
}

