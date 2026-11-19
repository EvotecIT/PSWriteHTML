function Resolve-DiagramGroups {
    <#
    .SYNOPSIS
    Resolves group membership to the diagram's declared node IDs.
    .DESCRIPTION
    Rejects ambiguous names, unknown nodes and overlapping membership before
    creating the report. Uses the declared ID casing for vis-network.
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IList] $Groups,
        [System.Collections.IDictionary] $Nodes
    )

    $GroupNames = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    $GroupedNodes = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    foreach ($Group in $Groups) {
        if (-not $GroupNames.Add($Group.name)) {
            throw "Diagram group '$($Group.name)' is declared more than once."
        }
        $NodeIds = foreach ($NodeId in $Group.nodeIds) {
            if (-not $Nodes.Contains($NodeId)) {
                throw "Diagram group '$($Group.name)' refers to unknown node '$NodeId'."
            }
            $DeclaredId = $Nodes[$NodeId].id
            if (-not $GroupedNodes.Add($DeclaredId)) {
                throw "Diagram node '$DeclaredId' may only be listed once in a diagram group."
            }
            $DeclaredId
        }
        [ordered] @{
            name      = $Group.name
            nodeIds   = @($NodeIds)
            collapsed = $Group.collapsed
        }
    }
}
