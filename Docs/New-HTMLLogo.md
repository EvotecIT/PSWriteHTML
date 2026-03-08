---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLLogo
## SYNOPSIS
Creates a new HTML logo with specified parameters.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLLogo [[-LogoPath] <string>] [[-LeftLogoName] <string>] [[-RightLogoName] <string>] [[-LeftLogoString] <string>] [[-RightLogoString] <string>] [-HideLogos] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML logo using the provided parameters. It allows customization of the left and right logo names, strings, and the option to hide logos.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLLogo -LogoPath "C:\Logos\logo.png" -LeftLogoName "CompanyA" -RightLogoName "CompanyB" -LeftLogoString "Company A Logo" -RightLogoString "Company B Logo"
```

Creates a new HTML logo with custom left and right logo names and strings.

### EXAMPLE 2
```powershell
New-HTMLLogo -LogoPath "C:\Logos\logo.png" -HideLogos
```

Creates a new HTML logo with logos hidden.

## PARAMETERS

### -HideLogos
Switch parameter to hide logos.

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

### -LeftLogoName
The name of the left logo. Default is "Sample".

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: Sample
Accept pipeline input: False
Accept wildcard characters: True
```

### -LeftLogoString
The string for the left logo.

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

### -LogoPath
The path to the logo.

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

### -RightLogoName
The name of the right logo. Default is "Alternate".

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: Alternate
Accept pipeline input: False
Accept wildcard characters: True
```

### -RightLogoString
The string for the right logo.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

