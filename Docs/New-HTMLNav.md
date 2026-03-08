---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLNav
## SYNOPSIS
Creates a new HTML navigation menu with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLNav [[-NavigationLinks] <scriptblock>] [[-Logo] <string>] [[-LogoLink] <string>] [[-MenuWidth] <int>] [[-MenuWidthExtended] <int>] [[-TopBarBackGroundColor] <string>] [[-TopBarColor] <string>] [[-LeftMenuBackgroundColor] <string>] [[-LeftMenuColor] <string>] [-LogoLinkHome] [-DisableBackgroundFading] [-DisableClickToClose] [-DisableNavControls] [-DisableStickyMenubar] [-StartMenuOpen] [-FixedMenu] [-DisableHamburger] [-ResizeContent] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML navigation menu with various customization options such as navigation links, logo, colors, and menu settings.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLNav -NavigationLinks { 'Home', 'About', 'Services' } -Logo 'logo.png' -LogoLink 'https://example.com' -TopBarBackGroundColor 'blue' -TopBarColor 'white' -LeftMenuBackgroundColor 'black' -LeftMenuColor 'white'
```

Creates a new HTML navigation menu with specified navigation links and custom logo, colors, and menu settings.

## PARAMETERS

### -DisableBackgroundFading
Switch to disable background fading when the side navigation drawer is open.

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

### -DisableClickToClose
Switch to disable closing opened items when the user clicks outside of them.

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

### -DisableHamburger
Switch to disable the hamburger menu icon.

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

### -DisableNavControls
Switch to disable navigation controls for adjusting drawer width and height.

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

### -DisableStickyMenubar
Switch to make the menubar static instead of sticky.

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

### -FixedMenu
Switch to make the menu fixed.

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

### -LeftMenuBackgroundColor
Specifies the background color of the left menu.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -LeftMenuColor
Specifies the text color of the left menu.

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

### -Logo
Specifies the path to the logo image to be displayed in the menu.

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

### -MenuWidth
Specifies the width of the menu (default is 270).

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: 270
Accept pipeline input: False
Accept wildcard characters: True
```

### -MenuWidthExtended
Specifies the extended width of the menu (default is 320).

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: 320
Accept pipeline input: False
Accept wildcard characters: True
```

### -NavigationLinks
Specifies the script block containing navigation links to be displayed in the menu.

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

### -ResizeContent
Switch to enable content resizing.

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

### -StartMenuOpen
Switch to determine if the menu should start open.

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

### -TopBarBackGroundColor
Specifies the background color of the top bar.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TopBarColor
Specifies the text color of the top bar.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
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

