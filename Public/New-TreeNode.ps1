function New-TreeNode {
    [CmdletBinding()]
    param(
        [scriptblock] $Children,
        [string] $Title,
        [string] $Id,
        [switch] $Folder
    )

    if ($Children) {
        [Array] $SourceChildren = & $Children
    }

    $Node = [ordered] @{
        title  = $Title
        key    = $Id
        folder = $Folder.IsPresent
    }
    if ($SourceChildren.Count) {
        $Node['children'] = $SourceChildren
    }
    $Node
}