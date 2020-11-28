function New-HTMLHierarchicalTree {
    [cmdletBinding()]
    param(
        [ScriptBlock] $TreeView
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
        .initialize();
"@
    } -NewLine

    # Send HTML
    $Section
    $Script
}