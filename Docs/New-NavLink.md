---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-NavLink
## SYNOPSIS
Creates a new navigation link with customizable options for nested links.

## SYNTAX
### FontAwesomeSolid (Default)
```powershell
New-NavLink [[-NestedLinks] <scriptblock>] -Name <string> [-NameColor <string>] [-Href <string>] [-InternalPageID <string>] [-IconColor <string>] [-IconSolid <string>] [<CommonParameters>]
```

### FontMaterial
```powershell
New-NavLink [[-NestedLinks] <scriptblock>] -Name <string> [-NameColor <string>] [-Href <string>] [-InternalPageID <string>] [-IconColor <string>] [-IconMaterial <string>] [-Spinning] [-SpinningReverse] [-Bordered] [-BorderedCircle] [-PullLeft] [-PullRight] [-Rotate <string>] [-FlipVertical] [-FlipHorizontal] [<CommonParameters>]
```

### FontAwesomeRegular
```powershell
New-NavLink [[-NestedLinks] <scriptblock>] -Name <string> [-NameColor <string>] [-Href <string>] [-InternalPageID <string>] [-IconColor <string>] [-IconRegular <string>] [<CommonParameters>]
```

### FontAwesomeBrands
```powershell
New-NavLink [[-NestedLinks] <scriptblock>] -Name <string> [-NameColor <string>] [-Href <string>] [-InternalPageID <string>] [-IconColor <string>] [-IconBrands <string>] [<CommonParameters>]
```

## DESCRIPTION
The New-NavLink function creates a new navigation link with various customizable options such as nested links, name, name color, href, internal page ID, and icon color.

## EXAMPLES

### EXAMPLE 1
```powershell
New-NavLink -NestedLinks { New-NavLink -Name "Sublink 1" -Href "/sublink1" } -Name "Main Link" -NameColor "blue" -Href "/mainlink" -InternalPageID "main" -IconColor "green"
Creates a new navigation link named "Main Link" with a nested link named "Sublink 1" in blue name color, green icon color, navigating to "/mainlink" with internal page ID "main".
```

### EXAMPLE 2
```powershell
New-NavLink -NestedLinks { New-NavLink -Name "Sublink 2" -Href "/sublink2" } -Name "Another Link" -NameColor "red" -Href "/anotherlink" -InternalPageID "another" -IconColor "yellow"
Creates a new navigation link named "Another Link" with a nested link named "Sublink 2" in red name color, yellow icon color, navigating to "/anotherlink" with internal page ID "another".
```

## PARAMETERS

### -Bordered
{{ Fill Bordered Description }}

```yaml
Type: SwitchParameter
Parameter Sets: FontMaterial
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderedCircle
{{ Fill BorderedCircle Description }}

```yaml
Type: SwitchParameter
Parameter Sets: FontMaterial
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -FlipHorizontal
{{ Fill FlipHorizontal Description }}

```yaml
Type: SwitchParameter
Parameter Sets: FontMaterial
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -FlipVertical
{{ Fill FlipVertical Description }}

```yaml
Type: SwitchParameter
Parameter Sets: FontMaterial
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -Href
Specifies the URL to navigate to when the navigation link is clicked.

```yaml
Type: String
Parameter Sets: FontAwesomeSolid, FontMaterial, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconBrands
ICON BRANDS

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
Specifies the color of the icon for the navigation link.

```yaml
Type: String
Parameter Sets: FontAwesomeSolid, FontMaterial, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconMaterial
FontsMaterialIcon

```yaml
Type: String
Parameter Sets: FontMaterial
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconRegular
ICON REGULAR

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

### -IconSolid
ICON SOLID

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

### -InternalPageID
Specifies the internal page ID associated with the navigation link.

```yaml
Type: String
Parameter Sets: FontAwesomeSolid, FontMaterial, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Name
Specifies the name of the navigation link. This parameter is mandatory.

```yaml
Type: String
Parameter Sets: FontAwesomeSolid, FontMaterial, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: True
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -NameColor
Specifies the color of the navigation link name.

```yaml
Type: String
Parameter Sets: FontAwesomeSolid, FontMaterial, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -NestedLinks
Specifies the script block defining the nested link properties.

```yaml
Type: ScriptBlock
Parameter Sets: FontAwesomeSolid, FontMaterial, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -PullLeft
{{ Fill PullLeft Description }}

```yaml
Type: SwitchParameter
Parameter Sets: FontMaterial
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -PullRight
{{ Fill PullRight Description }}

```yaml
Type: SwitchParameter
Parameter Sets: FontMaterial
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -Rotate
{{ Fill Rotate Description }}

```yaml
Type: String
Parameter Sets: FontMaterial
Aliases: 
Possible values: 90, 180, 270

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Spinning
{{ Fill Spinning Description }}

```yaml
Type: SwitchParameter
Parameter Sets: FontMaterial
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -SpinningReverse
{{ Fill SpinningReverse Description }}

```yaml
Type: SwitchParameter
Parameter Sets: FontMaterial
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

