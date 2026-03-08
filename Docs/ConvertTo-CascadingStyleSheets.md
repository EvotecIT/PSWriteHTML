---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# ConvertTo-CascadingStyleSheets
## SYNOPSIS
Converts a hashtable of CSS properties into Cascading Style Sheets (CSS) format.

## SYNTAX
### __AllParameterSets
```powershell
ConvertTo-CascadingStyleSheets [[-Css] <IDictionary>] [[-Name] <string>] [[-Comment] <string>] [-WithTags] [<CommonParameters>]
```

## DESCRIPTION
The ConvertTo-CascadingStyleSheets function takes a hashtable of CSS properties and converts them into a CSS stylesheet format. It organizes the properties into selectors and declarations, ready to be used in styling HTML elements.

## EXAMPLES

### EXAMPLE 1
```powershell
$CssProperties = @{
    'color' = 'blue'
    'font-size' = '16px'
    'font-family' = 'Arial'
}
```

ConvertTo-CascadingStyleSheets -Css $CssProperties -Name '.myClass' -Comment 'Custom styles for myClass'

Converts the hashtable of CSS properties into a CSS stylesheet with the selector '.myClass' and a custom comment.

### EXAMPLE 2
```powershell
$CssProperties = @{
    'background-color' = 'lightblue'
    'border' = @{
        'style' = 'solid'
        'width' = '1px'
        'color' = 'black'
    }
}
```

ConvertTo-CascadingStyleSheets -Css $CssProperties -Name '#myDiv' -WithTags

Converts the CSS properties into a CSS stylesheet with the selector '#myDiv' and includes CSS style tags.

## PARAMETERS

### -Comment
Specifies an optional comment to be included in the CSS stylesheet.

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

### -Css
Specifies the hashtable of CSS properties to be converted.

```yaml
Type: IDictionary
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByValue, ByPropertyName)
Accept wildcard characters: True
```

### -Name
Specifies the name of the CSS selector to be used in the stylesheet.

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

### -WithTags
Indicates whether to include CSS style tags around the generated CSS content. Default is false.

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

