---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLWizardStep
## SYNOPSIS
Creates a new HTML wizard step with customizable options.

## SYNTAX
### FontAwesomeBrands (Default)
```powershell
New-HTMLWizardStep [-HtmlData <scriptblock>] [-Heading <string>] [-Name <string>] [-IconBrands <string>] [-TextSize <Object>] [-TextColor <string>] [-IconSize <Object>] [-IconColor <string>] [-TextTransform <string>] [-AnchorName <string>] [<CommonParameters>]
```

### FontAwesomeSolid
```powershell
New-HTMLWizardStep [-HtmlData <scriptblock>] [-Heading <string>] [-Name <string>] [-IconSolid <string>] [-TextSize <Object>] [-TextColor <string>] [-IconSize <Object>] [-IconColor <string>] [-TextTransform <string>] [-AnchorName <string>] [<CommonParameters>]
```

### FontAwesomeRegular
```powershell
New-HTMLWizardStep [-HtmlData <scriptblock>] [-Heading <string>] [-Name <string>] [-IconRegular <string>] [-TextSize <Object>] [-TextColor <string>] [-IconSize <Object>] [-IconColor <string>] [-TextTransform <string>] [-AnchorName <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML wizard step with various customization options such as setting the HTML data, tab heading, tab name, and icons.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLWizardStep -HtmlData { Get-Content -Path "C:\example.html" } -Heading "Step 1" -Name "First Tab" -IconBrands "fa fa-facebook"
```

Creates a new HTML wizard step with the specified HTML data, tab heading, tab name, and FontAwesome Brands icon.

### EXAMPLE 2
```powershell
New-HTMLWizardStep -HtmlData { Get-Content -Path "C:\another.html" } -Heading "Step 2" -Name "Second Tab" -IconRegular "fa fa-github"
```

Creates a new HTML wizard step with the specified HTML data, tab heading, tab name, and FontAwesome Regular icon.

## PARAMETERS

### -AnchorName
{{ Fill AnchorName Description }}

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
Specifies the heading text for the tab.

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
Specifies the HTML data to be displayed in the wizard step.

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
Specifies the icon for the tab from the FontAwesome Brands collection.

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
Specifies the icon for the tab from the FontAwesome Regular collection.

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
Specifies the icon for the tab from the FontAwesome Solid collection.

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
Specifies the name of the tab.

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

