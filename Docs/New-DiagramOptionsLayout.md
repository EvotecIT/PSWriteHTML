---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-DiagramOptionsLayout
## SYNOPSIS
Defines layout options for hierarchical diagrams.

## SYNTAX
### __AllParameterSets
```powershell
New-DiagramOptionsLayout [[-RandomSeed] <int>] [[-ImprovedLayout] <bool>] [[-ClusterThreshold] <int>] [[-HierarchicalEnabled] <bool>] [[-HierarchicalLevelSeparation] <int>] [[-HierarchicalNodeSpacing] <int>] [[-HierarchicalTreeSpacing] <int>] [[-HierarchicalBlockShifting] <bool>] [[-HierarchicalEdgeMinimization] <bool>] [[-HierarchicalParentCentralization] <bool>] [[-HierarchicalDirection] <string>] [[-HierarchicalSortMethod] <string>] [[-HierarchicalShakeTowards] <string>] [<CommonParameters>]
```

## DESCRIPTION
When enabling the hierarchical layout, it overrules some of the other options.
The physics is set to the hierarchical repulsion solver and dynamic smooth edges are converted to static smooth edges.

## EXAMPLES

### EXAMPLE 1
```powershell
An example
```

## PARAMETERS

### -ClusterThreshold
Cluster threshold to which improvedLayout applies.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HierarchicalBlockShifting
Method for reducing whitespace. Can be used alone or together with edge minimization. Each node will check for whitespace and will shift it's branch along with it for as far as it can, respecting the nodeSpacing on any level. This is mainly for the initial layout. If you enable physics, the layout will be determined by the physics. This will greatly speed up the stabilization time though!

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HierarchicalDirection
The direction of the hierarchical layout. The available options are: UD, DU, LR, RL. To simplify: up-down, down-up, left-right, right-left.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: FromUpToDown, FromDownToUp, FromLeftToRight, FromRigthToLeft

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HierarchicalEdgeMinimization
Method for reducing whitespace. Can be used alone or together with block shifting. Enabling block shifting will usually speed up the layout process. Each node will try to move along its free axis to reduce the total length of it's edges. This is mainly for the initial layout. If you enable physics, the layout will be determined by the physics. This will greatly speed up the stabilization time though!

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HierarchicalEnabled
When true, the layout engine positions the nodes in a hierarchical fashion using default settings.
Toggle the usage of the hierarchical layout system. If this option is not defined, it is set to true if any of the properties in this object are defined.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HierarchicalLevelSeparation
The distance between the different levels.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HierarchicalNodeSpacing
Minimum distance between nodes on the free axis. This is only for the initial layout. If you enable physics, the node distance there will be the effective node distance.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HierarchicalParentCentralization
When true, the parents nodes will be centered again after the layout algorithm has been finished.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HierarchicalShakeTowards
Controls whether in directed layout should all the roots be lined up at the top and their child nodes as close to their roots as possible (roots) or all the leaves lined up at the bottom and their parents as close to their children as possible (leaves, default).

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: roots, leaves

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HierarchicalSortMethod
The algorithm used to ascertain the levels of the nodes based on the data. The possible options are: hubsize, directed.
Hubsize takes the nodes with the most edges and puts them at the top. From that the rest of the hierarchy is evaluated.
Directed adheres to the to and from data of the edges. A --> B so B is a level lower than A.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: hubsize, directed

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HierarchicalTreeSpacing
Distance between different trees (independent networks). This is only for the initial layout. If you enable physics, the repulsion model will denote the distance between the trees.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ImprovedLayout
When enabled, the network will use the Kamada Kawai algorithm for initial layout. For networks larger than 100 nodes, clustering will be performed automatically to reduce the amount of nodes. This can greatly improve the stabilization times. If the network is very interconnected (no or few leaf nodes), this may not work and it will revert back to the old method. Performance will be improved in the future.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -RandomSeed
When NOT using the hierarchical layout, the nodes are randomly positioned initially. This means that the settled result is different every time. If you provide a random seed manually, the layout will be the same every time. Ideally you try with an undefined seed, reload until you are happy with the layout and use the getSeed() method to ascertain the seed.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
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

