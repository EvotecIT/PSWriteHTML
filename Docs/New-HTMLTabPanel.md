---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLTabPanel
## SYNOPSIS
Flexible and easy to implement Tab Panel with a lot of features, cool animation effects, event support, easy to customize.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLTabPanel [[-Tabs] <scriptblock>] [[-Orientation] <string>] [[-TransitionAnimation] <string>] [[-TransitionSpeed] <int>] [[-AutoProgressInterval] <int>] [[-Theme] <Object>] [-DisableJustification] [-DisableBackButtonSupport] [-DisableURLhash] [-AutoProgress] [-DisableAutoProgressStopOnFocus] [<CommonParameters>]
```

## DESCRIPTION
Flexible and easy to implement Tab Panel with a lot of features, cool animation effects, event support, easy to customize.

## EXAMPLES

### EXAMPLE 1
```powershell
An example
```

## PARAMETERS

### -AutoProgress
Enables auto navigation

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

### -AutoProgressInterval
Auto navigate Interval (used only if "autoProgress" is enabled). Default 3500

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -DisableAutoProgressStopOnFocus
Disable stop auto navigation on focus and resume on outfocus (used only if "autoProgress" is enabled)

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

### -Orientation
Nav menu orientation. Default value is 'horizontal'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: horizontal, vertical

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Tabs
{{ Fill Tabs Description }}

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

### -Theme
{{ Fill Theme Description }}

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: basic, elite, pills, brick, forge, blocks

Required: False
Position: 5
Default value: basic
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
Position: 2
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
Position: 3
Default value: 0
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

