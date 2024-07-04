function New-HierarchicalTreeNode {
    <#
    .SYNOPSIS
    Creates a new hierarchical tree node object.

    .DESCRIPTION
    This function creates a new hierarchical tree node object with specified properties.

    .PARAMETER ID
    The unique identifier for the node.

    .PARAMETER Label
    The label or name of the node.

    .PARAMETER Type
    The type of the node. Default value is "Organism".

    .PARAMETER Description
    The description of the node.

    .PARAMETER To
    The parent node ID to which this node is connected.

    .EXAMPLE
    $node = New-HierarchicalTreeNode -ID "1" -Label "Node 1" -Description "This is node 1" -To "0"
    Creates a new hierarchical tree node with ID "1", label "Node 1", description "This is node 1", and connected to parent node with ID "0".

    .EXAMPLE
    $node = New-HierarchicalTreeNode -ID "2" -Label "Node 2" -Type "Animal" -Description "This is node 2" -To "1"
    Creates a new hierarchical tree node with ID "2", label "Node 2", type "Animal", description "This is node 2", and connected to parent node with ID "1".
    #>
    [alias('HierarchicalTreeNode')]
    [CmdletBinding()]
    param(
        [string] $ID,
        [alias('Name')][string] $Label,
        [string] $Type = "Organism",
        [string] $Description,
        [string] $To
    )

    if (-not $ID) {
        $ID = $Label
    }

    $Object = [PSCustomObject] @{
        Type     = 'TreeNode'
        Settings = [ordered] @{
            "id"          = $ID
            "parentId"    = $To
            "name"        = $Label
            #"type"        = $Type
            "description" = $Description
        }
    }
    Remove-EmptyValue -Hashtable $Object.Settings -Recursive
    $Object
}

