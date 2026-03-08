---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLQRCode
## SYNOPSIS
Creates an HTML QR code with specified parameters.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLQRCode [[-Link] <string>] [[-Width] <Object>] [[-Height] <Object>] [[-Title] <string>] [[-TitleColor] <string>] [[-Logo] <string>] [[-LogoWidth] <Object>] [[-LogoHeight] <Object>] [-LogoInline] [<CommonParameters>]
```

## DESCRIPTION
This function generates an HTML QR code based on the provided parameters. It allows customization of the QR code appearance and content.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLQRCode -Link "https://example.com" -Width 200 -Height 200 -Title "Example QR Code" -TitleColor "black" -Logo "C:\logo.png" -LogoWidth 50 -LogoHeight 50 -LogoInline
Creates a QR code with a specified link, dimensions, title, color, and logo embedded inline.
```

### EXAMPLE 2
```powershell
New-HTMLQRCode -Link "tel:1234567890" -Width 150 -Height 150 -Title "Contact Number" -TitleColor "blue" -Logo "C:\company_logo.png" -LogoWidth 30 -LogoHeight 30
Generates a QR code for a phone number with custom dimensions, title, color, and logo.
```

## PARAMETERS

### -Height
The height of the QR code.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Link
The link or content to be encoded in the QR code.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Logo
The path to the logo image to be embedded in the QR code.

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

### -LogoHeight
The height of the logo image.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -LogoInline
Indicates whether the logo should be embedded inline in the QR code.

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

### -LogoWidth
The width of the logo image.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Title
The title or alt text for the QR code.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleColor
The color of the title text.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Width
The width of the QR code.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
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

