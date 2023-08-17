function New-HTMLTreeNode {
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