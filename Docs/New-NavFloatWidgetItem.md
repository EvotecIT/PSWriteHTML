---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-NavFloatWidgetItem
## SYNOPSIS
Creates a new navigation float item with specified parameters.

## SYNTAX
### FontAwesomeSolid (Default)
```powershell
New-NavFloatWidgetItem -Name <string> [-Href <string>] [-InternalPageID <string>] [-LinkHome] [-IconColor <string>] [-IconSolid <string>] [<CommonParameters>]
```

### FontMaterial
```powershell
New-NavFloatWidgetItem -Name <string> [-Href <string>] [-InternalPageID <string>] [-LinkHome] [-IconColor <string>] [-IconMaterial <string>] [-Spinning] [-SpinningReverse] [-Bordered] [-BorderedCircle] [-PullLeft] [-PullRight] [-Rotate <string>] [-FlipVertical] [-FlipHorizontal] [<CommonParameters>]
```

### FontAwesomeRegular
```powershell
New-NavFloatWidgetItem -Name <string> [-Href <string>] [-InternalPageID <string>] [-LinkHome] [-IconColor <string>] [-IconRegular <string>] [<CommonParameters>]
```

### FontAwesomeBrands
```powershell
New-NavFloatWidgetItem -Name <string> [-Href <string>] [-InternalPageID <string>] [-LinkHome] [-IconColor <string>] [-IconBrands <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new navigation float item with the provided parameters. It allows customization of the item's name, link, icon, color, and other properties.

## EXAMPLES

### EXAMPLE 1
```powershell
New-NavFloatWidgetItem -Name "Home" -Href "https://www.example.com" -IconBrands "fab fa-home" -IconColor "blue"
```

Creates a new navigation float item named "Home" that links to "https://www.example.com" with a blue home icon.

### EXAMPLE 2
```powershell
New-NavFloatWidgetItem -Name "About" -InternalPageID "about" -LinkHome
```

Creates a new navigation float item named "About" that links to the internal page with ID "about" and links to the home page.

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
Specifies the URL link for the navigation float item.

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
Specifies the icon brand for the navigation float item. Valid values are: $($Global:HTMLIcons.FontAwesomeBrands.Keys).

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
Specifies the color of the icon for the navigation float item.

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
Specifies the regular icon for the navigation float item. Valid values are: $($Global:HTMLIcons.FontAwesomeRegular.Keys).

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
Specifies the internal page ID for the navigation float item.

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

### -LinkHome
Indicates whether the navigation float item should link to the home page.

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

### -Name
Specifies the name of the navigation float item.

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

