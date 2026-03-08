---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-DiagramOptionsPhysics
## SYNOPSIS
Configures the physics settings for a network visualization.

## SYNTAX
### BarnesHut (Default)
```powershell
New-DiagramOptionsPhysics [-Enabled <bool>] [-Solver <string>] [-StabilizationEnabled <bool>] [-Stabilizationiterations <int>] [-StabilizationupdateInterval <int>] [-StabilizationonlyDynamicEdges <bool>] [-Stabilizationfit <bool>] [-MaxVelocity <int>] [-MinVelocity <int>] [-Timestep <int>] [-AdaptiveTimestep <bool>] [-BarnesHutTheta <double>] [-BarnesHutGravitationalConstant <int>] [-BarnesHutCentralGravity <double>] [-BarnesHutSpringLength <int>] [-BarnesHutSpringConstant <double>] [-BarnesHutDamping <double>] [-BarnesHutAvoidOverlap <int>] [-WindX <int>] [-WindY <int>] [<CommonParameters>]
```

### ForceAtlas2Based
```powershell
New-DiagramOptionsPhysics [-Enabled <bool>] [-Solver <string>] [-StabilizationEnabled <bool>] [-Stabilizationiterations <int>] [-StabilizationupdateInterval <int>] [-StabilizationonlyDynamicEdges <bool>] [-Stabilizationfit <bool>] [-MaxVelocity <int>] [-MinVelocity <int>] [-Timestep <int>] [-AdaptiveTimestep <bool>] [-ForceAtlas2BasedTheta <double>] [-ForceAtlas2BasedGravitationalConstant <int>] [-ForceAtlas2BasedCentralGravity <double>] [-ForceAtlas2BasedSpringLength <int>] [-ForceAtlas2BasedSpringConstant <double>] [-ForceAtlas2BasedDamping <double>] [-ForceAtlas2BasedAvoidOverlap <int>] [-WindX <int>] [-WindY <int>] [<CommonParameters>]
```

### Repulsion
```powershell
New-DiagramOptionsPhysics [-Enabled <bool>] [-Solver <string>] [-StabilizationEnabled <bool>] [-Stabilizationiterations <int>] [-StabilizationupdateInterval <int>] [-StabilizationonlyDynamicEdges <bool>] [-Stabilizationfit <bool>] [-MaxVelocity <int>] [-MinVelocity <int>] [-Timestep <int>] [-AdaptiveTimestep <bool>] [-RepulsionNodeDistance <int>] [-RepulsionCentralGravity <double>] [-RepulsionSpringLength <int>] [-RepulsionSpringConstant <double>] [-RepulsionDamping <double>] [-WindX <int>] [-WindY <int>] [<CommonParameters>]
```

### HierarchicalRepulsion
```powershell
New-DiagramOptionsPhysics [-Enabled <bool>] [-Solver <string>] [-StabilizationEnabled <bool>] [-Stabilizationiterations <int>] [-StabilizationupdateInterval <int>] [-StabilizationonlyDynamicEdges <bool>] [-Stabilizationfit <bool>] [-MaxVelocity <int>] [-MinVelocity <int>] [-Timestep <int>] [-AdaptiveTimestep <bool>] [-HierarchicalRepulsionNodeDistance <int>] [-HierarchicalRepulsionCentralGravity <double>] [-HierarchicalRepulsionSpringLength <int>] [-HierarchicalRepulsionSpringConstant <double>] [-HierarchicalRepulsionDamping <double>] [-HierarchicalRepulsionAvoidOverlap <double>] [-WindX <int>] [-WindY <int>] [<CommonParameters>]
```

## DESCRIPTION
Configures the physics settings for a network visualization in a detailed manner, allowing customization of stabilization, velocity limits, timestep, and other parameters to optimize the behavior of the physics simulation.

## EXAMPLES

### EXAMPLE 1
```powershell
An example
```

## PARAMETERS

### -AdaptiveTimestep
If this is enabled, the timestep will intelligently be adapted (only during the stabilization stage if stabilization is enabled!) to greatly decrease stabilization times. The timestep configured above is taken as the minimum timestep. This can be further improved by using the improvedLayout algorithm.
Layout: https://visjs.github.io/vis-network/docs/network/layout.html#layout

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut, ForceAtlas2Based, Repulsion, HierarchicalRepulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BarnesHutAvoidOverlap
Accepted range: [0 .. 1]. When larger than 0, the size of the node is taken into account. The distance will be calculated from the radius of the encompassing circle of the node for both the gravity model. Value 1 is maximum overlap avoidance.

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BarnesHutCentralGravity
There is a central gravity attractor to pull the entire network back to the center.

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BarnesHutDamping
Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BarnesHutGravitationalConstant
Gravity attracts. We like repulsion. So the value is negative. If you want the repulsion to be stronger, decrease the value (so -10000, -50000).

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BarnesHutSpringConstant
This is how 'sturdy' the springs are. Higher values mean stronger springs.

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BarnesHutSpringLength
The edges are modelled as springs. This springLength here is the rest length of the spring.

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BarnesHutTheta
This parameter determines the boundary between consolidated long range forces and individual short range forces. To oversimplify higher values are faster but generate more errors, lower values are slower but with less errors.

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Enabled
Toggle the physics system on or off. This property is optional. If you define any of the options below and enabled is undefined, this will be set to true.

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut, ForceAtlas2Based, Repulsion, HierarchicalRepulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ForceAtlas2BasedAvoidOverlap
Accepted range: [0 .. 1]. When larger than 0, the size of the node is taken into account. The distance will be calculated from the radius of the encompassing circle of the node for both the gravity model. Value 1 is maximum overlap avoidance.

```yaml
Type: Nullable`1
Parameter Sets: ForceAtlas2Based
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ForceAtlas2BasedCentralGravity
There is a central gravity attractor to pull the entire network back to the center. This is not dependent on distance.

```yaml
Type: Nullable`1
Parameter Sets: ForceAtlas2Based
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ForceAtlas2BasedDamping
Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.

```yaml
Type: Nullable`1
Parameter Sets: ForceAtlas2Based
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ForceAtlas2BasedGravitationalConstant
This is similar to the barnesHut method except that the falloff is linear instead of quadratic. The connectivity is also taken into account as a factor of the mass. If you want the repulsion to be stronger, decrease the value (so -1000, -2000).

```yaml
Type: Nullable`1
Parameter Sets: ForceAtlas2Based
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ForceAtlas2BasedSpringConstant
This is how 'sturdy' the springs are. Higher values mean stronger springs.

```yaml
Type: Nullable`1
Parameter Sets: ForceAtlas2Based
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ForceAtlas2BasedSpringLength
The edges are modelled as springs. This springLength here is the rest length of the spring.

```yaml
Type: Nullable`1
Parameter Sets: ForceAtlas2Based
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ForceAtlas2BasedTheta
This parameter determines the boundary between consolidated long range forces and individual short range forces. To oversimplify higher values are faster but generate more errors, lower values are slower but with less errors.

```yaml
Type: Nullable`1
Parameter Sets: ForceAtlas2Based
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HierarchicalRepulsionAvoidOverlap
Accepted range: [0 .. 1]. When larger than 0, the size of the node is taken into account. The distance will be calculated from the radius of the encompassing circle of the node for both the gravity model. Value 1 is maximum overlap avoidance.

```yaml
Type: Nullable`1
Parameter Sets: HierarchicalRepulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HierarchicalRepulsionCentralGravity
There is a central gravity attractor to pull the entire network back to the center. Default (Number) 0.0

```yaml
Type: Nullable`1
Parameter Sets: HierarchicalRepulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HierarchicalRepulsionDamping
Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.

```yaml
Type: Nullable`1
Parameter Sets: HierarchicalRepulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HierarchicalRepulsionNodeDistance
This is the range of influence for the repulsion. Default (Number) Default 120

```yaml
Type: Nullable`1
Parameter Sets: HierarchicalRepulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HierarchicalRepulsionSpringConstant
This is how 'sturdy' the springs are. Higher values mean stronger springs.

```yaml
Type: Nullable`1
Parameter Sets: HierarchicalRepulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HierarchicalRepulsionSpringLength
The edges are modelled as springs. This springLength here is the rest length of the spring.

```yaml
Type: Nullable`1
Parameter Sets: HierarchicalRepulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -MaxVelocity
The physics module limits the maximum velocity of the nodes to increase the time to stabilization. This is the maximum value.

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut, ForceAtlas2Based, Repulsion, HierarchicalRepulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -MinVelocity
Once the minimum velocity is reached for all nodes, we assume the network has been stabilized and the simulation stops.

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut, ForceAtlas2Based, Repulsion, HierarchicalRepulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -RepulsionCentralGravity
There is a central gravity attractor to pull the entire network back to the center.

```yaml
Type: Nullable`1
Parameter Sets: Repulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -RepulsionDamping
Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.

```yaml
Type: Nullable`1
Parameter Sets: Repulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -RepulsionNodeDistance
This is the range of influence for the repulsion.

```yaml
Type: Nullable`1
Parameter Sets: Repulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -RepulsionSpringConstant
This is how 'sturdy' the springs are. Higher values mean stronger springs.

```yaml
Type: Nullable`1
Parameter Sets: Repulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -RepulsionSpringLength
The edges are modelled as springs. This springLength here is the rest length of the spring.

```yaml
Type: Nullable`1
Parameter Sets: Repulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Solver
You can select your own solver. Possible options: 'barnesHut', 'repulsion', 'hierarchicalRepulsion', 'forceAtlas2Based'. When setting the hierarchical layout, the hierarchical repulsion solver is automatically selected, regardless of what you fill in here.

```yaml
Type: String
Parameter Sets: BarnesHut, ForceAtlas2Based, Repulsion, HierarchicalRepulsion
Aliases: 
Possible values: barnesHut, repulsion, hierarchicalRepulsion, forceAtlas2Based

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -StabilizationEnabled
Toggle the stabilization. This is an optional property. If undefined, it is automatically set to true when any of the properties of this object are defined.

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut, ForceAtlas2Based, Repulsion, HierarchicalRepulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Stabilizationfit
Toggle whether or not you want the view to zoom to fit all nodes when the stabilization is finished.

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut, ForceAtlas2Based, Repulsion, HierarchicalRepulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Stabilizationiterations
The physics module tries to stabilize the network on load up til a maximum number of iterations defined here. If the network stabilized with less, you are finished before the maximum number.

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut, ForceAtlas2Based, Repulsion, HierarchicalRepulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -StabilizationonlyDynamicEdges
If you have predefined the position of all nodes and only want to stabilize the dynamic smooth edges, set this to true. It freezes all nodes except the invisible dynamic smooth curve support nodes. If you want the visible nodes to move and stabilize, do not use this.

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut, ForceAtlas2Based, Repulsion, HierarchicalRepulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -StabilizationupdateInterval
When stabilizing, the DOM can freeze. You can chop the stabilization up into pieces to show a loading bar for instance. The interval determines after how many iterations the stabilizationProgress event is triggered.

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut, ForceAtlas2Based, Repulsion, HierarchicalRepulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Timestep
The physics simulation is discrete. This means we take a step in time, calculate the forces, move the nodes and take another step. If you increase this number the steps will be too large and the network can get unstable. If you see a lot of jittery movement in the network, you may want to reduce this value a little.

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut, ForceAtlas2Based, Repulsion, HierarchicalRepulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -WindX
The amount of force to be applied pushing non-fixed nodes to the right (positive value) or to the left (negative value).

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut, ForceAtlas2Based, Repulsion, HierarchicalRepulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -WindY
The amount of force to be applied pushing non-fixed nodes downwards (positive value) or upwards (negative value).

```yaml
Type: Nullable`1
Parameter Sets: BarnesHut, ForceAtlas2Based, Repulsion, HierarchicalRepulsion
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

