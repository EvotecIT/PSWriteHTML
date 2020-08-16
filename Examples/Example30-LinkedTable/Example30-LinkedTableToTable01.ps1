Import-Module .\PSWriteHTML.psd1 -Force

$Processes = Get-Process | Select-Object -First 3 -Property Name, ProcessName, Id, FileVersion, WorkingSet

New-HTML -TitleText 'My Title' -Online -FilePath $PSScriptRoot\Example30-LinkedTableToTable01.html -ShowHTML {
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -DataTableID 'RandomID1'
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -DataTableID 'RandomID2'
        }
    }
}