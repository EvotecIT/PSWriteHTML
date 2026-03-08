---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLHierarchicalTree
## SYNOPSIS
Creates a hierarchical tree structure in HTML using D3.js.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLHierarchicalTree [[-TreeView] <scriptblock>] [-Autosize] [<CommonParameters>]
```

## DESCRIPTION
This function generates an HTML hierarchical tree structure based on the provided tree view data using D3.js library.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLHierarchicalTree -TreeView {
    @{
        Type = 'TreeNode'
        Settings = @{
            id = 1
            parentId = 0
            name = 'Root'
            description = 'Root Node'
        }
    }
} -Autosize
# Generates a hierarchical tree with a root node.
```

## PARAMETERS

### -Autosize
Indicates whether the SVG should be sized based on the nodes or use configured height/width for the SVG.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -TreeView
Specifies the tree view data to be used for generating the hierarchical tree structure.

```yaml
Type: ScriptBlock
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

