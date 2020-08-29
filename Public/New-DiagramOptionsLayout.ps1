function New-DiagramOptionsLayout {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    When enabling the hierarchical layout, it overrules some of the other options.
    The physics is set to the hierarchical repulsion solver and dynamic smooth edges are converted to static smooth edges.

    .PARAMETER RandomSeed
    When NOT using the hierarchical layout, the nodes are randomly positioned initially. This means that the settled result is different every time. If you provide a random seed manually, the layout will be the same every time. Ideally you try with an undefined seed, reload until you are happy with the layout and use the getSeed() method to ascertain the seed.

    .PARAMETER ImprovedLayout
    When enabled, the network will use the Kamada Kawai algorithm for initial layout. For networks larger than 100 nodes, clustering will be performed automatically to reduce the amount of nodes. This can greatly improve the stabilization times. If the network is very interconnected (no or few leaf nodes), this may not work and it will revert back to the old method. Performance will be improved in the future.

    .PARAMETER ClusterThreshold
    Cluster threshold to which improvedLayout applies.

    .PARAMETER HierarchicalEnabled
    When true, the layout engine positions the nodes in a hierarchical fashion using default settings.
    Toggle the usage of the hierarchical layout system. If this option is not defined, it is set to true if any of the properties in this object are defined.

    .PARAMETER HierarchicalLevelSeparation
    The distance between the different levels.

    .PARAMETER HierarchicalNodeSpacing
    Minimum distance between nodes on the free axis. This is only for the initial layout. If you enable physics, the node distance there will be the effective node distance.

    .PARAMETER HierarchicalTreeSpacing
    Distance between different trees (independent networks). This is only for the initial layout. If you enable physics, the repulsion model will denote the distance between the trees.

    .PARAMETER HierarchicalBlockShifting
    Method for reducing whitespace. Can be used alone or together with edge minimization. Each node will check for whitespace and will shift it's branch along with it for as far as it can, respecting the nodeSpacing on any level. This is mainly for the initial layout. If you enable physics, the layout will be determined by the physics. This will greatly speed up the stabilization time though!

    .PARAMETER HierarchicalEdgeMinimization
    Method for reducing whitespace. Can be used alone or together with block shifting. Enabling block shifting will usually speed up the layout process. Each node will try to move along its free axis to reduce the total length of it's edges. This is mainly for the initial layout. If you enable physics, the layout will be determined by the physics. This will greatly speed up the stabilization time though!

    .PARAMETER HierarchicalParentCentralization
    When true, the parents nodes will be centered again after the layout algorithm has been finished.

    .PARAMETER HierarchicalDirection
    The direction of the hierarchical layout. The available options are: UD, DU, LR, RL. To simplify: up-down, down-up, left-right, right-left.

    .PARAMETER HierarchicalSortMethod
    The algorithm used to ascertain the levels of the nodes based on the data. The possible options are: hubsize, directed.
    Hubsize takes the nodes with the most edges and puts them at the top. From that the rest of the hierarchy is evaluated.
    Directed adheres to the to and from data of the edges. A --> B so B is a level lower than A.

    .PARAMETER HierarchicalShakeTowards
    Controls whether in directed layout should all the roots be lined up at the top and their child nodes as close to their roots as possible (roots) or all the leaves lined up at the bottom and their parents as close to their children as possible (leaves, default).

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
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
        [ValidateSet('hubsize', 'directed')][string] $HierarchicalSortMethod,
        [ValidateSet('roots', 'leaves')][string] $HierarchicalShakeTowards
    )
    $Direction = @{
        FromUpToDown    = 'UD'
        FromDownToUp    = 'DU'
        FromLeftToRight = 'LR'
        FromRigthToLeft = 'RL'
    }

    $Object = [PSCustomObject] @{
        Type     = 'DiagramOptionsLayout'
        Settings = [ordered] @{
            layout = [ordered] @{
                randomSeed       = $RandomSeed
                improvedLayout   = $ImprovedLayout
                clusterThreshold = $ClusterThreshold
                hierarchical     = [ordered]@{
                    enabled              = $HierarchicalEnabled
                    levelSeparation      = $HierarchicalLevelSeparation
                    nodeSpacing          = $HierarchicalNodeSpacing
                    treeSpacing          = $HierarchicalTreeSpacing
                    blockShifting        = $HierarchicalBlockShifting
                    edgeMinimization     = $HierarchicalEdgeMinimization
                    parentCentralization = $HierarchicalParentCentralization
                    direction            = $Direction[$HierarchicalDirection] # // UD, DU, LR, RL
                    sortMethod           = $HierarchicalSortMethod #// hubsize, directed
                    shakeTowards         = $HierarchicalShakeTowards
                }
            }
        }
    }
    Remove-EmptyValue -Hashtable $Object.Settings -Recursive -Rerun 2
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