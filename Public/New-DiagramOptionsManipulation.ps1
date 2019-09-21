function New-DiagramOptionsManipulation {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER InitiallyActive
    Parameter description

    .PARAMETER AddNode
    Parameter description

    .PARAMETER AddEdge
    Parameter description

    .PARAMETER EditNode
    Parameter description

    .PARAMETER EditEdge
    Parameter description

    .PARAMETER DeleteNode
    Parameter description

    .PARAMETER DeleteEdge
    Parameter description

    .EXAMPLE
    An example

    .NOTES
    Based on https://visjs.github.io/vis-network/docs/network/manipulation.html#
    It's incomplete

    #>

    [alias('DiagramOptionsManipulation')]
    [CmdletBinding()]
    param(
        [bool] $InitiallyActive = $false,
        [bool] $AddNode = $true,
        [bool] $AddEdge = $true,
        [bool] $EditNode = $true,
        [bool] $EditEdge = $true,
        [bool] $DeleteNode = $true,
        [bool] $DeleteEdge = $true
    )

    $Object = [PSCustomObject] @{
        Type     = 'DiagramOptionsManipulation'
        Settings = @{
            manipulation = [ordered] @{
                enabled         = $true
                initiallyActive = $InitiallyActive
                addNode         = $AddNode
                addEdge         = $AddEdge
                editNode        = $EditNode
                editEdge        = $EditEdge
                deleteNode      = $DeleteNode
                deleteEdge      = $DeleteEdge
            }
        }
    }
    $Object
}