function New-DiagramGroup {
    <#
    .SYNOPSIS
    Adds a named group of nodes that readers can collapse or expand.

    .DESCRIPTION
    Use inside New-HTMLDiagram. An expanded group draws a labeled boundary
    around its members at their current positions. A collapsed group displays
    one node and keeps links to nodes in other groups or outside any group.
    Links that share endpoints after folding are shown together. Expanding
    the group restores the individual links.
    Each node can belong to one group, and group names must be unique within
    the diagram. Diagram search expands groups when applying a new filter.

    .PARAMETER Name
    The label displayed on the group and its collapse or expand button.

    .PARAMETER NodeId
    The IDs of nodes declared in the same New-HTMLDiagram block.

    .PARAMETER Collapsed
    Start with the group collapsed.

    .EXAMPLE
    New-HTMLDiagram {
        New-DiagramNode -Id 'proxy' -Label 'Reverse proxy'
        New-DiagramNode -Id 'web' -Label 'Web server'
        New-DiagramGroup -Name 'DMZ' -NodeId 'proxy', 'web' -Collapsed
        New-DiagramLink -From 'proxy' -To 'web'
    }

    .OUTPUTS
    System.Collections.IDictionary
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][ValidateNotNullOrEmpty()][string] $Name,
        [Parameter(Mandatory)][ValidateNotNullOrEmpty()][string[]] $NodeId,
        [switch] $Collapsed
    )

    @{
        Type     = 'DiagramGroup'
        Settings = [ordered] @{
            name      = $Name
            nodeIds   = $NodeId
            collapsed = $Collapsed.IsPresent
        }
    }
}
