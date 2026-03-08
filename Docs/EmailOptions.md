---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# EmailOptions
## SYNOPSIS
Configures email options for sending notifications.

## SYNTAX
### __AllParameterSets
```powershell
EmailOptions [[-Priority] <string>] [[-DeliveryNotifications] <Object>] [[-Encoding] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function sets the priority and delivery notifications for email notifications.

## EXAMPLES

### EXAMPLE 1
```powershell
EmailOptions -Priority 'High' -DeliveryNotifications 'OnSuccess'
Configures email options with High priority and delivery notifications on success.
```

### EXAMPLE 2
```powershell
EmailOptions
Configures email options with default settings.
```

## PARAMETERS

### -DeliveryNotifications
Specifies when delivery notifications should be sent. Valid values are 'None', 'OnSuccess', 'OnFailure', 'Delay', or 'Never'.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: None, OnSuccess, OnFailure, Delay, Never

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Encoding
{{ Fill Encoding Description }}

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

### -Priority
Specifies the priority of the email. Valid values are 'Low', 'Normal', or 'High'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: Low, Normal, High

Required: False
Position: 0
Default value: Normal
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

