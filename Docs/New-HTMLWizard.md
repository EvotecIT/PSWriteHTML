---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLWizard
## SYNOPSIS
Provides a simple way to build wizard

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLWizard [[-WizardSteps] <scriptblock>] [[-Theme] <string>] [[-ToolbarPosition] <string>] [[-ToolbarButtonPosition] <string>] [[-TransitionAnimation] <string>] [[-TransitionSpeed] <int>] [-DisableCycleSteps] [-HideNextButton] [-HidePreviousButton] [-DiableAnchorClickable] [-EnableAllAnchors] [-DisableMarkDoneStep] [-DisableMarkAllPreviousStepsAsDone] [-RemoveDoneStepOnNavigateBack] [-DisableAnchorOnDoneStep] [-DisableJustification] [-DisableBackButtonSupport] [-DisableURLhash] [<CommonParameters>]
```

## DESCRIPTION
Provides a simple way to build wizard

## EXAMPLES

### EXAMPLE 1
```powershell
An example
```

## PARAMETERS

### -DiableAnchorClickable
Disable anchor navigation

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

### -DisableAnchorOnDoneStep
Disable the done steps navigation

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

### -DisableBackButtonSupport
Disable the back button support

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

### -DisableCycleSteps
Disables the navigation cycle through

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

### -DisableJustification
Disable navigation menu justification

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

### -DisableMarkAllPreviousStepsAsDone
Disable when a step selected by url hash, all previous steps are marked done

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

### -DisableMarkDoneStep
Disable done state on navigation

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

### -DisableURLhash
Disable selection of the tab based on url hash

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

### -EnableAllAnchors
Activates all anchors clickable all times

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

### -HideNextButton
Hide next button

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

### -HidePreviousButton
Hide previous button

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

### -RemoveDoneStepOnNavigateBack
While navigate back done step after active step will be cleared

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

### -Theme
Choose a theme to display wizard in

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: basic, arrows, square, round, dots

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ToolbarButtonPosition
Button alignment of the toolbar (left, right, center)

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: right, left, center

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ToolbarPosition
Position of the toolbar (none, top, bottom, both)

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: bottom, top, both, none

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TransitionAnimation
Effect on navigation, none/fade/slide-horizontal/slide-vertical/slide-swing

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, fade, slide-horizontal, slide-vertical, slide-swing

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TransitionSpeed
Transion animation speed. Default 400

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -WizardSteps
{{ Fill WizardSteps Description }}

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

