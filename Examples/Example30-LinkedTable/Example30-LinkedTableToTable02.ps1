Import-Module .\PSWriteHTML.psd1 -Force

$Processes = Get-Process | Select-Object -First 3 -Property Name, ProcessName, Id, FileVersion, WorkingSet

New-HTML -TitleText 'My Title' -Online -FilePath $PSScriptRoot\Example30-LinkedTableToTable02.html -ShowHTML {
    New-HTMLTableOption -DataStore Javascript
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -DataTableID 'RandomID1' {
                New-TableEvent -ID 'RandomID2' -SourceColumnID 0 -TargetColumnId 0
                New-TableEvent -ID 'RandomID3' -SourceColumnID 0 -TargetColumnId 0
            }
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -DataTableID 'RandomID2'
        }
    }
    New-HTMLPanel {
        New-HTMLTable -DataTable $Processes -DataTableID 'RandomID3'
    }
}