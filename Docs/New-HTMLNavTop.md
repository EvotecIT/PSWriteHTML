---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLNavTop
## SYNOPSIS
Creates a top navigation bar in HTML format with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLNavTop [[-NavigationLinks] <scriptblock>] [[-Logo] <string>] [[-LogoLink] <string>] [[-MenuItemsWidth] <Object>] [[-MenuColor] <string>] [[-MenuColorBackground] <string>] [[-HomeColor] <string>] [[-HomeColorBackground] <string>] [[-HomeLink] <string>] [-LogoLinkHome] [-HomeLinkHome] [-Convert] [<CommonParameters>]
```

## DESCRIPTION
This function generates a top navigation bar in HTML format with customizable options such as navigation links, logo, colors, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLNavTop -NavigationLinks { 
    "Link 1", "Link 2", "Link 3" 
} -Logo "logo.png" -LogoLink "https://example.com" -LogoLinkHome -MenuItemsWidth '250px' -MenuColor 'Blue' -MenuColorBackground 'White' -HomeColor 'Red' -HomeColorBackground 'White' -HomeLink "https://example.com/home" -HomeLinkHome
Creates a top navigation bar with specified navigation links, logo, colors, and home link.
```

## PARAMETERS

### -Convert
Switch parameter to indicate if conversion is needed.

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

### -HomeColor
Specifies the color of the home link text.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: PacificBlue
Accept pipeline input: False
Accept wildcard characters: True
```

### -HomeColorBackground
Specifies the background color of the home link.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: Black
Accept pipeline input: False
Accept wildcard characters: True
```

### -HomeLink
Specifies the URL for the home link.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HomeLinkHome
Indicates whether the home link should link to the home page.

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

### -Logo
Specifies the path to the logo image.

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

### -LogoLink
Specifies the URL to link the logo to.

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

### -LogoLinkHome
Indicates whether the logo should link to the home page.

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

### -MenuColor
Specifies the color of the menu text.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: PacificBlue
Accept pipeline input: False
Accept wildcard characters: True
```

### -MenuColorBackground
Specifies the background color of the menu.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: Black
Accept pipeline input: False
Accept wildcard characters: True
```

### -MenuItemsWidth
Specifies the width of the menu items.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: 200px
Accept pipeline input: False
Accept wildcard characters: True
```

### -NavigationLinks
Specifies the script block containing the navigation links to be displayed.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

