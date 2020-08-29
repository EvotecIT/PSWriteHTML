function New-DiagramOptionsPhysics {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER Enabled
    Toggle the physics system on or off. This property is optional. If you define any of the options below and enabled is undefined, this will be set to true.

    .PARAMETER Solver
    You can select your own solver. Possible options: 'barnesHut', 'repulsion', 'hierarchicalRepulsion', 'forceAtlas2Based'. When setting the hierarchical layout, the hierarchical repulsion solver is automatically selected, regardless of what you fill in here.

    .PARAMETER StabilizationEnabled
    Toggle the stabilization. This is an optional property. If undefined, it is automatically set to true when any of the properties of this object are defined.

    .PARAMETER Stabilizationiterations
    The physics module tries to stabilize the network on load up til a maximum number of iterations defined here. If the network stabilized with less, you are finished before the maximum number.

    .PARAMETER StabilizationupdateInterval
    When stabilizing, the DOM can freeze. You can chop the stabilization up into pieces to show a loading bar for instance. The interval determines after how many iterations the stabilizationProgress event is triggered.

    .PARAMETER StabilizationonlyDynamicEdges
    If you have predefined the position of all nodes and only want to stabilize the dynamic smooth edges, set this to true. It freezes all nodes except the invisible dynamic smooth curve support nodes. If you want the visible nodes to move and stabilize, do not use this.

    .PARAMETER Stabilizationfit
    Toggle whether or not you want the view to zoom to fit all nodes when the stabilization is finished.

    .PARAMETER MaxVelocity
    The physics module limits the maximum velocity of the nodes to increase the time to stabilization. This is the maximum value.

    .PARAMETER MinVelocity
    Once the minimum velocity is reached for all nodes, we assume the network has been stabilized and the simulation stops.

    .PARAMETER Timestep
    The physics simulation is discrete. This means we take a step in time, calculate the forces, move the nodes and take another step. If you increase this number the steps will be too large and the network can get unstable. If you see a lot of jittery movement in the network, you may want to reduce this value a little.

    .PARAMETER AdaptiveTimestep
    If this is enabled, the timestep will intelligently be adapted (only during the stabilization stage if stabilization is enabled!) to greatly decrease stabilization times. The timestep configured above is taken as the minimum timestep. This can be further improved by using the improvedLayout algorithm.
    Layout: https://visjs.github.io/vis-network/docs/network/layout.html#layout

    .PARAMETER BarnesHutTheta
    This parameter determines the boundary between consolidated long range forces and individual short range forces. To oversimplify higher values are faster but generate more errors, lower values are slower but with less errors.

    .PARAMETER BarnesHutGravitationalConstant
    Gravity attracts. We like repulsion. So the value is negative. If you want the repulsion to be stronger, decrease the value (so -10000, -50000).

    .PARAMETER BarnesHutCentralGravity
    There is a central gravity attractor to pull the entire network back to the center.

    .PARAMETER BarnesHutSpringLength
    The edges are modelled as springs. This springLength here is the rest length of the spring.

    .PARAMETER BarnesHutSpringConstant
    This is how 'sturdy' the springs are. Higher values mean stronger springs.

    .PARAMETER BarnesHutDamping
    Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.

    .PARAMETER BarnesHutAvoidOverlap
    Accepted range: [0 .. 1]. When larger than 0, the size of the node is taken into account. The distance will be calculated from the radius of the encompassing circle of the node for both the gravity model. Value 1 is maximum overlap avoidance.

    .PARAMETER ForceAtlas2BasedTheta
    This parameter determines the boundary between consolidated long range forces and individual short range forces. To oversimplify higher values are faster but generate more errors, lower values are slower but with less errors.

    .PARAMETER ForceAtlas2BasedGravitationalConstant
    This is similar to the barnesHut method except that the falloff is linear instead of quadratic. The connectivity is also taken into account as a factor of the mass. If you want the repulsion to be stronger, decrease the value (so -1000, -2000).

    .PARAMETER ForceAtlas2BasedCentralGravity
    There is a central gravity attractor to pull the entire network back to the center. This is not dependent on distance.

    .PARAMETER ForceAtlas2BasedSpringLength
    The edges are modelled as springs. This springLength here is the rest length of the spring.

    .PARAMETER ForceAtlas2BasedSpringConstant
    This is how 'sturdy' the springs are. Higher values mean stronger springs.

    .PARAMETER ForceAtlas2BasedDamping
    Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.

    .PARAMETER ForceAtlas2BasedAvoidOverlap
    	Accepted range: [0 .. 1]. When larger than 0, the size of the node is taken into account. The distance will be calculated from the radius of the encompassing circle of the node for both the gravity model. Value 1 is maximum overlap avoidance.

    .PARAMETER RepulsionNodeDistance
    This is the range of influence for the repulsion.

    .PARAMETER RepulsionCentralGravity
    There is a central gravity attractor to pull the entire network back to the center.

    .PARAMETER RepulsionSpringLength
    The edges are modelled as springs. This springLength here is the rest length of the spring.

    .PARAMETER RepulsionSpringConstant
    This is how 'sturdy' the springs are. Higher values mean stronger springs.

    .PARAMETER RepulsionDamping
    Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.

    .PARAMETER HierarchicalRepulsionNodeDistance
    This is the range of influence for the repulsion. Default (Number) Default 120

    .PARAMETER HierarchicalRepulsionCentralGravity
    There is a central gravity attractor to pull the entire network back to the center. Default (Number) 0.0

    .PARAMETER HierarchicalRepulsionSpringLength
    The edges are modelled as springs. This springLength here is the rest length of the spring.

    .PARAMETER HierarchicalRepulsionSpringConstant
    This is how 'sturdy' the springs are. Higher values mean stronger springs.

    .PARAMETER HierarchicalRepulsionDamping
    Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.

    .PARAMETER HierarchicalRepulsionAvoidOverlap
    Accepted range: [0 .. 1]. When larger than 0, the size of the node is taken into account. The distance will be calculated from the radius of the encompassing circle of the node for both the gravity model. Value 1 is maximum overlap avoidance.

    .PARAMETER WindX
    The amount of force to be applied pushing non-fixed nodes to the right (positive value) or to the left (negative value).

    .PARAMETER WindY
    The amount of force to be applied pushing non-fixed nodes downwards (positive value) or upwards (negative value).

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [alias('DiagramOptionsPhysics')]
    [CmdletBinding(DefaultParameterSetName = 'BarnesHut')]
    param(
        [nullable[bool]] $Enabled,
        [validateSet('barnesHut', 'repulsion', 'hierarchicalRepulsion', 'forceAtlas2Based')][string] $Solver,

        [nullable[bool]] $StabilizationEnabled,
        [nullable[int]] $Stabilizationiterations,
        [nullable[int]] $StabilizationupdateInterval,
        [nullable[bool]] $StabilizationonlyDynamicEdges,
        [nullable[bool]] $Stabilizationfit,

        [nullable[int]] $MaxVelocity,
        [nullable[int]] $MinVelocity,
        [nullable[int]] $Timestep,
        [nullable[bool]] $AdaptiveTimestep,
        [Parameter(ParameterSetName = 'BarnesHut')][nullable[double]]$BarnesHutTheta,
        [Parameter(ParameterSetName = 'BarnesHut')][nullable[int]] $BarnesHutGravitationalConstant,
        [Parameter(ParameterSetName = 'BarnesHut')][nullable[double]] $BarnesHutCentralGravity,
        [Parameter(ParameterSetName = 'BarnesHut')][nullable[int]] $BarnesHutSpringLength,
        [Parameter(ParameterSetName = 'BarnesHut')][nullable[double]]$BarnesHutSpringConstant,
        [Parameter(ParameterSetName = 'BarnesHut')][nullable[double]] $BarnesHutDamping,
        [Parameter(ParameterSetName = 'BarnesHut')][nullable[int]] $BarnesHutAvoidOverlap,
        # Force2Atlas https://visjs.github.io/vis-network/docs/network/physics.html
        [Parameter(ParameterSetName = 'ForceAtlas2Based')][nullable[double]]$ForceAtlas2BasedTheta,
        [Parameter(ParameterSetName = 'ForceAtlas2Based')][nullable[int]] $ForceAtlas2BasedGravitationalConstant,
        [Parameter(ParameterSetName = 'ForceAtlas2Based')][nullable[double]] $ForceAtlas2BasedCentralGravity,
        [Parameter(ParameterSetName = 'ForceAtlas2Based')][nullable[int]] $ForceAtlas2BasedSpringLength,
        [Parameter(ParameterSetName = 'ForceAtlas2Based')][nullable[double]]$ForceAtlas2BasedSpringConstant,
        [Parameter(ParameterSetName = 'ForceAtlas2Based')][nullable[double]] $ForceAtlas2BasedDamping,
        [Parameter(ParameterSetName = 'ForceAtlas2Based')][nullable[int]] $ForceAtlas2BasedAvoidOverlap,
        # Repulsion https://visjs.github.io/vis-network/docs/network/physics.html
        [Parameter(ParameterSetName = 'Repulsion')][nullable[int]] $RepulsionNodeDistance,
        [Parameter(ParameterSetName = 'Repulsion')][nullable[double]]$RepulsionCentralGravity,
        [Parameter(ParameterSetName = 'Repulsion')][nullable[int]] $RepulsionSpringLength  ,
        [Parameter(ParameterSetName = 'Repulsion')][nullable[double]] $RepulsionSpringConstant,
        [Parameter(ParameterSetName = 'Repulsion')][nullable[double]] $RepulsionDamping,
        # Hierarchical Repulsion https://visjs.github.io/vis-network/docs/network/physics.html
        [Parameter(ParameterSetName = 'HierarchicalRepulsion')][nullable[int]] $HierarchicalRepulsionNodeDistance,
        [Parameter(ParameterSetName = 'HierarchicalRepulsion')][nullable[double]]$HierarchicalRepulsionCentralGravity,
        [Parameter(ParameterSetName = 'HierarchicalRepulsion')][nullable[int]] $HierarchicalRepulsionSpringLength  ,
        [Parameter(ParameterSetName = 'HierarchicalRepulsion')][nullable[double]] $HierarchicalRepulsionSpringConstant,
        [Parameter(ParameterSetName = 'HierarchicalRepulsion')][nullable[double]] $HierarchicalRepulsionDamping,
        [Parameter(ParameterSetName = 'HierarchicalRepulsion')][nullable[double]] $HierarchicalRepulsionAvoidOverlap,
        [nullable[int]] $WindX,
        [nullable[int]] $WindY
    )

    if (-not $Solver) {
        if ($PSCmdlet.ParameterSetName -eq 'Repulsion') {
            $Solver = 'repulsion'
        } elseif ($PSCmdlet.ParameterSetName -eq 'HierarchicalRepulsion') {
            $Solver = 'hierarchicalRepulsion'
        } elseif ($PSCmdlet.ParameterSetName -eq 'ForceAtlas2Based') {
            $Solver = 'forceAtlas2Based'
        } elseif ($PSCmdlet.ParameterSetName -eq 'BarnesHut') {
            $Solver = 'barnesHut'
        }
    }

    $Object = [PSCustomObject] @{
        Type     = 'DiagramOptionsPhysics'
        Settings = [ordered] @{
            physics = [ordered] @{
                enabled               = $Enabled
                solver                = $Solver
                barnesHut             = [ordered] @{
                    theta                 = $BarnesHutTheta
                    gravitationalConstant = $BarnesHutGravitationalConstant
                    centralGravity        = $BarnesHutCentralGravity
                    springLength          = $BarnesHutSpringLength
                    springConstant        = $BarnesHutSpringConstant
                    damping               = $BarnesHutDamping
                    avoidOverlap          = $BarnesHutAvoidOverlap
                }
                forceAtlas2Based      = [ordered] @{
                    theta                 = $ForceAtlas2BasedTheta	                # Number	0.5	This parameter determines the boundary between consolidated long range forces and individual short range forces. To oversimplify higher values are faster but generate more errors, lower values are slower but with less errors.
                    gravitationalConstant = $ForceAtlas2BasedGravitationalConstant	# Number	-50	This is similar to the barnesHut method except that the falloff is linear instead of quadratic. The connectivity is also taken into account as a factor of the mass. If you want the repulsion to be stronger, decrease the value (so -1000, -2000).
                    centralGravity        = $ForceAtlas2BasedCentralGravity	        # Number	0.01	There is a central gravity attractor to pull the entire network back to the center. This is not dependent on distance.
                    springLength          = $ForceAtlas2BasedSpringLength	        # Number	100	The edges are modelled as springs. This springLength here is the rest length of the spring.
                    springConstant        = $ForceAtlas2BasedSpringConstant	        # Number	0.08	This is how 'sturdy' the springs are. Higher values mean stronger springs.
                    damping               = $ForceAtlas2BasedDamping	            # Number	0.4	Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.
                    avoidOverlap          = $ForceAtlas2BasedAvoidOverlap	        # Number	0	Accepted range: [0 .. 1]. When larger than 0, the size of the node is taken into account. The distance will be calculated from the radius of the encompassing circle of the node for both the gravity model. Value 1 is maximum overlap avoidance.
                }
                repulsion             = [ordered] @{
                    nodeDistance   = $RepulsionNodeDistance	#Number	120	This is the range of influence for the repulsion.
                    centralGravity = $RepulsionCentralGravity	#Number	0.0'	There is a central gravity attractor to pull the entire network back to the center.
                    springLength   = $RepulsionSpringLength   #	Number	100	The edges are modelled as springs. This springLength here is the rest length of the spring.
                    springConstant = $RepulsionSpringConstant	#Number	0.01	This is how 'sturdy' the springs are. Higher values mean stronger springs.
                    damping        = $RepulsionDamping      #Number	0.09	Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.
                }
                hierarchicalRepulsion = [ordered] @{
                    nodeDistance   = $HierarchicalRepulsionNodeDistance	#Number	120	This is the range of influence for the repulsion.
                    centralGravity = $HierarchicalRepulsionCentralGravity	#Number	0.0'	There is a central gravity attractor to pull the entire network back to the center.
                    springLength   = $HierarchicalRepulsionSpringLength   #	Number	100	The edges are modelled as springs. This springLength here is the rest length of the spring.
                    springConstant = $HierarchicalRepulsionSpringConstant	#Number	0.01	This is how 'sturdy' the springs are. Higher values mean stronger springs.
                    damping        = $HierarchicalRepulsionDamping      #Number	0.09	Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.
                    avoidOverlap   = $HierarchicalRepulsionAvoidOverlap  #	Number	0	Accepted range: [0 .. 1]. When larger than 0, the size of the node is taken into account. The distance will be calculated from the radius of the encompassing circle of the node for both the gravity model. Value 1 is maximum overlap avoidance.
                }
                stabilization         = [ordered] @{
                    enabled          = $StabilizationEnabled
                    iterations       = $Stabilizationiterations
                    updateInterval   = $StabilizationupdateInterval
                    onlyDynamicEdges = $StabilizationonlyDynamicEdges
                    fit              = $Stabilizationfit
                }
                maxVelocity           = $MaxVelocity
                minVelocity           = $MinVelocity
                timestep              = $Timestep
                adaptiveTimestep      = $AdaptiveTimestep
                wind                  = [ordered] @{
                    x = $WindX
                    y = $WindY
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