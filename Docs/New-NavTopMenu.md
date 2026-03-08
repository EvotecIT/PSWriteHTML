---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-NavTopMenu
## SYNOPSIS
Creates a new navigation top menu item with customizable options.

## SYNTAX
### FontAwesomeSolid (Default)
```powershell
New-NavTopMenu [[-MenuItem] <scriptblock>] -Name <string> [-Href <string>] [-InternalPageID <string>] [-IconColor <string>] [-IconSolid <string>] [<CommonParameters>]
```

### FontMaterial
```powershell
New-NavTopMenu [[-MenuItem] <scriptblock>] -Name <string> [-Href <string>] [-InternalPageID <string>] [-IconColor <string>] [-IconMaterial <string>] [-Spinning] [-SpinningReverse] [-Bordered] [-BorderedCircle] [-PullLeft] [-PullRight] [-Rotate <string>] [-FlipVertical] [-FlipHorizontal] [<CommonParameters>]
```

### FontAwesomeRegular
```powershell
New-NavTopMenu [[-MenuItem] <scriptblock>] -Name <string> [-Href <string>] [-InternalPageID <string>] [-IconColor <string>] [-IconRegular <string>] [<CommonParameters>]
```

### FontAwesomeBrands
```powershell
New-NavTopMenu [[-MenuItem] <scriptblock>] -Name <string> [-Href <string>] [-InternalPageID <string>] [-IconColor <string>] [-IconBrands <string>] [<CommonParameters>]
```

## DESCRIPTION
The New-NavTopMenu function creates a new navigation top menu item with various customizable options such as icon, name, href, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-NavTopMenu -Name "Home" -Href "/home" -IconBrands "fa fa-home" -IconColor "blue"
Creates a new navigation top menu item named "Home" with a home icon from Font Awesome Brands in blue color.
```

### EXAMPLE 2
```powershell
New-NavTopMenu -Name "About" -Href "/about" -IconRegular "fa fa-info-circle" -IconColor "green"
Creates a new navigation top menu item named "About" with an info circle icon from Font Awesome Regular in green color.
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
Specifies the URL to navigate to when the menu item is clicked.

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
Specifies the icon for the menu item from the Font Awesome Brands collection.

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
Specifies the icon for the menu item from the Font Awesome Regular collection.

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
Specifies the internal page ID associated with the menu item.

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

### -MenuItem
Specifies the script block defining the menu item properties.

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

### -Name
Specifies the name of the menu item. This parameter is mandatory.

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

