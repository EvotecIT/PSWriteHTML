---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# EmailLayoutRow
## SYNOPSIS
Defines the layout structure for a row in an email content.

## SYNTAX
### __AllParameterSets
```powershell
EmailLayoutRow [[-RowLayout] <scriptblock>] [[-Height] <string>] [[-BorderTopStyle] <Object>] [[-BorderTopColor] <string>] [[-BorderTopWidthSize] <string>] [[-BorderBottomStyle] <Object>] [[-BorderBottomColor] <string>] [[-BorderBottomWidthSize] <string>] [[-BorderLeftStyle] <Object>] [[-BorderLeftColor] <string>] [[-BorderLeftWidthSize] <string>] [[-BorderRightStyle] <Object>] [[-BorderRightColor] <string>] [[-BorderRightWidthSize] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function defines the layout structure for a row in an email content using a ScriptBlock. It generates an HTML table row layout for the email content.

## EXAMPLES

### EXAMPLE 1
```powershell
$RowLayout = {
    'Column 1 content'
    'Column 2 content'
}
$Row = EmailLayoutRow -RowLayout $RowLayout -Height '50px' -BorderTopStyle 'solid' -BorderTopColor 'black' -BorderTopWidthSize '1px' -BorderBottomStyle 'dotted' -BorderBottomColor 'gray' -BorderBottomWidthSize '2px' -BorderLeftStyle 'dashed' -BorderLeftColor 'blue' -BorderLeftWidthSize '1px' -BorderRightStyle 'dotted' -BorderRightColor 'green' -BorderRightWidthSize '1px'
Generates an HTML table row layout with specified content and border styles.
```

## PARAMETERS

### -BorderBottomColor
Specifies the color of the bottom border.

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

### -BorderBottomStyle
Specifies the style of the bottom border. Valid values are 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, hidden, dotted, dashed, solid, double, groove, ridge, inset, outset

Required: False
Position: 5
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
Position: 7
Default value: None
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
Position: 9
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
Position: 8
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
Position: 10
Default value: None
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
Position: 12
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
Position: 11
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
Position: 13
Default value: None
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
Position: 3
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
Position: 2
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
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Height
Specifies the height of the row.

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

### -RowLayout
Specifies the ScriptBlock containing the content of the row.

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

