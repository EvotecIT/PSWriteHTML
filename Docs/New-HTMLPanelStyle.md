---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLPanelStyle
## SYNOPSIS
Creates a new HTML panel style with customizable options.

## SYNTAX
### Manual
```powershell
New-HTMLPanelStyle [-BorderRadius <string>] [-RemoveShadow] [-RequestConfiguration] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML panel style with the ability to set the border radius, remove shadow, and request configuration settings.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLPanelStyle -BorderRadius '10px' -RemoveShadow
Creates a new HTML panel style with a border radius of 10px and removes the shadow.
```

### EXAMPLE 2
```powershell
New-HTMLPanelStyle -BorderRadius '15px' -RequestConfiguration
Creates a new HTML panel style with a border radius of 15px and requests the configuration settings.
```

## PARAMETERS

### -BorderRadius
Specifies the border radius for the HTML panel. Valid values are '0px', '5px', '10px', '15px', '20px', '25px'.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 0px, 5px, 10px, 15px, 20px, 25px

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -RemoveShadow
Indicates whether to remove the shadow from the HTML panel.

```yaml
Type: SwitchParameter
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -RequestConfiguration
Specifies whether to request the configuration settings for the HTML panel.

```yaml
Type: SwitchParameter
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
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

