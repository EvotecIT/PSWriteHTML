---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLToast
## SYNOPSIS
Creates a new HTML toast notification with customizable text, icons, and colors.

## SYNTAX
### FontAwesomeSolid
```powershell
New-HTMLToast [-TextHeader <string>] [-TextHeaderColor <string>] [-Text <string>] [-TextColor <string>] [-IconSize <int>] [-IconColor <string>] [-BarColorLeft <string>] [-BarColorRight <string>] [-IconSolid <string>] [<CommonParameters>]
```

### FontAwesomeRegular
```powershell
New-HTMLToast [-TextHeader <string>] [-TextHeaderColor <string>] [-Text <string>] [-TextColor <string>] [-IconSize <int>] [-IconColor <string>] [-BarColorLeft <string>] [-BarColorRight <string>] [-IconRegular <string>] [<CommonParameters>]
```

### FontAwesomeBrands
```powershell
New-HTMLToast [-TextHeader <string>] [-TextHeaderColor <string>] [-Text <string>] [-TextColor <string>] [-IconSize <int>] [-IconColor <string>] [-BarColorLeft <string>] [-BarColorRight <string>] [-IconBrands <string>] [<CommonParameters>]
```

## DESCRIPTION
This function generates an HTML toast notification with options to set the text, text colors, icons, icon size, and various color settings for different elements of the notification.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLToast -TextHeader "Notification" -Text "This is a sample notification" -IconBrands "fa-github" -BarColorRight "Red"
Creates a new HTML toast notification with a header "Notification", main text "This is a sample notification", GitHub icon, and a red color for the right bar.
```

### EXAMPLE 2
```powershell
New-HTMLToast -TextHeader "Alert" -Text "Alert message here" -IconBrands "fa-exclamation-triangle" -IconColor "Orange" -BarColorLeft "Yellow" -BarColorRight "Red"
Creates a new HTML toast notification with a header "Alert", main text "Alert message here", warning triangle icon in orange color, yellow left bar, and red right bar.
```

## PARAMETERS

### -BarColorLeft
Specifies the color of the left bar in the notification.

```yaml
Type: String
Parameter Sets: FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: Blue
Accept pipeline input: False
Accept wildcard characters: True
```

### -BarColorRight
Specifies the color of the right bar in the notification.

```yaml
Type: String
Parameter Sets: FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconBrands
Specifies the icon to be used from the Font Awesome Brands collection.

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
Parameter Sets: FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: Blue
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

### -IconSize
Specifies the size of the icon in pixels.

```yaml
Type: Int32
Parameter Sets: FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: 30
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

### -Text
Specifies the main text content of the notification.

```yaml
Type: String
Parameter Sets: FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextColor
Specifies the color of the main text.

```yaml
Type: String
Parameter Sets: FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextHeader
Specifies the header text of the notification.

```yaml
Type: String
Parameter Sets: FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextHeaderColor
Specifies the color of the header text.

```yaml
Type: String
Parameter Sets: FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

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

