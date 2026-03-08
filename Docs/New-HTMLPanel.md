---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLPanel
## SYNOPSIS
Creates a new HTML panel with customizable styling options.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLPanel [[-Content] <scriptblock>] [-BackgroundColor <string>] [-Invisible] [-Width <string>] [-Height <Object>] [-Margin <string>] [-AlignContentText <string>] [-BorderRadius <string>] [-Density <string>] [-AnchorName <string>] [-StyleSheetsConfiguration <IDictionary>] [<CommonParameters>]
```

## DESCRIPTION
The New-HTMLPanel function creates a new HTML panel with various styling options such as background color, width, margin, alignment, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLPanel -Content { "This is the content of the panel" } -BackgroundColor "lightblue" -Width "50%" -Margin "10px" -AlignContentText "center" -BorderRadius "5px" -AnchorName "myPanel" -StyleSheetsConfiguration @{ Panel = "customPanel" }
```

Creates a new HTML panel with specified content, background color, width, margin, alignment, border radius, anchor name, and custom style sheet configuration.

## PARAMETERS

### -AlignContentText
Specifies the alignment of the content within the panel.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: center, left, right, justify

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -AnchorName
Specifies the anchor name of the panel.

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

### -BackgroundColor
Specifies the background color of the HTML panel.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: BackgroundShade
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderRadius
Specifies the border radius of the panel.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 0px, 5px, 10px, 15px, 20px, 25px

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Content
Specifies the content of the HTML panel as a ScriptBlock.

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

### -Density
Specifies the density of the panel. This will automatically enable responsive wrapping for the panel.
The options are: Spacious, Comfortable, Compact, Dense, VeryDense.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: Spacious, Comfortable, Compact, Dense, VeryDense

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Height
{{ Fill Height Description }}

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Invisible
Indicates whether the panel should be invisible.

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

### -Margin
Specifies the margin of the panel.

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

### -StyleSheetsConfiguration
Specifies the style sheets configuration for the panel.

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

### -Width
Specifies the width of the panel.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: flex-basis
Possible values: 

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

