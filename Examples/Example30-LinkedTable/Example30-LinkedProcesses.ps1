Import-Module .\PSWriteHTML.psd1 -Force

$Processes = Get-Process | Select-Object -First 3 -Property Name, ProcessName, Id, FileVersion, WorkingSet
$TableID = 'RandomID'

New-HTML -TitleText 'My Title' -Online -FilePath $PSScriptRoot\Example30-LinkedProcesses.html -ShowHTML {
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -DataTableID $TableID
        }
        New-HTMLPanel {
            New-HTMLDiagram {
                New-DiagramEvent -ID $TableID -ColumnID 2
                New-DiagramNode -Label 'Processes' -IconBrands delicious
                foreach ($_ in $Processes) {
                    New-DiagramNode -Label $_.ProcessName -Id $_.Id -To 'Processes'
                }
            }
        }
    }
}