---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLPage
## SYNOPSIS
Creates a new HTML page with specified content, name, title, file path, and ID.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLPage [[-PageContent] <scriptblock>] [-Name] <string> [[-Title] <string>] [[-FilePath] <string>] [[-ID] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML page with the provided content and metadata. It generates a unique GUID for the page and stores it in the global schema. The function returns a custom object representing the page.

## EXAMPLES

### EXAMPLE 1
```powershell
<body><h1>Hello, World!</h1></body></html>" } -Name "index" -Title "Welcome Page" -FilePath "C:\Pages\index.html" -ID "12345"
```

Creates a new HTML page with a simple "Hello, World!" content, named "index", titled "Welcome Page", saved at "C:\Pages\index.html", and with ID "12345".

## PARAMETERS

### -FilePath
The file path where the HTML page will be saved.

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

### -ID
The ID of the HTML page.

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

### -Name
The name of the HTML page.

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

### -PageContent
The script block containing the HTML content of the page.

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

### -Title
The title of the HTML page.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

