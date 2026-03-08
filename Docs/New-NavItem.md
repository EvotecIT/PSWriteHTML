---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-NavItem
## SYNOPSIS
Creates a new navigation item with specified parameters.

## SYNTAX
### FontAwesomeSolid (Default)
```powershell
New-NavItem -Type <string> [-Name <string>] [-Href <string>] [-InternalPageID <string>] [-IconColor <string>] [-IconSolid <string>] [<CommonParameters>]
```

### FontMaterial
```powershell
New-NavItem -Type <string> [-Name <string>] [-Href <string>] [-InternalPageID <string>] [-IconColor <string>] [-IconMaterial <string>] [-Spinning] [-SpinningReverse] [-Bordered] [-BorderedCircle] [-PullLeft] [-PullRight] [-Rotate <string>] [-FlipVertical] [-FlipHorizontal] [<CommonParameters>]
```

### FontAwesomeRegular
```powershell
New-NavItem -Type <string> [-Name <string>] [-Href <string>] [-InternalPageID <string>] [-IconColor <string>] [-IconRegular <string>] [<CommonParameters>]
```

### FontAwesomeBrands
```powershell
New-NavItem -Type <string> [-Name <string>] [-Href <string>] [-InternalPageID <string>] [-IconColor <string>] [-IconBrands <string>] [<CommonParameters>]
```

## DESCRIPTION
The New-NavItem function creates a new navigation item with the specified parameters, such as name, href, type, icon, and color.

## EXAMPLES

### EXAMPLE 1
```powershell
New-NavItem -Name "Home" -Href "/" -Type "Menu" -IconBrands "fa fa-home" -IconColor "blue"
Creates a new navigation item named "Home" with a link to the root ("/"), type "Menu", using a home icon from FontAwesome Brands with blue color.
```

### EXAMPLE 2
```powershell
New-NavItem -Name "About" -Href "/about" -Type "Grid" -IconRegular "far fa-address-card" -IconColor "green"
Creates a new navigation item named "About" with a link to "/about", type "Grid", using an address card icon from FontAwesome Regular with green color.
```

### EXAMPLE 3
```powershell
New-NavItem -Name "Contact" -Href "/contact" -Type "Menu" -FontMaterial "person" -IconColor "red"
Creates a new navigation item named "Contact" with a link to "/contact", type "Menu", using a person icon from Material Design Icons with red color.
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
{{ Fill Href Description }}

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
{{ Fill IconColor Description }}

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
{{ Fill InternalPageID Description }}

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
{{ Fill Name Description }}

```yaml
Type: String
Parameter Sets: FontAwesomeSolid, FontMaterial, FontAwesomeRegular, FontAwesomeBrands
Aliases: Text
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

### -Type
{{ Fill Type Description }}

```yaml
Type: String
Parameter Sets: FontAwesomeSolid, FontMaterial, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: Grid, Menu

Required: True
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

