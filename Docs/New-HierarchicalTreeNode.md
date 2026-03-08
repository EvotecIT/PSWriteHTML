---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HierarchicalTreeNode
## SYNOPSIS
Creates a new hierarchical tree node object.

## SYNTAX
### __AllParameterSets
```powershell
New-HierarchicalTreeNode [[-ID] <string>] [[-Label] <string>] [[-Type] <string>] [[-Description] <string>] [[-To] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new hierarchical tree node object with specified properties.

## EXAMPLES

### EXAMPLE 1
```powershell
$node = New-HierarchicalTreeNode -ID "1" -Label "Node 1" -Description "This is node 1" -To "0"
Creates a new hierarchical tree node with ID "1", label "Node 1", description "This is node 1", and connected to parent node with ID "0".
```

### EXAMPLE 2
```powershell
$node = New-HierarchicalTreeNode -ID "2" -Label "Node 2" -Type "Animal" -Description "This is node 2" -To "1"
Creates a new hierarchical tree node with ID "2", label "Node 2", type "Animal", description "This is node 2", and connected to parent node with ID "1".
```

## PARAMETERS

### -Description
The description of the node.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ID
The unique identifier for the node.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Label
The label or name of the node.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: Name
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -To
The parent node ID to which this node is connected.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Type
The type of the node. Default value is "Organism".

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: Organism
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

