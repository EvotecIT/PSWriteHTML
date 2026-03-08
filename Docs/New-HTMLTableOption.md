---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLTableOption
## SYNOPSIS
Configures New-HTMLTable options

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLTableOption [[-DataStore] <string>] [[-DateTimeFormat] <string>] [[-NewLineCarriage] <string>] [[-NewLine] <string>] [[-Carriage] <string>] [[-ArrayJoinString] <string>] [[-PrettifyObjectSeparator] <string>] [[-PrettifyObjectDateTimeFormat] <string>] [-BoolAsString] [-NumberAsString] [-ArrayJoin] [-PrettifyObject] [<CommonParameters>]
```

## DESCRIPTION
Configures New-HTMLTable options

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTML {
    New-HTMLTableOption -DateTimeFormat "yyyy-MM-dd HH:mm:ss" -BoolAsString
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects' {
            New-HTMLTable -DataTable $DataTable1
        }
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects' {
            New-HTMLTable -DataTable $DataTable1 -DataStore JavaScript
        }
    }
} -ShowHTML
```

## PARAMETERS

### -ArrayJoin
When JavaScript or AjaxJSON is used, forces any array to be a string regardless of depth level

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

### -ArrayJoinString
Uses defined string or char for array join. By default it uses comma with a space when used.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: ,
Accept pipeline input: False
Accept wildcard characters: True
```

### -BoolAsString
When JavaScript or AjaxJSON is used, forces bool to string

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

### -Carriage
When JavaScript or AjaxJSON is used, one can configure Carriage. Default value for Carriage = "\r"

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

### -DataStore
Choose how Data is stored for all tables HTML, JavaScript or AjaxJSON (external file)

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: HTML, JavaScript, AjaxJSON

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DateTimeFormat
When JavaScript or AjaxJSON is used, one can configure DateTimeFormat (in PowerShell way)

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

### -NewLine
When JavaScript or AjaxJSON is used, one can configure NewLine. Default value for NewLine = "\n"

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

### -NewLineCarriage
When JavaScript or AjaxJSON is used, one can configure NewLineCarriage. Default NewLineCarriage = '<br>'

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

### -NumberAsString
When JavaScript or AjaxJSON is used, forces number to string

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

### -PrettifyObject
{{ Fill PrettifyObject Description }}

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

### -PrettifyObjectDateTimeFormat
{{ Fill PrettifyObjectDateTimeFormat Description }}

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

### -PrettifyObjectSeparator
{{ Fill PrettifyObjectSeparator Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: ,
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

