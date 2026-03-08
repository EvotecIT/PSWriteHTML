---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLStatusItem
## SYNOPSIS
New-HTMLStatusItem [-Name <string>] [-Status <string>] [-Icon <Object>] [-Percentage <string>] [-FontColor <string>] [<CommonParameters>]

New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconHex <string>] [<CommonParameters>]

New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconSolid <string>] [<CommonParameters>]

New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconRegular <string>] [<CommonParameters>]

New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconBrands <string>] [<CommonParameters>]

## SYNTAX
### Statusimo (Default)
```powershell
New-HTMLStatusItem [-Name <string>] [-Status <string>] [-Icon <Object>] [-Percentage <string>] [-FontColor <string>] [<CommonParameters>]
```

### Hex
```powershell
New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconHex <string>] [<CommonParameters>]
```

### FontAwesomeSolid
```powershell
New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconSolid <string>] [<CommonParameters>]
```

### FontAwesomeRegular
```powershell
New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconRegular <string>] [<CommonParameters>]
```

### FontAwesomeBrands
```powershell
New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconBrands <string>] [<CommonParameters>]
```

## DESCRIPTION
New-HTMLStatusItem [-Name <string>] [-Status <string>] [-Icon <Object>] [-Percentage <string>] [-FontColor <string>] [<CommonParameters>]

New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconHex <string>] [<CommonParameters>]

New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconSolid <string>] [<CommonParameters>]

New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconRegular <string>] [<CommonParameters>]

New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconBrands <string>] [<CommonParameters>]

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLStatusItem -Name 'Name'
```

## PARAMETERS

### -BackgroundColor
{{ Fill BackgroundColor Description }}

```yaml
Type: String
Parameter Sets: Hex, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: None
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontColor
{{ Fill FontColor Description }}

```yaml
Type: String
Parameter Sets: Statusimo, Hex, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: None
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Icon
{{ Fill Icon Description }}

```yaml
Type: Object
Parameter Sets: Statusimo
Aliases: None
Possible values: Dead, Bad, Good

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconBrands
{{ Fill IconBrands Description }}

```yaml
Type: String
Parameter Sets: FontAwesomeBrands
Aliases: None
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconHex
{{ Fill IconHex Description }}

```yaml
Type: String
Parameter Sets: Hex
Aliases: None
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconRegular
{{ Fill IconRegular Description }}

```yaml
Type: String
Parameter Sets: FontAwesomeRegular
Aliases: None
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconSolid
{{ Fill IconSolid Description }}

```yaml
Type: String
Parameter Sets: FontAwesomeSolid
Aliases: None
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
Parameter Sets: Statusimo, Hex, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: ServiceName
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Percentage
{{ Fill Percentage Description }}

```yaml
Type: String
Parameter Sets: Statusimo
Aliases: None
Possible values: 0%, 10%, 30%, 70%, 100%

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Status
{{ Fill Status Description }}

```yaml
Type: String
Parameter Sets: Statusimo, Hex, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: ServiceStatus
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

- `System.Object`

## RELATED LINKS

- None

