---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# EmailBody
## SYNOPSIS
Defines styling properties for an email body content.

## SYNTAX
### __AllParameterSets
```powershell
EmailBody [[-EmailBody] <scriptblock>] [-Color <string>] [-BackGroundColor <string>] [-LineHeight <string>] [-FontSize <Object>] [-FontWeight <string>] [-FontStyle <string>] [-FontVariant <string>] [-FontFamily <string>] [-Alignment <string>] [-TextDecoration <string>] [-TextTransform <string>] [-Direction <string>] [-Online] [-Format] [-Minify] [-Parameter <IDictionary>] [<CommonParameters>]
```

## DESCRIPTION
This function defines styling properties for an email body content such as color, background color, font size, font weight, font style, font family, alignment, text decoration, text transform, direction, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
EmailBody -Alignment 'Value'
```

## PARAMETERS

### -Alignment
Specifies the alignment of the text in the email body. Valid values are 'left', 'center', 'right', or 'justify'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: left, center, right, justify

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BackGroundColor
Specifies the background color of the email body.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Color
Specifies the color of the text in the email body.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Direction
Specifies the direction of the text in the email body. Valid value is 'rtl'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: rtl

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -EmailBody
Specifies the ScriptBlock containing the email body content.

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

### -FontFamily
Specifies the font family of the text in the email body.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontSize
{{ Fill FontSize Description }}

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: Size
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStyle
Specifies the style of the font in the email body. Valid values are 'normal', 'italic', or 'oblique'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, italic, oblique

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontVariant
Specifies the variant of the font in the email body. Valid values are 'normal' or 'small-caps'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, small-caps

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontWeight
Specifies the weight of the font in the email body. Valid values are 'normal', 'bold', 'bolder', 'lighter', or numeric values from 100 to 900.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Format
Switch parameter to format the email body content.

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

### -LineHeight
Specifies the line height of the text in the email body.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Minify
Switch parameter to minify the email body content.

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

### -Online
Switch parameter to indicate if the email body content is online.

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

### -Parameter
Specifies additional parameters for styling the email body content.

```yaml
Type: IDictionary
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextDecoration
Specifies the decoration of the text in the email body. Valid values are 'none', 'line-through', 'overline', or 'underline'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, line-through, overline, underline

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextTransform
Specifies the transformation of the text in the email body. Valid values are 'uppercase', 'lowercase', or 'capitalize'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: uppercase, lowercase, capitalize

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

