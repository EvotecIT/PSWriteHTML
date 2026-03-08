---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# Add-HTMLScript
## SYNOPSIS
Adds JavaScript content to the HTML body.

## SYNTAX
### __AllParameterSets
```powershell
Add-HTMLScript [[-Placement] <string>] [[-Resource] <IDictionary>] [[-ResourceComment] <string>] [[-Link] <string[]>] [[-Content] <string[]>] [[-FilePath] <string[]>] [[-ReplaceData] <IDictionary>] [-AddComments] [-SkipTags] [<CommonParameters>]
```

## DESCRIPTION
This function adds JavaScript content to the HTML body by including JavaScript code from files, strings, or links. It allows customization of the placement of JavaScript content within the HTML document.

## EXAMPLES

### EXAMPLE 1
```powershell
Add-HTMLScript -Placement 'Header' -Resource 'MyScript' -ResourceComment 'Script for functionality X' -Link 'https://example.com/script.js'
Adds an external JavaScript file 'script.js' to the header of the HTML document with a specified comment.
```

### EXAMPLE 2
```powershell
Add-HTMLScript -Placement 'Footer' -Resource 'CustomScript' -ResourceComment 'Custom script for feature Y' -Content 'function myFunction() { // code here }'
Adds custom JavaScript content to the footer of the HTML document with a specified comment.
```

### EXAMPLE 3
```powershell
Add-HTMLScript -Placement 'Inline' -Resource 'InlineScript' -ResourceComment 'Inline script for page Z' -FilePath 'C:\Scripts\inline.js' -ReplaceData @{ 'placeholder' = 'replacement' }
Adds JavaScript code from a file 'inline.js' to be included inline in the HTML document with specified replacements.
```

## PARAMETERS

### -AddComments
Indicates whether to add comments around the JavaScript content. By default, comments are not added.

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

### -Content
Specifies an array of JavaScript content as strings to be included.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FilePath
Specifies an array of file paths containing JavaScript code to be included.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Link
Specifies an array of URLs to external JavaScript files to be included.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Placement
Specifies where the JavaScript content should be placed in the HTML document. Valid values are 'Inline', 'Header', or 'Footer'. Default is 'Header'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: Inline, Header, Footer

Required: False
Position: 0
Default value: Header
Accept pipeline input: False
Accept wildcard characters: True
```

### -ReplaceData
Specifies a dictionary of key-value pairs to replace in the JavaScript code.

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

### -Resource
Specifies the resource containing the JavaScript content.

```yaml
Type: IDictionary
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ResourceComment
Specifies a comment to be included with the JavaScript content.

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

### -SkipTags
Indicates whether to skip adding script tags around the JavaScript content. By default, script tags are added.

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

