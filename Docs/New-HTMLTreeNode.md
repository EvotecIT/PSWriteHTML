---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLTreeNode
## SYNOPSIS
Creates a new HTML tree node with specified properties.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLTreeNode [[-Children] <scriptblock>] [[-Title] <string>] [[-Id] <string>] [[-Tooltip] <string>] [[-Icon] <string>] [[-IconTooltip] <string>] [[-Checkbox] <string>] [[-HrefLink] <string>] [[-Target] <string>] [-Folder] [-IsSelected] [-IsExpanded] [-Unselectable] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML tree node with the specified properties. It allows for customization of various attributes such as title, ID, folder structure, tooltip, icon, selection status, expansion status, etc.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLTreeNode -Title "Folder 1" -Id "folder1" -Folder -Children {
    New-HTMLTreeNode -Title "Item 1" -Id "item1"
    New-HTMLTreeNode -Title "Item 2" -Id "item2"
}
```

### EXAMPLE 2
```powershell
New-HTMLTreeNode -Title "Document" -Id "doc1" -HrefLink "https://example.com" -Target "_blank"
```

## PARAMETERS

### -Checkbox
Specifies the type of checkbox for the tree node. Valid values are 'none', 'checkbox', or 'radio'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, checkbox, radio

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Children
Specifies the script block that defines the children nodes of the tree node.

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

### -Folder
Indicates whether the tree node represents a folder.

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

### -HrefLink
Specifies the URL link for the tree node.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: Url, Link, UrlLink, Href
Possible values: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Icon
Specifies the icon for the tree node.

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

### -IconTooltip
Specifies the tooltip text for the icon.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Id
Specifies the unique identifier of the tree node.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IsExpanded
Indicates whether the tree node is expanded.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: Expanded
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -IsSelected
Indicates whether the tree node is selected.

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

### -Target
Specifies the target window for the URL link. Valid values are "_blank", "_self", "_parent", "_top", or a frame name.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Title
Specifies the title of the tree node.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Tooltip
Specifies the tooltip text for the tree node.

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

### -Unselectable
Indicates whether the tree node is unselectable.

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

