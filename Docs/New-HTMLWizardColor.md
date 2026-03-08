---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLWizardColor
## SYNOPSIS
Creates a new HTML Wizard Color configuration.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLWizardColor [[-BorderColor] <string>] [[-ToolbarBtnColor] <string>] [[-ToolbarBtnBackgroundColor] <string>] [[-AnchorDefaultPrimaryColor] <string>] [[-AnchorDefaultSecondaryColor] <string>] [[-AnchorActivePrimaryColor] <string>] [[-AnchorActiveSecondaryColor] <string>] [[-AnchorDonePrimaryColor] <string>] [[-AnchorDoneSecondaryColor] <string>] [[-AnchorDisabledPrimaryColor] <string>] [[-AnchorDisabledSecondaryColor] <string>] [[-AnchorErrorPrimaryColor] <string>] [[-AnchorErrorSecondaryColor] <string>] [[-AnchorWarningPrimaryColor] <string>] [[-AnchorWarningSecondaryColor] <string>] [[-ProgressColor] <string>] [[-ProgressBackgroundColor] <string>] [[-LoaderColor] <string>] [[-LoaderBackgroundColor] <string>] [[-LoaderBackgroundWrapperColor] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML Wizard Color configuration with customizable color settings for various elements in the wizard interface.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLWizardColor -BorderColor "#FF0000" -ToolbarBtnColor "#00FF00" -ToolbarBtnBackgroundColor "#0000FF"
Creates a new HTML Wizard Color configuration with specified border, toolbar button text, and toolbar button background colors.
```

## PARAMETERS

### -AnchorActivePrimaryColor
Specifies the primary color for active anchor elements.

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

### -AnchorActiveSecondaryColor
Specifies the secondary color for active anchor elements.

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

### -AnchorDefaultPrimaryColor
Specifies the primary color for default anchor elements.

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

### -AnchorDefaultSecondaryColor
Specifies the secondary color for default anchor elements.

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

### -AnchorDisabledPrimaryColor
Specifies the primary color for disabled anchor elements.

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

### -AnchorDisabledSecondaryColor
Specifies the secondary color for disabled anchor elements.

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

### -AnchorDonePrimaryColor
Specifies the primary color for completed anchor elements.

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

### -AnchorDoneSecondaryColor
Specifies the secondary color for completed anchor elements.

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

### -AnchorErrorPrimaryColor
Specifies the primary color for anchor elements in error state.

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

### -AnchorErrorSecondaryColor
Specifies the secondary color for anchor elements in error state.

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

### -AnchorWarningPrimaryColor
Specifies the primary color for anchor elements in warning state.

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

### -AnchorWarningSecondaryColor
Specifies the secondary color for anchor elements in warning state.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderColor
Specifies the color for the border of the wizard interface.

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

### -LoaderBackgroundColor
Specifies the background color for the loader animation.

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

### -LoaderBackgroundWrapperColor
Specifies the background color for the loader animation wrapper.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 19
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -LoaderColor
Specifies the color for the loader animation.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ProgressBackgroundColor
Specifies the background color for the progress indicator.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ProgressColor
Specifies the color for the progress indicator.

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

### -ToolbarBtnBackgroundColor
Specifies the background color for the toolbar buttons.

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

### -ToolbarBtnColor
Specifies the color for the toolbar button text.

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

