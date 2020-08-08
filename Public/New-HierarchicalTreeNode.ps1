function New-HierarchicalTreeNode {
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

