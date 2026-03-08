---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLTabPanelColor
## SYNOPSIS
Creates a new HTML Tab Panel with customizable colors.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLTabPanelColor [[-BackgrounColor] <string>] [[-BorderWidth] <string>] [[-BorderStyle] <string>] [[-BorderColor] <string>] [[-AnchorDefaultPrimaryColor] <string>] [[-AnchorDefaultSecondaryColor] <string>] [[-AnchorActivePrimaryColor] <string>] [[-AnchorActiveSecondaryColor] <string>] [[-AnchorDisabledPrimaryColor] <string>] [[-AnchorDisabledSecondaryColor] <string>] [[-LoaderColor] <string>] [[-LoaderBackgroundColor] <string>] [[-LoaderBackgroundWrapperColor] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function allows you to define colors for various elements of an HTML Tab Panel, such as background color, border color, anchor colors, and loader colors.

## EXAMPLES

### EXAMPLE 1
```powershell
Set-HTMLTabPanelColor -BackgrounColor '#f0f0f0' -BorderColor '#cccccc' -AnchorDefaultPrimaryColor '#333333'
```

## PARAMETERS

### -AnchorActivePrimaryColor
The primary color of active anchor links.

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

### -AnchorActiveSecondaryColor
The secondary color of active anchor links.

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

### -AnchorDefaultPrimaryColor
The primary color of default anchor links.

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

### -AnchorDefaultSecondaryColor
The secondary color of default anchor links.

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

### -AnchorDisabledPrimaryColor
The primary color of disabled anchor links.

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

### -AnchorDisabledSecondaryColor
The secondary color of disabled anchor links.

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

### -BackgrounColor
The background color of the tab panel.

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

### -BorderColor
The color of the border. Default is '#eeeeee'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: #eeeeee
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderStyle
The style of the border. Choose from: 'solid', 'dotted', 'dashed', 'double', 'groove', 'ridge', 'inset', 'outset', 'none', 'hidden'. Default is 'solid'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: solid, dotted, dashed, double, groove, ridge, inset, outset, none, hidden

Required: False
Position: 2
Default value: solid
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderWidth
The width of the border. Default is '1px'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: 1px
Accept pipeline input: False
Accept wildcard characters: True
```

### -LoaderBackgroundColor
The background color of the loader.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -LoaderBackgroundWrapperColor
The color of the loader background wrapper.

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

### -LoaderColor
The color of the loader.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

