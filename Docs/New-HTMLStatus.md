---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLStatus
## SYNOPSIS
Creates a new HTML status section with customizable content.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLStatus [[-Content] <scriptblock>] [<CommonParameters>]
```

## DESCRIPTION
The New-HTMLStatus function creates an HTML status section with customizable content. It allows you to display status information with flexibility.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLStatus -Content {
    "Status: OK"
}
Creates a new HTML status section displaying "Status: OK".
```

### EXAMPLE 2
```powershell
$content = {
    "Status: Error"
}
New-HTMLStatus -Content $content
Creates a new HTML status section displaying "Status: Error".
```

## PARAMETERS

### -Content
Specifies the content to be displayed within the status section as a ScriptBlock.

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

