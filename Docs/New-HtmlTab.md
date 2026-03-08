---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLTab
## SYNOPSIS
Creates a new HTML tab with customizable content and icons.

## SYNTAX
### FontAwesomeBrands (Default)
```powershell
New-HTMLTab [-HtmlData <scriptblock>] [-Heading <string>] [-Name <string>] [-IconBrands <string>] [-TextSize <Object>] [-TextColor <string>] [-IconSize <Object>] [-IconColor <string>] [-TextTransform <string>] [-AnchorName <string>] [<CommonParameters>]
```

### FontAwesomeSolid
```powershell
New-HTMLTab [-HtmlData <scriptblock>] [-Heading <string>] [-Name <string>] [-IconSolid <string>] [-TextSize <Object>] [-TextColor <string>] [-IconSize <Object>] [-IconColor <string>] [-TextTransform <string>] [-AnchorName <string>] [<CommonParameters>]
```

### FontAwesomeRegular
```powershell
New-HTMLTab [-HtmlData <scriptblock>] [-Heading <string>] [-Name <string>] [-IconRegular <string>] [-TextSize <Object>] [-TextColor <string>] [-IconSize <Object>] [-IconColor <string>] [-TextTransform <string>] [-AnchorName <string>] [<CommonParameters>]
```

## DESCRIPTION
The New-HTMLTab function creates a new HTML tab with the specified content, heading, and icon. It supports different parameter sets for FontAwesomeBrands, FontAwesomeRegular, and FontAwesomeSolid icons.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLTab -HtmlData { Get-Process } -Heading "Processes" -Name "ProcessTab" -IconBrands "windows"
```

Creates a new tab displaying the list of processes with a Windows icon.

### EXAMPLE 2
```powershell
New-HTMLTab -HtmlData { Get-Service } -Heading "Services" -Name "ServiceTab" -IconRegular building
```

Creates a new tab displaying the list of services with a hard drive icon.

### EXAMPLE 3
```powershell
New-HTMLTab -HtmlData { Get-EventLog -LogName System } -Heading "System Events" -Name "EventTab" -IconSolid "exclamation-triangle"
```

Creates a new tab displaying the system events log with an exclamation triangle icon.

## PARAMETERS

### -AnchorName
New-HTMLTab - Add text-transform

```yaml
Type: String
Parameter Sets: FontAwesomeBrands, FontAwesomeSolid, FontAwesomeRegular
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Heading
The heading or title of the tab.

```yaml
Type: String
Parameter Sets: FontAwesomeBrands, FontAwesomeSolid, FontAwesomeRegular
Aliases: TabHeading
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HtmlData
The HTML content to be displayed within the tab. This should be provided as a ScriptBlock.

```yaml
Type: ScriptBlock
Parameter Sets: FontAwesomeBrands, FontAwesomeSolid, FontAwesomeRegular
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: $(Throw "No curly brace?)")
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconBrands
The icon to be displayed for FontAwesomeBrands. Use tab completion to select from available options.

```yaml
Type: String
Parameter Sets: FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconColor
{{ Fill IconColor Description }}

```yaml
Type: String
Parameter Sets: FontAwesomeBrands, FontAwesomeSolid, FontAwesomeRegular
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconRegular
The icon to be displayed for FontAwesomeRegular. Use tab completion to select from available options.

```yaml
Type: String
Parameter Sets: FontAwesomeRegular
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconSize
{{ Fill IconSize Description }}

```yaml
Type: Object
Parameter Sets: FontAwesomeBrands, FontAwesomeSolid, FontAwesomeRegular
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconSolid
The icon to be displayed for FontAwesomeSolid. Use tab completion to select from available options.

```yaml
Type: String
Parameter Sets: FontAwesomeSolid
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Name
The name of the tab.

```yaml
Type: String
Parameter Sets: FontAwesomeBrands, FontAwesomeSolid, FontAwesomeRegular
Aliases: TabName
Possible values: 

Required: False
Position: named
Default value: Tab
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextColor
{{ Fill TextColor Description }}

```yaml
Type: String
Parameter Sets: FontAwesomeBrands, FontAwesomeSolid, FontAwesomeRegular
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextSize
{{ Fill TextSize Description }}

```yaml
Type: Object
Parameter Sets: FontAwesomeBrands, FontAwesomeSolid, FontAwesomeRegular
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextTransform
{{ Fill TextTransform Description }}

```yaml
Type: String
Parameter Sets: FontAwesomeBrands, FontAwesomeSolid, FontAwesomeRegular
Aliases: 
Possible values: uppercase, lowercase, capitalize

Required: False
Position: named
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

