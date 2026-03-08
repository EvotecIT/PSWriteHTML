---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLSection
## SYNOPSIS
Creates a new HTML section with customizable styling options.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLSection [[-Content] <scriptblock>] [-HeaderText <string>] [-HeaderTextColor <string>] [-HeaderTextSize <string>] [-HeaderTextAlignment <string>] [-HeaderBackGroundColor <string>] [-BackgroundColor <string>] [-CanCollapse] [-IsHidden] [-Collapsed] [-Height <Object>] [-Width <Object>] [-Invisible] [-Margin <Object>] [-Wrap <string>] [-Direction <string>] [-AlignContent <string>] [-AlignItems <string>] [-JustifyContent <string>] [-Density <string>] [-BorderRadius <string>] [-AnchorName <string>] [-StyleSheetsConfiguration <IDictionary>] [<CommonParameters>]
```

## DESCRIPTION
The New-HTMLSection function creates a new HTML section with various customizable styling options such as text alignment, background color, flexbox properties, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLSection -Content { "This is the content of the section." } -HeaderText "Section Title" -HeaderTextColor "blue" -HeaderTextSize "20px" -HeaderTextAlignment "center" -HeaderBackGroundColor "lightgray" -BackgroundColor "white" -CanCollapse -Height "200px" -Width "50%" -Wrap "wrap" -Direction "row" -AlignContent "center" -AlignItems "center" -JustifyContent "flex-start" -BorderRadius "10px" -AnchorName "section1" -StyleSheetsConfiguration @{ Section = 'customSection'; SectionText = 'customSectionText' }
```

### EXAMPLE 2
```powershell
New-HTMLSection -HeaderText "Cards with Responsive Layout" -Density Comfortable {
    New-HTMLInfoCard -Title "Card 1" -Number 100 -Icon "📊"
    New-HTMLInfoCard -Title "Card 2" -Number 200 -Icon "📈"
    # Cards will automatically wrap and maintain comfortable spacing
}
```

### EXAMPLE 3
```powershell
$content = {
    "This is a sample content."
}
New-HTMLSection -Content $content -HeaderText "Sample Section" -HeaderTextColor "red" -HeaderTextSize "18px" -HeaderTextAlignment "left" -HeaderBackGroundColor "lightblue" -BackgroundColor "lightyellow" -Height "150px" -Wrap "nowrap" -Direction "column" -AlignContent "flex-start" -AlignItems "flex-start" -JustifyContent "center" -BorderRadius "5px" -AnchorName "sampleSection" -StyleSheetsConfiguration @{ Section = 'customSection'; SectionText = 'customSectionText' }
```

## PARAMETERS

### -AlignContent
Specifies the align-content property. Valid values are 'flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: flex-start, flex-end, center, space-between, space-around, stretch

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -AlignItems
Specifies the align-items property. Valid values are 'stretch', 'flex-start', 'flex-end', 'center', 'baseline'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: stretch, flex-start, flex-end, center, baseline

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -AnchorName
Specifies the anchor name for the section.

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
Specifies the background color of the section.

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
Specifies the border radius of the section. Valid values are '0px', '5px', '10px', '15px', '20px', '25px'.

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

### -CanCollapse
Indicates whether the section can be collapsed.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: Collapsable
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -Collapsed
Indicates whether the section is collapsed.

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

### -Content
Specifies the content of the HTML section as a ScriptBlock.

```yaml
Type: ScriptBlock
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: $(throw "Open curly brace")
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

### -Direction
Specifies the flex-direction property. Valid values are 'row', 'row-reverse', 'column', 'column-reverse'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: row, row-reverse, column, column-reverse

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HeaderBackGroundColor
Specifies the background color of the header.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: TextBackGroundColor
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HeaderText
Specifies the header text of the section.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: Name, Title
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HeaderTextAlignment
Specifies the text alignment of the header. Valid values are 'center', 'left', 'right', 'justify'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: TextAlignment
Possible values: center, left, right, justify

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HeaderTextColor
Specifies the text color of the header.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: TextColor
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HeaderTextSize
Specifies the text size of the header.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: TextSize
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Height
Specifies the height of the section.

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
Indicates whether the section is invisible.

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

### -IsHidden
Indicates whether the section is initially hidden.

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

### -JustifyContent
Specifies the justify-content property. Valid values are 'flex-start', 'flex-end', 'center'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: flex-start, flex-end, center

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Margin
Specifies the margin of the section.

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

### -StyleSheetsConfiguration
Specifies the configuration for style sheets.

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
Specifies the width of the section. Default value is '100%'.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: 100%
Accept pipeline input: False
Accept wildcard characters: True
```

### -Wrap
Specifies the flex-wrap property. Valid values are 'wrap', 'nowrap', 'wrap-reverse'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: wrap, nowrap, wrap-reverse

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

