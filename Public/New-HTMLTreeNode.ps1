function New-HTMLTreeNode {
    <#
    .SYNOPSIS
    Creates a new HTML tree node with specified properties.

    .DESCRIPTION
    This function creates a new HTML tree node with the specified properties. It allows for customization of various attributes such as title, ID, folder structure, tooltip, icon, selection status, expansion status, etc.

    .PARAMETER Children
    Specifies the script block that defines the children nodes of the tree node.

    .PARAMETER Title
    Specifies the title of the tree node.

    .PARAMETER Id
    Specifies the unique identifier of the tree node.

    .PARAMETER Folder
    Indicates whether the tree node represents a folder.

    .PARAMETER Tooltip
    Specifies the tooltip text for the tree node.

    .PARAMETER Icon
    Specifies the icon for the tree node.

    .PARAMETER IconTooltip
    Specifies the tooltip text for the icon.

    .PARAMETER IsSelected
    Indicates whether the tree node is selected.

    .PARAMETER IsExpanded
    Indicates whether the tree node is expanded.

    .PARAMETER Unselectable
    Indicates whether the tree node is unselectable.

    .PARAMETER Checkbox
    Specifies the type of checkbox for the tree node. Valid values are 'none', 'checkbox', or 'radio'.

    .PARAMETER HrefLink
    Specifies the URL link for the tree node.

    .PARAMETER Target
    Specifies the target window for the URL link. Valid values are "_blank", "_self", "_parent", "_top", or a frame name.

    .EXAMPLE
    New-HTMLTreeNode -Title "Folder 1" -Id "folder1" -Folder -Children {
        New-HTMLTreeNode -Title "Item 1" -Id "item1"
        New-HTMLTreeNode -Title "Item 2" -Id "item2"
    }

    .EXAMPLE
    New-HTMLTreeNode -Title "Document" -Id "doc1" -HrefLink "https://example.com" -Target "_blank"

    #>
    [CmdletBinding()]
    param(
        [scriptblock] $Children,
        [string] $Title,
        [string] $Id,
        [switch] $Folder,
        [string] $Tooltip,
        [string] $Icon,
        [string] $IconTooltip,
        [switch] $IsSelected,
        [alias('Expanded')][switch] $IsExpanded,
        [switch] $Unselectable,
        [ValidateSet('none', 'checkbox', 'radio')][string] $Checkbox,
        [alias('Url', 'Link', 'UrlLink', 'Href')][string] $HrefLink,
        [string] $Target # "_blank|_self|_parent|_top|framename"
    )

    if ($Children) {
        [Array] $SourceChildren = & $Children
        $NestedChildren = $SourceChildren.Node
    }

    $Node = [ordered] @{
        title       = $Title
        key         = $Id
        tooltip     = $Tooltip
        iconTooltip = $IconTooltip
    }
    if ($Checkbox -eq 'radio') {
        $Node['checkbox'] = 'radio'
    } elseif ($Checkbox -eq 'checkbox') {
        $Node['checkbox'] = $true
    }
    if ($Folder) {
        $Node['folder'] = $true
    }
    if ($IsSelected.IsPresent) {
        $Node['selected'] = $true
    }
    if ($IsExpanded.IsPresent) {
        $Node['expanded'] = $true
    }
    if ($SourceChildren.Count) {
        $Node['children'] = @( $NestedChildren )
    }
    if ($Unselectable.IsPresent) {
        $Node['unselectable'] = $true
    }
    if ($HrefLink -and $Target) {
        $Node['data'] = [ordered] @{
            href   = $HrefLink
            target = $Target
        }
    } elseif ($Href) {
        $Node['data'] = [ordered] @{
            href   = $HrefLink
            target = "_blank"
        }
    }
    if ($Icon) {
        $Node['icon'] = $Icon
    }
    Remove-EmptyValue -Hashtable $Node
    [ordered] @{
        Type = 'TreeNode'
        Node = $Node
    }
}