function New-DiagramOptionsLayout {
    [alias('DiagramOptionsLayout')]
    param(
        [nullable[int]] $RandomSeed,
        [bool] $ImprovedLayout = $true,
        [int] $ClusterThreshold = 150,
        [bool] $HierarchicalEnabled = $false,
        [int] $HierarchicalLevelSeparation = 150,
        [int] $HierarchicalNodeSpacing = 100,
        [int] $HierarchicalTreeSpacing = 200,
        [bool] $HierarchicalBlockShifting = $true,
        [bool] $HierarchicalEdgeMinimization = $true,
        [bool] $HierarchicalParentCentralization = $true,
        [ValidateSet('UD', 'DU', 'LR', 'RL')] $HierarchicalDirection = 'UD',
        [ValidateSet('hubsize', 'directed')] $HierarchicalSortMethod = 'hubsize'
    )
    $Object = [PSCustomObject] @{
        Type     = 'DiagramOptionsLayout'
        Settings = @{
            layout = [ordered] @{
                randomSeed = $RandomSeed
                improvedLayout = $ImprovedLayout
                clusterThreshold =  $ClusterThreshold
                hierarchical    = @{
                    enabled    = $HierarchicalEnabled
                    levelSeparation =  $HierarchicalLevelSeparation
                    nodeSpacing =  $HierarchicalNodeSpacing
                    treeSpacing =  $HierarchicalTreeSpacing
                    blockShifting =  $HierarchicalBlockShifting
                    edgeMinimization =  $HierarchicalEdgeMinimization
                    parentCentralization =  $HierarchicalParentCentralization
                    direction =  $HierarchicalDirection # // UD, DU, LR, RL
                    sortMethod = $HierarchicalSortMethod #// hubsize, directed
                }
            }
        }
    }
    Remove-EmptyValues -Hashtable $Object.Settings -Recursive 
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