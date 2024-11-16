Import-Module .\PSWriteHTML.psd1 -Force

$Processes = Get-Process | Select-Object -First 10 -Property Id, ProcessName
$TableID = 'RandomID'

New-HTML -TitleText 'My Title' -FilePath $PSScriptRoot\Example-LinkedDiagramWithTable.html {
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -DataTableID $TableID -DataStore JavaScript
        }
        New-HTMLPanel {
            New-HTMLDiagram -Height '1000px' {
                New-DiagramEvent -ID $TableID -ColumnID 0
                New-DiagramNode -Label 'Processes' -IconBrands delicious
                foreach ($_ in $Processes) {
                    New-DiagramNode -Label $_.ProcessName -Id $_.Id -To 'Processes'
                }
            }
        }
    }
} -Online -ShowHTML