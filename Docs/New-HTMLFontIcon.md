---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLFontIcon
## SYNOPSIS
Creates an HTML font icon with specified parameters.

## SYNTAX
### FontAwesomeSolid (Default)
```powershell
New-HTMLFontIcon [-IconSize <int>] [-IconColor <string>] [-IconSolid <string>] [-FixedWidth] [-AsCSS] [-AsHashTable] [-Name <string>] [<CommonParameters>]
```

### FontMaterial
```powershell
New-HTMLFontIcon [-IconSize <int>] [-IconColor <string>] [-IconMaterial <string>] [-Spinning] [-SpinningReverse] [-Bordered] [-BorderedCircle] [-PullLeft] [-PullRight] [-Rotate <string>] [-FlipVertical] [-FlipHorizontal] [-ListIcons] [-FixedWidth] [-AsCSS] [-AsHashTable] [-Name <string>] [<CommonParameters>]
```

### FontAwesomeRegular
```powershell
New-HTMLFontIcon [-IconSize <int>] [-IconColor <string>] [-IconRegular <string>] [-FixedWidth] [-AsCSS] [-AsHashTable] [-Name <string>] [<CommonParameters>]
```

### FontAwesomeBrands
```powershell
New-HTMLFontIcon [-IconSize <int>] [-IconColor <string>] [-IconBrands <string>] [-FixedWidth] [-AsCSS] [-AsHashTable] [-Name <string>] [<CommonParameters>]
```

## DESCRIPTION
This function generates an HTML font icon based on the provided parameters such as icon size, color, and specific icon set (e.g., FontAwesomeBrands, FontAwesomeRegular, FontAwesomeSolid, FontMaterial).

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLFontIcon -IconSize 24 -IconColor "red" -IconBrands "fa-github"
Generates an HTML font icon with a size of 24, red color, and the GitHub icon from the FontAwesomeBrands set.
```

### EXAMPLE 2
```powershell
New-HTMLFontIcon -IconSize 32 -IconColor "blue" -IconRegular "fa-envelope"
Generates an HTML font icon with a size of 32, blue color, and the envelope icon from the FontAwesomeRegular set.
```

## PARAMETERS

### -AsCSS
{{ Fill AsCSS Description }}

```yaml
Type: SwitchParameter
Parameter Sets: FontAwesomeSolid, FontMaterial, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -AsHashTable
{{ Fill AsHashTable Description }}

```yaml
Type: SwitchParameter
Parameter Sets: FontAwesomeSolid, FontMaterial, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

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

### -FixedWidth
{{ Fill FixedWidth Description }}

```yaml
Type: SwitchParameter
Parameter Sets: FontAwesomeSolid, FontMaterial, FontAwesomeRegular, FontAwesomeBrands
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

### -IconBrands
Specifies the icon from the FontAwesomeBrands set.

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
Specifies the color of the icon.

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
Specifies the icon from the FontAwesomeRegular set.

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
Specifies the size of the icon.

```yaml
Type: Int32
Parameter Sets: FontAwesomeSolid, FontMaterial, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconSolid
Specifies the icon from the FontAwesomeSolid set.

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

### -ListIcons
for using within UL/LI http://zavoloklom.github.io/material-design-iconic-font/examples.html

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

### -Name
{{ Fill Name Description }}

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
[parameter(ParameterSetName = "FontMaterial")][switch] $Wobble,
[parameter(ParameterSetName = "FontMaterial")][switch] $FadeInLeft,
[parameter(ParameterSetName = "FontMaterial")][switch] $Pulse,

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

