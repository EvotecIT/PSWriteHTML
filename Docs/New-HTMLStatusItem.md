---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version:
schema: 2.0.0
---

# New-HTMLStatusItem

## SYNOPSIS
{{Fill in the Synopsis}}

## SYNTAX

### Statusimo (Default)
```
New-HTMLStatusItem [-Name <String>] [-Status <String>] [-Icon <Object>] [-Percentage <String>]
 [-FontColor <String>] [<CommonParameters>]
```

### Hex
```
New-HTMLStatusItem [-Name <String>] [-Status <String>] [-FontColor <String>] [-BackgroundColor <String>]
 [-IconHex <String>] [<CommonParameters>]
```

### FontAwesomeSolid
```
New-HTMLStatusItem [-Name <String>] [-Status <String>] [-FontColor <String>] [-BackgroundColor <String>]
 [-IconSolid <String>] [<CommonParameters>]
```

### FontAwesomeRegular
```
New-HTMLStatusItem [-Name <String>] [-Status <String>] [-FontColor <String>] [-BackgroundColor <String>]
 [-IconRegular <String>] [<CommonParameters>]
```

### FontAwesomeBrands
```
New-HTMLStatusItem [-Name <String>] [-Status <String>] [-FontColor <String>] [-BackgroundColor <String>]
 [-IconBrands <String>] [<CommonParameters>]
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

### -BackgroundColor
{{ Fill BackgroundColor Description }}

```yaml
Type: String
Parameter Sets: Hex, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FontColor
{{ Fill FontColor Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Icon
{{Fill Icon Description}}

```yaml
Type: Object
Parameter Sets: Statusimo
Aliases:
Accepted values: Dead, Bad, Good

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IconBrands
{{ Fill IconBrands Description }}

```yaml
Type: String
Parameter Sets: FontAwesomeBrands
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IconHex
{{ Fill IconHex Description }}

```yaml
Type: String
Parameter Sets: Hex
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IconRegular
{{ Fill IconRegular Description }}

```yaml
Type: String
Parameter Sets: FontAwesomeRegular
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IconSolid
{{ Fill IconSolid Description }}

```yaml
Type: String
Parameter Sets: FontAwesomeSolid
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
{{ Fill Name Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases: ServiceName

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Percentage
{{Fill Percentage Description}}

```yaml
Type: String
Parameter Sets: Statusimo
Aliases:
Accepted values: 0%, 10%, 30%, 70%, 100%

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Status
{{ Fill Status Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases: ServiceStatus

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
