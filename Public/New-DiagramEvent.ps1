function New-DiagramEvent {
    <#
    .SYNOPSIS
    Allows to connect Diagrams with Tables using Events.

    .DESCRIPTION
    Allows to connect Diagrams with Tables using Events.

    .PARAMETER ID
    ID of the table to connect with the diagram.

    .PARAMETER ColumnID
    Column Number of the table to connect with the diagram.

    .EXAMPLE
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

    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param(
        #[switch] $FadeSearch,
        [string] $ID,
        [nullable[int]] $ColumnID
    )

    $Object = [PSCustomObject] @{
        Type     = 'DiagramEvent'
        Settings = @{
            # OnClick = $OnClick.IsPresent
            ID       = $ID
            # FadeSearch = $FadeSearch.IsPresent
            ColumnID = $ColumnID
        }
    }
    $Object
}