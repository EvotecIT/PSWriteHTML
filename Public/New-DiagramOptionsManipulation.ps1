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
        [nullable[bool]] $InitiallyActive,
        [nullable[bool]] $AddNode,
        [nullable[bool]] $AddEdge,
        [nullable[bool]] $EditNode,
        [nullable[bool]] $EditEdge,
        [nullable[bool]] $DeleteNode,
        [nullable[bool]] $DeleteEdge
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
    Remove-EmptyValue -Hashtable $Object.Settings -Recursive
    $Object
}