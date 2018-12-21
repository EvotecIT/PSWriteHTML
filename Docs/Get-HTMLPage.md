---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version:
schema: 2.0.0
---

# Get-HTMLPage

## SYNOPSIS
{{Fill in the Synopsis}}

## SYNTAX

### options (Default)
```
Get-HTMLPage [-TitleText <String>] [-HideLogos] [-HideTitle] [-NoScript] [-Options <PSObject>] [-Open]
 [<CommonParameters>]
```

### explicit
```
Get-HTMLPage [-TitleText <String>] [-CSSPath <String>] [-CSSName <String>] [-ScriptPath <String>]
 [-ColorSchemePath <String>] [-LogoPath <String>] [-LeftLogoName <String>] [-RightLogoName <String>]
 [-LeftLogoString <String>] [-RightLogoString <String>] [-HideLogos] [-HideTitle] [-NoScript]
 [-PrimaryColorHex <String>] [-Open] [<CommonParameters>]
```

### open
```
Get-HTMLPage [-TitleText <String>] [-CSSPath <String>] [-CSSName <String>] [-ScriptPath <String>]
 [-ColorSchemePath <String>] [-LogoPath <String>] [-LeftLogoName <String>] [-RightLogoName <String>]
 [-LeftLogoString <String>] [-RightLogoString <String>] [-HideLogos] [-HideTitle] [-NoScript]
 [-Options <PSObject>] [-AddAuthor] [-Author <String>] [-HideDate] [-DateFormat <String>] [-UseCssLinks]
 [-UseStyleLinks] [-Open] [<CommonParameters>]
```

### close
```
Get-HTMLPage [-Close] [-FooterText <String>] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -AddAuthor
{{Fill AddAuthor Description}}

```yaml
Type: SwitchParameter
Parameter Sets: open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Author
{{Fill Author Description}}

```yaml
Type: String
Parameter Sets: open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CSSName
{{Fill CSSName Description}}

```yaml
Type: String
Parameter Sets: explicit, open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CSSPath
{{Fill CSSPath Description}}

```yaml
Type: String
Parameter Sets: explicit, open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Close
{{Fill Close Description}}

```yaml
Type: SwitchParameter
Parameter Sets: close
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColorSchemePath
{{Fill ColorSchemePath Description}}

```yaml
Type: String
Parameter Sets: explicit, open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DateFormat
{{Fill DateFormat Description}}

```yaml
Type: String
Parameter Sets: open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FooterText
{{Fill FooterText Description}}

```yaml
Type: String
Parameter Sets: close
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HideDate
{{Fill HideDate Description}}

```yaml
Type: SwitchParameter
Parameter Sets: open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HideLogos
{{Fill HideLogos Description}}

```yaml
Type: SwitchParameter
Parameter Sets: options, explicit, open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HideTitle
{{Fill HideTitle Description}}

```yaml
Type: SwitchParameter
Parameter Sets: options, explicit, open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LeftLogoName
{{Fill LeftLogoName Description}}

```yaml
Type: String
Parameter Sets: explicit, open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LeftLogoString
{{Fill LeftLogoString Description}}

```yaml
Type: String
Parameter Sets: explicit, open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogoPath
{{Fill LogoPath Description}}

```yaml
Type: String
Parameter Sets: explicit, open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoScript
{{Fill NoScript Description}}

```yaml
Type: SwitchParameter
Parameter Sets: options, explicit, open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Open
{{Fill Open Description}}

```yaml
Type: SwitchParameter
Parameter Sets: options, explicit, open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Options
{{Fill Options Description}}

```yaml
Type: PSObject
Parameter Sets: options, open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PrimaryColorHex
{{Fill PrimaryColorHex Description}}

```yaml
Type: String
Parameter Sets: explicit
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RightLogoName
{{Fill RightLogoName Description}}

```yaml
Type: String
Parameter Sets: explicit, open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RightLogoString
{{Fill RightLogoString Description}}

```yaml
Type: String
Parameter Sets: explicit, open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScriptPath
{{Fill ScriptPath Description}}

```yaml
Type: String
Parameter Sets: explicit, open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleText
{{Fill TitleText Description}}

```yaml
Type: String
Parameter Sets: options, explicit, open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseCssLinks
{{Fill UseCssLinks Description}}

```yaml
Type: SwitchParameter
Parameter Sets: open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseStyleLinks
{{Fill UseStyleLinks Description}}

```yaml
Type: SwitchParameter
Parameter Sets: open
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
