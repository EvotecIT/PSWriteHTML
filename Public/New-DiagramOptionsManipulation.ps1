function New-DiagramOptionsManipulation {
    <#
    .SYNOPSIS
    Creates a new object for manipulating diagram options in a network visualization.

    .DESCRIPTION
    This function creates a new object that allows manipulation of diagram options in a network visualization. It provides options to control the initial state of manipulation tools and specify which manipulation actions are allowed.

    .PARAMETER InitiallyActive
    Specifies whether the manipulation tools are initially active upon loading the visualization.

    .PARAMETER AddNode
    Specifies whether the option to add nodes is enabled.

    .PARAMETER AddEdge
    Specifies whether the option to add edges is enabled.

    .PARAMETER EditNode
    Specifies whether the option to edit nodes is enabled.

    .PARAMETER EditEdge
    Specifies whether the option to edit edges is enabled.

    .PARAMETER DeleteNode
    Specifies whether the option to delete nodes is enabled.

    .PARAMETER DeleteEdge
    Specifies whether the option to delete edges is enabled.

    .EXAMPLE
    $options = New-DiagramOptionsManipulation -InitiallyActive $true -AddNode $true -AddEdge $true
    Creates a new object with manipulation options where adding nodes and edges is allowed and the manipulation tools are initially active.

    .NOTES
    This function is based on the official vis.js documentation for network manipulation: https://visjs.github.io/vis-network/docs/network/manipulation.html
    Please note that this implementation is incomplete and may require additional customization.
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