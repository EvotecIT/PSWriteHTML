function New-DiagramOptionsPhysics {
    [alias('DiagramOptionsPhysics')]
    param(
        [bool] $Enabled = $true,
        [bool] $StabilizationEnabled = $true,
        [int] $Stabilizationiterations = 1000,
        [int] $StabilizationupdateInterval = 100,
        [bool] $StabilizationonlyDynamicEdges = $false,
        [bool] $Stabilizationfit = $true,
        [int] $MaxVelocity = 50,
        [int] $MinVelocity = 0.1,
        [int] $Timestep = 0.5,
        [bool] $AdaptiveTimestep = $true  
    )
    $Object = [PSCustomObject] @{
        Type     = 'DiagramOptionsPhysics'
        Settings = @{
            physics = [ordered] @{
                enabled          = $Enabled
                stabilization    = @{
                    enabled          = $StabilizationEnabled
                    iterations       = $Stabilizationiterations
                    updateInterval   = $StabilizationupdateInterval
                    onlyDynamicEdges = $StabilizationonlyDynamicEdges
                    fit              = $Stabilizationfit
                }
                maxVelocity      = $MaxVelocity
                minVelocity      = $MinVelocity
                timestep         = $Timestep
                adaptiveTimestep = $AdaptiveTimestep
            }
        }
    }
    Remove-EmptyValues -Hashtable $Object.Settings -Recursive 
    $Object
}

<#
// these are all options in full.
var options = {
  physics:{
    enabled: true,
    barnesHut: {
      gravitationalConstant: -2000,
      centralGravity: 0.3,
      springLength: 95,
      springConstant: 0.04,
      damping: 0.09,
      avoidOverlap: 0
    },
    forceAtlas2Based: {
      gravitationalConstant: -50,
      centralGravity: 0.01,
      springConstant: 0.08,
      springLength: 100,
      damping: 0.4,
      avoidOverlap: 0
    },
    repulsion: {
      centralGravity: 0.2,
      springLength: 200,
      springConstant: 0.05,
      nodeDistance: 100,
      damping: 0.09
    },
    hierarchicalRepulsion: {
      centralGravity: 0.0,
      springLength: 100,
      springConstant: 0.01,
      nodeDistance: 120,
      damping: 0.09
    },
    maxVelocity: 50,
    minVelocity: 0.1,
    solver: 'barnesHut',
    stabilization: {
      enabled: true,
      iterations: 1000,
      updateInterval: 100,
      onlyDynamicEdges: false,
      fit: true
    },
    timestep: 0.5,
    adaptiveTimestep: true
  }
}

network.setOptions(options);
#>