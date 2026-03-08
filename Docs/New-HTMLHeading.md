---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLHeading
## SYNOPSIS
Creates a new HTML heading with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLHeading [[-Heading] <string>] [[-HeadingText] <string>] [[-Color] <string>] [-Underline] [<CommonParameters>]
```

## DESCRIPTION
This function generates an HTML heading based on the provided parameters such as heading level, text content, underline option, and color.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLHeading -Heading 'h1' -HeadingText 'Main Title' -Underline -Color 'blue'
Generates an HTML heading of level h1 with the text 'Main Title', underlined, and in blue color.
```

### EXAMPLE 2
```powershell
New-HTMLHeading -Heading 'h3' -HeadingText 'Sub Title' -Color 'green'
Generates an HTML heading of level h3 with the text 'Sub Title' in green color.
```

## PARAMETERS

### -Color
The color of the heading text.

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

### -Heading
Specifies the level of the heading. Valid values are 'h1', 'h2', 'h3', 'h4', 'h5', 'h6'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: h1, h2, h3, h4, h5, h6

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HeadingText
The text content to display within the heading.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: Text
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Underline
Indicates whether the heading should be underlined.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

