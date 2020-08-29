---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version:
schema: 2.0.0
---

# New-DiagramOptionsPhysics

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### BarnesHut (Default)
```
New-DiagramOptionsPhysics [-Enabled <Boolean>] [-Solver <String>] [-StabilizationEnabled <Boolean>]
 [-Stabilizationiterations <Int32>] [-StabilizationupdateInterval <Int32>]
 [-StabilizationonlyDynamicEdges <Boolean>] [-Stabilizationfit <Boolean>] [-MaxVelocity <Int32>]
 [-MinVelocity <Int32>] [-Timestep <Int32>] [-AdaptiveTimestep <Boolean>] [-BarnesHutTheta <Double>]
 [-BarnesHutGravitationalConstant <Int32>] [-BarnesHutCentralGravity <Double>] [-BarnesHutSpringLength <Int32>]
 [-BarnesHutSpringConstant <Double>] [-BarnesHutDamping <Double>] [-BarnesHutAvoidOverlap <Int32>]
 [-WindX <Int32>] [-WindY <Int32>] [<CommonParameters>]
```

### ForceAtlas2Based
```
New-DiagramOptionsPhysics [-Enabled <Boolean>] [-Solver <String>] [-StabilizationEnabled <Boolean>]
 [-Stabilizationiterations <Int32>] [-StabilizationupdateInterval <Int32>]
 [-StabilizationonlyDynamicEdges <Boolean>] [-Stabilizationfit <Boolean>] [-MaxVelocity <Int32>]
 [-MinVelocity <Int32>] [-Timestep <Int32>] [-AdaptiveTimestep <Boolean>] [-ForceAtlas2BasedTheta <Double>]
 [-ForceAtlas2BasedGravitationalConstant <Int32>] [-ForceAtlas2BasedCentralGravity <Double>]
 [-ForceAtlas2BasedSpringLength <Int32>] [-ForceAtlas2BasedSpringConstant <Double>]
 [-ForceAtlas2BasedDamping <Double>] [-ForceAtlas2BasedAvoidOverlap <Int32>] [-WindX <Int32>] [-WindY <Int32>]
 [<CommonParameters>]
```

### Repulsion
```
New-DiagramOptionsPhysics [-Enabled <Boolean>] [-Solver <String>] [-StabilizationEnabled <Boolean>]
 [-Stabilizationiterations <Int32>] [-StabilizationupdateInterval <Int32>]
 [-StabilizationonlyDynamicEdges <Boolean>] [-Stabilizationfit <Boolean>] [-MaxVelocity <Int32>]
 [-MinVelocity <Int32>] [-Timestep <Int32>] [-AdaptiveTimestep <Boolean>] [-RepulsionNodeDistance <Int32>]
 [-RepulsionCentralGravity <Double>] [-RepulsionSpringLength <Int32>] [-RepulsionSpringConstant <Double>]
 [-RepulsionDamping <Double>] [-WindX <Int32>] [-WindY <Int32>] [<CommonParameters>]
```

### HierarchicalRepulsion
```
New-DiagramOptionsPhysics [-Enabled <Boolean>] [-Solver <String>] [-StabilizationEnabled <Boolean>]
 [-Stabilizationiterations <Int32>] [-StabilizationupdateInterval <Int32>]
 [-StabilizationonlyDynamicEdges <Boolean>] [-Stabilizationfit <Boolean>] [-MaxVelocity <Int32>]
 [-MinVelocity <Int32>] [-Timestep <Int32>] [-AdaptiveTimestep <Boolean>]
 [-HierarchicalRepulsionNodeDistance <Int32>] [-HierarchicalRepulsionCentralGravity <Double>]
 [-HierarchicalRepulsionSpringLength <Int32>] [-HierarchicalRepulsionSpringConstant <Double>]
 [-HierarchicalRepulsionDamping <Double>] [-HierarchicalRepulsionAvoidOverlap <Double>] [-WindX <Int32>]
 [-WindY <Int32>] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Enabled
{{ Fill Enabled Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Solver
You can select your own solver. Possible options: 'barnesHut', 'repulsion', 'hierarchicalRepulsion', 'forceAtlas2Based'. When setting the hierarchical layout, the hierarchical repulsion solver is automatically selected, regardless of what you fill in here.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StabilizationEnabled
{{ Fill StabilizationEnabled Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Stabilizationiterations
{{ Fill Stabilizationiterations Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StabilizationupdateInterval
{{ Fill StabilizationupdateInterval Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StabilizationonlyDynamicEdges
{{ Fill StabilizationonlyDynamicEdges Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Stabilizationfit
{{ Fill Stabilizationfit Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxVelocity
{{ Fill MaxVelocity Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinVelocity
{{ Fill MinVelocity Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Timestep
{{ Fill Timestep Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AdaptiveTimestep
{{ Fill AdaptiveTimestep Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BarnesHutTheta
This parameter determines the boundary between consolidated long range forces and individual short range forces. To oversimplify higher values are faster but generate more errors, lower values are slower but with less errors.

```yaml
Type: Double
Parameter Sets: BarnesHut
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BarnesHutGravitationalConstant
Gravity attracts. We like repulsion. So the value is negative. If you want the repulsion to be stronger, decrease the value (so -10000, -50000).

```yaml
Type: Int32
Parameter Sets: BarnesHut
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BarnesHutCentralGravity
There is a central gravity attractor to pull the entire network back to the center.

```yaml
Type: Double
Parameter Sets: BarnesHut
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BarnesHutSpringLength
The edges are modelled as springs. This springLength here is the rest length of the spring.

```yaml
Type: Int32
Parameter Sets: BarnesHut
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BarnesHutSpringConstant
This is how 'sturdy' the springs are. Higher values mean stronger springs.

```yaml
Type: Double
Parameter Sets: BarnesHut
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BarnesHutDamping
Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.

```yaml
Type: Double
Parameter Sets: BarnesHut
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BarnesHutAvoidOverlap
Accepted range: [0 .. 1]. When larger than 0, the size of the node is taken into account. The distance will be calculated from the radius of the encompassing circle of the node for both the gravity model. Value 1 is maximum overlap avoidance.

```yaml
Type: Int32
Parameter Sets: BarnesHut
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForceAtlas2BasedTheta
This parameter determines the boundary between consolidated long range forces and individual short range forces. To oversimplify higher values are faster but generate more errors, lower values are slower but with less errors.

```yaml
Type: Double
Parameter Sets: ForceAtlas2Based
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForceAtlas2BasedGravitationalConstant
This is similar to the barnesHut method except that the falloff is linear instead of quadratic. The connectivity is also taken into account as a factor of the mass. If you want the repulsion to be stronger, decrease the value (so -1000, -2000).

```yaml
Type: Int32
Parameter Sets: ForceAtlas2Based
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForceAtlas2BasedCentralGravity
There is a central gravity attractor to pull the entire network back to the center. This is not dependent on distance.

```yaml
Type: Double
Parameter Sets: ForceAtlas2Based
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForceAtlas2BasedSpringLength
The edges are modelled as springs. This springLength here is the rest length of the spring.

```yaml
Type: Int32
Parameter Sets: ForceAtlas2Based
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForceAtlas2BasedSpringConstant
This is how 'sturdy' the springs are. Higher values mean stronger springs.

```yaml
Type: Double
Parameter Sets: ForceAtlas2Based
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForceAtlas2BasedDamping
Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.

```yaml
Type: Double
Parameter Sets: ForceAtlas2Based
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForceAtlas2BasedAvoidOverlap
Accepted range: [0 .. 1]. When larger than 0, the size of the node is taken into account. The distance will be calculated from the radius of the encompassing circle of the node for both the gravity model. Value 1 is maximum overlap avoidance.

```yaml
Type: Int32
Parameter Sets: ForceAtlas2Based
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RepulsionNodeDistance
This is the range of influence for the repulsion.

```yaml
Type: Int32
Parameter Sets: Repulsion
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RepulsionCentralGravity
There is a central gravity attractor to pull the entire network back to the center.

```yaml
Type: Double
Parameter Sets: Repulsion
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RepulsionSpringLength
The edges are modelled as springs. This springLength here is the rest length of the spring.

```yaml
Type: Int32
Parameter Sets: Repulsion
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RepulsionSpringConstant
This is how 'sturdy' the springs are. Higher values mean stronger springs.

```yaml
Type: Double
Parameter Sets: Repulsion
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RepulsionDamping
Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.

```yaml
Type: Double
Parameter Sets: Repulsion
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HierarchicalRepulsionNodeDistance
This is the range of influence for the repulsion. Default (Number) Default 120

```yaml
Type: Int32
Parameter Sets: HierarchicalRepulsion
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HierarchicalRepulsionCentralGravity
There is a central gravity attractor to pull the entire network back to the center. Default (Number) 0.0

```yaml
Type: Double
Parameter Sets: HierarchicalRepulsion
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HierarchicalRepulsionSpringLength
The edges are modelled as springs. This springLength here is the rest length of the spring.

```yaml
Type: Int32
Parameter Sets: HierarchicalRepulsion
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HierarchicalRepulsionSpringConstant
This is how 'sturdy' the springs are. Higher values mean stronger springs.

```yaml
Type: Double
Parameter Sets: HierarchicalRepulsion
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HierarchicalRepulsionDamping
Accepted range: [0 .. 1]. The damping factor is how much of the velocity from the previous physics simulation iteration carries over to the next iteration.

```yaml
Type: Double
Parameter Sets: HierarchicalRepulsion
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HierarchicalRepulsionAvoidOverlap
Accepted range: [0 .. 1]. When larger than 0, the size of the node is taken into account. The distance will be calculated from the radius of the encompassing circle of the node for both the gravity model. Value 1 is maximum overlap avoidance.

```yaml
Type: Double
Parameter Sets: HierarchicalRepulsion
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WindX
The amount of force to be applied pushing non-fixed nodes to the right (positive value) or to the left (negative value).

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WindY
The amount of force to be applied pushing non-fixed nodes downwards (positive value) or upwards (negative value).

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
