---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# EmailLayoutColumn
## SYNOPSIS
Defines the layout structure for a column in an email content.

## SYNTAX
### __AllParameterSets
```powershell
EmailLayoutColumn [[-ColumnLayout] <scriptblock>] [[-Width] <string>] [[-Alignment] <string>] [[-Padding] <string>] [[-PaddingTop] <string>] [[-PaddingRight] <string>] [[-PaddingBottom] <string>] [[-PaddingLeft] <string>] [[-BorderTopStyle] <Object>] [[-BorderTopColor] <string>] [[-BorderTopWidthSize] <string>] [[-BorderBottomStyle] <Object>] [[-BorderBottomColor] <string>] [[-BorderBottomWidthSize] <string>] [[-BorderLeftStyle] <Object>] [[-BorderLeftColor] <string>] [[-BorderLeftWidthSize] <string>] [[-BorderRightStyle] <Object>] [[-BorderRightColor] <string>] [[-BorderRightWidthSize] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function defines the layout structure for a column in an email content using specified parameters. It allows customization of column layout properties such as width, alignment, padding, and borders.

## EXAMPLES

### EXAMPLE 1
```powershell
EmailLayoutColumn -Alignment 'Value'
```

## PARAMETERS

### -Alignment
Specifies the alignment of the content within the column. Valid values are 'left', 'center', 'right', or 'justify'.

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

### -BorderBottomColor
Specifies the color of the bottom border.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderBottomStyle
Specifies the style of the bottom border. Valid values are 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, hidden, dotted, dashed, solid, double, groove, ridge, inset, outset

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderBottomWidthSize
Specifies the width of the bottom border.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 13
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderLeftColor
Specifies the color of the left border.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderLeftStyle
Specifies the style of the left border. Valid values are 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, hidden, dotted, dashed, solid, double, groove, ridge, inset, outset

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderLeftWidthSize
Specifies the width of the left border.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 16
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderRightColor
Specifies the color of the right border.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 18
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderRightStyle
Specifies the style of the right border. Valid values are 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, hidden, dotted, dashed, solid, double, groove, ridge, inset, outset

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderRightWidthSize
Specifies the width of the right border.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 19
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderTopColor
Specifies the color of the top border.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderTopStyle
Specifies the style of the top border. Valid values are 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, hidden, dotted, dashed, solid, double, groove, ridge, inset, outset

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderTopWidthSize
Specifies the width of the top border.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 10
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColumnLayout
Specifies the ScriptBlock containing the content of the column.

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

### -Padding
Specifies the padding for all sides of the column.

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

### -PaddingBottom
Specifies the padding for the bottom side of the column.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -PaddingLeft
Specifies the padding for the left side of the column.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -PaddingRight
Specifies the padding for the right side of the column.

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

### -PaddingTop
Specifies the padding for the top side of the column.

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

### -Width
Specifies the width of the column.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

