function New-HTMLTree {
    <#
    .SYNOPSIS
    Creates a new HTML tree using FancyTree with various customization options.

    .DESCRIPTION
    This function creates a new HTML tree using FancyTree with the ability to customize the tree's appearance and behavior. It supports features like checkboxes, radio buttons, selection modes, icons, keyboard navigation, quick search, child counters, and more.

    .PARAMETER Data
    The script block that contains the data to populate the tree.

    .PARAMETER Checkbox
    Specifies the type of checkboxes to be displayed in the tree. Valid values are 'none', 'checkbox', or 'radio'. Default is 'none'.

    .PARAMETER SelectMode
    Specifies the selection mode for the tree. Valid values are 'none', '1', '2', or '3'. Default is '2'.

    .PARAMETER DisableIcons
    Disables icons in the tree if this switch is present.

    .PARAMETER DisableControl
    Disables control features in the tree if this switch is present.

    .PARAMETER DisableKeyboardNavigation
    Disables keyboard navigation in the tree if this switch is present.

    .PARAMETER AutoCollapseSibling
    Automatically collapses sibling nodes when a node is expanded.

    .PARAMETER AutoScroll
    Enables auto-scrolling when navigating the tree.

    .PARAMETER EnableQuickSearch
    Enables quick search functionality in the tree.

    .PARAMETER EnableChildCounter
    Enables child counter display in the tree.

    .PARAMETER WideSelection
    Enables wide selection mode in the tree.

    .PARAMETER MinimumExpandLevel
    Specifies the minimum level of nodes to expand in the tree.

    .EXAMPLE
    New-HTMLTree -Data {
        TreeNode -Node "Root" -Children {
            TreeNode -Node "Child 1"
            TreeNode -Node "Child 2"
        }
    } -Checkbox 'checkbox' -SelectMode '3' -EnableChildCounter -WideSelection

    Creates a new HTML tree with checkboxes, hierarchical selection mode, child counters, and wide selection enabled.

    #>
    [CmdletBinding()]
    param(
        [scriptblock] $Data,
        [ValidateSet('none', 'checkbox', 'radio')][string] $Checkbox = 'none',
        [ValidateSet('none', '1', '2', '3')] $SelectMode = '2',
        [switch] $DisableIcons,
        [switch] $DisableControl,
        [switch] $DisableKeyboardNavigation,
        [switch] $AutoCollapseSibling,
        [switch] $AutoScroll,
        [switch] $EnableQuickSearch,
        [switch] $EnableChildCounter,
        [switch] $WideSelection,
        [nullable[int]] $MinimumExpandLevel
    )
    $Script:HTMLSchema.Features.MainFlex = $true
    $Script:HTMLSchema.Features.Jquery = $true
    $Script:HTMLSchema.Features.FancyTree = $true

    [string] $ID = "FancyTree" + (Get-RandomStringName -Size 8)

    if ($Data) {
        [Array] $Source = & $Data
    }

    $ChildCounter = [ordered] @{}
    $Nodes = [System.Collections.Generic.List[object]]::new()
    if ($Source.Count -gt 0) {
        foreach ($S in $Source) {
            if ($S.Type -eq 'TreeNode') {
                $Nodes.Add($S.Node)
            } elseif ($S.Type -eq 'ChildCounter') {
                $ChildCounter = $S.childcounter
            }
        }
    }

    # https://wwwendt.de/tech/fancytree/doc/jsdoc/global.html#FancytreeOptions
    $FancyTree = [ordered] @{}

    $FancyTree['extensions'] = @(
        "edit"
        "filter"
        if ($EnableChildCounter.IsPresent -or $ChildCounter.Count -gt 0) {
            "childcounter"
        }
        if ($WideSelection) {
            "wide"
        }
    )

    if ($Checkbox -eq 'none') {
        #$FancyTree['checkbox'] = $Checkbox # true/false/radio
    } elseif ($Checkbox -eq 'radio') {
        $FancyTree['checkbox'] = 'radio'
    } else {
        $FancyTree['checkbox'] = $true
    }
    <#
    Fancytree supports three modes:

    selectMode: 1: single selection, Only one node is selected at any time.
    selectMode: 2: multiple selection (default), Every node may be selected independently.
    selectMode: 3: hierarchical selection, (De)selecting a node will propagate to all descendants. Mixed states will be displayed as partially selected using a tri-state checkbox.
    #>
    if ($SelectMode -ne 'none') {
        $FancyTree['selectMode'] = $SelectMode # 3, // 1, 2, 3
    }
    if ($DisableIcons.IsPresent) {
        $FancyTree['icons'] = $false
    }
    if ($DisableControl.IsPresent) {
        $FancyTree['disabled'] = $true
    }
    if ($DisableKeyboardNavigation.IsPresent) {
        $FancyTree['keyboard'] = $false
    }
    if ($AutoCollapseSibling.IsPresent) {
        # Automatically collapse all siblings, when a node is expanded (default: false)
        $FancyTree['autoCollapse'] = $true
    }
    if ($AutoScroll.IsPresent) {
        # Automatically scroll nodes into visible area
        $FancyTree['autoScroll'] = $true
    }
    if ($EnableQuickSearch.IsPresent) {
        # Navigate to next node by typing the first letters
        $FancyTree['quicksearch'] = $true
    }
    if ($ChildCounter.Count -gt 0) {
        $FancyTree['childcounter'] = $ChildCounter
    }
    if ($MinimumExpandLevel) {
        $FancyTree['minExpandLevel'] = $MinimumExpandLevel
    }
    if ($Nodes.Count -gt 0) {
        $FancyTree['source'] = $Nodes
    }
    Remove-EmptyValue -Hashtable $FancyTree -Rerun 1 -Recursive

    # Build HTML
    $Div = New-HTMLTag -Tag 'div' -Attributes @{ id = $ID; class = 'fancyTree' }


    $Activation = @"
    function (event, data) {
        var node = data.node;
        // Use <a> href and target attributes to load the content:
        if (node.data.href) {
            // Open target
            window.open(node.data.href, node.data.target);
            // or open target in iframe
            //$("[name=contentFrame]").attr("src", node.data.href);
        }
    },
"@



    $FancyTree['activate'] = "templateToReplace"

    $FancyTreeJSON = $FancyTree | ConvertTo-Json -Depth 100 #| ForEach-Object { [System.Text.RegularExpressions.Regex]::Unescape($_) }

    $FancyTreeJSON = $FancyTreeJSON -replace '"templateToReplace"', $Activation

    $Script = New-HTMLTag -Tag 'script' -Value {
        $DivID = -join ('#', $ID)
        # Convert Dictionary to JSON and return chart within SCRIPT tag
        # Make sure to return with additional empty string

        '$(function(){  // on page load'
        "`$(`"$DivID`").fancytree("
        $FancyTreeJSON
        ');'
        '});'
    } -NewLine

    # Return Data
    $Div
    $Script
}