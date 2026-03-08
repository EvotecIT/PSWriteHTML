---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-DiagramOptionsManipulation
## SYNOPSIS
Creates a new object for manipulating diagram options in a network visualization.

## SYNTAX
### __AllParameterSets
```powershell
New-DiagramOptionsManipulation [[-InitiallyActive] <bool>] [[-AddNode] <bool>] [[-AddEdge] <bool>] [[-EditNode] <bool>] [[-EditEdge] <bool>] [[-DeleteNode] <bool>] [[-DeleteEdge] <bool>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new object that allows manipulation of diagram options in a network visualization. It provides options to control the initial state of manipulation tools and specify which manipulation actions are allowed.

## EXAMPLES

### EXAMPLE 1
```powershell
$options = New-DiagramOptionsManipulation -InitiallyActive $true -AddNode $true -AddEdge $true
Creates a new object with manipulation options where adding nodes and edges is allowed and the manipulation tools are initially active.
```

## PARAMETERS

### -AddEdge
Specifies whether the option to add edges is enabled.

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

### -AddNode
Specifies whether the option to add nodes is enabled.

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

### -DeleteEdge
Specifies whether the option to delete edges is enabled.

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

### -DeleteNode
Specifies whether the option to delete nodes is enabled.

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

### -EditEdge
Specifies whether the option to edit edges is enabled.

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

### -EditNode
Specifies whether the option to edit nodes is enabled.

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

### -InitiallyActive
Specifies whether the manipulation tools are initially active upon loading the visualization.

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

