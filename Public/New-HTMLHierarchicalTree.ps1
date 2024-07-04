function New-HTMLHierarchicalTree {
    <#
    .SYNOPSIS
    Creates a hierarchical tree structure in HTML using D3.js.

    .DESCRIPTION
    This function generates an HTML hierarchical tree structure based on the provided tree view data using D3.js library.

    .PARAMETER TreeView
    Specifies the tree view data to be used for generating the hierarchical tree structure.

    .PARAMETER Autosize
    Indicates whether the SVG should be sized based on the nodes or use configured height/width for the SVG.

    .EXAMPLE
    New-HTMLHierarchicalTree -TreeView {
        @{
            Type = 'TreeNode'
            Settings = @{
                id = 1
                parentId = 0
                name = 'Root'
                description = 'Root Node'
            }
        }
    } -Autosize
    # Generates a hierarchical tree with a root node.

    #>
    [cmdletBinding()]
    param(
        [ScriptBlock] $TreeView,
        [Switch]$Autosize
    )
    $Script:HTMLSchema.Features.MainFlex = $true
    $Script:HTMLSchema.Features.D3Mitch = $true

    [string] $ID = "HierarchicalTree-" + (Get-RandomStringName -Size 8)

    $TreeNodes = [System.Collections.Generic.List[System.Collections.IDictionary]]::new()

    [Array] $Settings = & $TreeView
    foreach ($Object in $Settings) {
        if ($Object.Type -eq 'TreeNode') {
            $TreeNodes.Add($Object.Settings)
        }
    }

    # Prepare NODES
    $Data = $TreeNodes | ConvertTo-Json -Depth 5

    # Set sizing mode
    if ($Autosize) {
        $SizingMode = 'nodeSize'  # Size the SVG based on the nodes
    } else {
        $SizingMode = 'size'      # Use configured height/width for the SVG
    }

    # Prepare HTML
    $Section = New-HTMLTag -Tag 'section' -Attributes @{ id = $ID; class = 'hierarchicalTree' }
    $Script = New-HTMLTag -Tag 'script' -Value { @"
        var data = $Data;
        var treePlugin = new d3.mitchTree.boxedTree()
        .setIsFlatData(true)
        .setData(data)
        .setElement(document.getElementById("$ID"))
        .setIdAccessor(function (data) {
            return data.id;
        })
        .setParentIdAccessor(function (data) {
            return data.parentId;
        })
        .setBodyDisplayTextAccessor(function (data) {
            return data.description;
        })
        .setTitleDisplayTextAccessor(function (data) {
            return data.name;
        })
        .getNodeSettings()
            .setSizingMode('${SizingMode}')
            .back()
        .initialize();
"@
    } -NewLine

    # Send HTML
    $Section
    $Script
}