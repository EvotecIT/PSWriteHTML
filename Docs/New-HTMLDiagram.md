---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLDiagram
## SYNOPSIS
Creates a new HTML diagram with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLDiagram [[-Diagram] <scriptblock>] [[-Height] <Object>] [[-Width] <Object>] [[-BackGroundImage] <uri>] [[-BackgroundSize] <string>] [[-MinimumFilteringChars] <int>] [-BundleImages] [-NoAutoResize] [-DisableLoader] [-EnableFiltering] [-EnableFilteringButton] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML diagram with customizable options such as diagram data, height, width, image bundling, background image, background size, auto-resize, loading bar, filtering, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLDiagram -Diagram {
    // Diagram configuration settings here
} -Height 500 -Width 800 -BundleImages -BackGroundImage 'https://example.com/background.jpg' -BackgroundSize 'cover' -DisableLoader -EnableFiltering -MinimumFilteringChars 2 -EnableFilteringButton
```

Creates a new HTML diagram with custom configuration settings including height, width, bundled images, background image, disabled loading bar, enabled filtering, and a filtering button.

### EXAMPLE 2
```powershell
New-HTMLDiagram -Diagram {
    // More diagram configuration settings
} -Height 600 -Width 1000
```

Creates a new HTML diagram with additional configuration settings and default options for height and width.

## PARAMETERS

### -BackGroundImage
Specifies the background image for the diagram.

```yaml
Type: Uri
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BackgroundSize
Specifies the size of the background image. Default is '100% 100%'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: 100% 100%
Accept pipeline input: False
Accept wildcard characters: True
```

### -BundleImages
Indicates whether to bundle images used in the diagram.

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

### -Diagram
Specifies the diagram data to be displayed. This should be a ScriptBlock containing the diagram configuration.

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

### -DisableLoader
Indicates whether the loading bar should be disabled.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: DisableLoadingBar
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -EnableFiltering
Indicates whether filtering functionality is enabled.

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

### -EnableFilteringButton
Indicates whether a filtering button should be displayed.

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

### -Height
Specifies the height of the diagram.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -MinimumFilteringChars
Specifies the minimum number of characters required for filtering.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: 3
Accept pipeline input: False
Accept wildcard characters: True
```

### -NoAutoResize
Indicates whether auto-resize functionality is disabled.

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

### -Width
Specifies the width of the diagram.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
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

