---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLTree
## SYNOPSIS
Creates a new HTML tree using FancyTree with various customization options.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLTree [[-Data] <scriptblock>] [[-Checkbox] <string>] [[-SelectMode] <Object>] [[-MinimumExpandLevel] <int>] [-DisableIcons] [-DisableControl] [-DisableKeyboardNavigation] [-AutoCollapseSibling] [-AutoScroll] [-EnableQuickSearch] [-EnableChildCounter] [-WideSelection] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML tree using FancyTree with the ability to customize the tree's appearance and behavior. It supports features like checkboxes, radio buttons, selection modes, icons, keyboard navigation, quick search, child counters, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLTree -Data {
    TreeNode -Node "Root" -Children {
        TreeNode -Node "Child 1"
        TreeNode -Node "Child 2"
    }
} -Checkbox 'checkbox' -SelectMode '3' -EnableChildCounter -WideSelection
```

Creates a new HTML tree with checkboxes, hierarchical selection mode, child counters, and wide selection enabled.

## PARAMETERS

### -AutoCollapseSibling
Automatically collapses sibling nodes when a node is expanded.

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

### -AutoScroll
Enables auto-scrolling when navigating the tree.

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

### -Checkbox
Specifies the type of checkboxes to be displayed in the tree. Valid values are 'none', 'checkbox', or 'radio'. Default is 'none'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, checkbox, radio

Required: False
Position: 1
Default value: none
Accept pipeline input: False
Accept wildcard characters: True
```

### -Data
The script block that contains the data to populate the tree.

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

### -DisableControl
Disables control features in the tree if this switch is present.

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

### -DisableIcons
Disables icons in the tree if this switch is present.

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

### -DisableKeyboardNavigation
Disables keyboard navigation in the tree if this switch is present.

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

### -EnableChildCounter
Enables child counter display in the tree.

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

### -EnableQuickSearch
Enables quick search functionality in the tree.

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

### -MinimumExpandLevel
Specifies the minimum level of nodes to expand in the tree.

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

### -SelectMode
Specifies the selection mode for the tree. Valid values are 'none', '1', '2', or '3'. Default is '2'.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, 1, 2, 3

Required: False
Position: 2
Default value: 2
Accept pipeline input: False
Accept wildcard characters: True
```

### -WideSelection
Enables wide selection mode in the tree.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

