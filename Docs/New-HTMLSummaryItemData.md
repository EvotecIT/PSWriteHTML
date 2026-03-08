---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLSummaryItemData
## SYNOPSIS
Creates a new HTML summary item data with specified text and information.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLSummaryItemData [[-Icon] <string>] [-Text] <string> [-Information] <string> [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML summary item data with the provided text and information. It formats the output using New-HTMLText cmdlet.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLSummaryItemData -Text "Total Sales" -Information "$1000"
Creates a new HTML summary item with the text "Total Sales" and information "$1000".
```

### EXAMPLE 2
```powershell
New-HTMLSummaryItemData -Text "Total Orders" -Information "50" -Icon "order.png"
Creates a new HTML summary item with the text "Total Orders", information "50", and icon "order.png".
```

## PARAMETERS

### -Icon
Specifies the icon for the summary item.

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

### -Information
Specifies the information to be displayed in the summary item. This parameter is mandatory.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: Value
Possible values: 

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Text
Specifies the text to be displayed in the summary item. This parameter is mandatory.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: True
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

