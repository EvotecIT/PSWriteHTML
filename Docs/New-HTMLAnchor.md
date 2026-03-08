---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLAnchor
## SYNOPSIS
Creates a new HTML anchor element.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLAnchor [[-Name] <string>] [[-Id] <string>] [[-Target] <string>] [[-Class] <string>] [[-HrefLink] <string>] [[-OnClick] <string>] [[-Style] <IDictionary>] [[-Text] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML anchor element (<a>) with specified attributes.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLAnchor -Target _parent
Creates an anchor element with the target attribute set to "_parent".
```

New-HTMLAnchor -Id "show_$RandomNumber" -Href '#' -OnClick "show('$RandomNumber');" -Style "color: #ffffff; display:none;" -Text 'Show'
Creates an anchor element with specified attributes and text.

Output:
<a id="show_$RandomNumber" class="" target="_parent" href="#" onclick="show('$RandomNumber');" style="color: #ffffff; display:none;">Show</a>

## PARAMETERS

### -Class
The CSS class of the anchor element.

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

### -HrefLink
The URL of the linked document.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: Url, Link, UrlLink, Href
Possible values: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Id
The ID of the anchor element.

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

### -Name
The name of the anchor element.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: AnchorName
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -OnClick
JavaScript code to execute when the anchor element is clicked.

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

### -Style
The CSS styles to apply to the anchor element.

```yaml
Type: IDictionary
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Target
Specifies where to open the linked document.

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

### -Text
The text to display within the anchor element.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: AnchorText, Value
Possible values: 

Required: False
Position: 7
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

