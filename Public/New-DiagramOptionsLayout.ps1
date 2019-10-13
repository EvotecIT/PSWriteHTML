function New-DiagramOptionsLayout {
    [alias('DiagramOptionsLayout')]
    [CmdletBinding()]
    param(
        [nullable[int]] $RandomSeed,
        [nullable[bool]] $ImprovedLayout,
        [nullable[int]] $ClusterThreshold ,
        [nullable[bool]] $HierarchicalEnabled,
        [nullable[int]] $HierarchicalLevelSeparation,
        [nullable[int]] $HierarchicalNodeSpacing,
        [nullable[int]] $HierarchicalTreeSpacing,
        [nullable[bool]] $HierarchicalBlockShifting,
        [nullable[bool]] $HierarchicalEdgeMinimization,
        [nullable[bool]] $HierarchicalParentCentralization,
        [ValidateSet('FromUpToDown', 'FromDownToUp', 'FromLeftToRight', 'FromRigthToLeft')][string] $HierarchicalDirection,
        [ValidateSet('hubsize', 'directed')][string] $HierarchicalSortMethod
    )
    $Direction = @{
        FromUpToDown    = 'UD'
        FromDownToUp    = 'DU'
        FromLeftToRight = 'LR'
        FromRigthToLeft = 'RL'
    }

    $Object = [PSCustomObject] @{
        Type     = 'DiagramOptionsLayout'
        Settings = @{
            layout = [ordered] @{
                randomSeed       = $RandomSeed
                improvedLayout   = $ImprovedLayout
                clusterThreshold = $ClusterThreshold
                hierarchical     = @{
                    enabled              = $HierarchicalEnabled
                    levelSeparation      = $HierarchicalLevelSeparation
                    nodeSpacing          = $HierarchicalNodeSpacing
                    treeSpacing          = $HierarchicalTreeSpacing
                    blockShifting        = $HierarchicalBlockShifting
                    edgeMinimization     = $HierarchicalEdgeMinimization
                    parentCentralization = $HierarchicalParentCentralization
                    direction            = $Direction[$HierarchicalDirection] # // UD, DU, LR, RL
                    sortMethod           = $HierarchicalSortMethod #// hubsize, directed
                }
            }
        }
    }
    Remove-EmptyValues -Hashtable $Object.Settings -Recursive -Rerun 2
    $Object
}

<#
// these are all options in full.
var options = {
  layout =  {
    randomSeed =  undefined,
    improvedLayout = true,
    clusterThreshold =  150,
    hierarchical =  {
      enabled = false,
      levelSeparation =  150,
      nodeSpacing =  100,
      treeSpacing =  200,
      blockShifting =  true,
      edgeMinimization =  true,
      parentCentralization =  true,
      direction =  'UD',        // UD, DU, LR, RL
      sortMethod =  'hubsize'   // hubsize, directed
    }
  }
}

network.setOptions(options);
#>