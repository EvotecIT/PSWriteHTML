---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-TablePercentageBarCondition
## SYNOPSIS
Creates a new table percentage bar condition object with specified attributes.

## SYNTAX
### __AllParameterSets
```powershell
New-TablePercentageBarCondition [-Minimum] <int> [-Maximum] <int> [[-BackgroundColor] <string>] [[-TextColor] <string>] [[-BarColor] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new table percentage bar condition object with the provided attributes. It defines the minimum and maximum values for the percentage range, along with the colors for the background, text, and bar.

## EXAMPLES

### EXAMPLE 1
```powershell
New-TablePercentageBarCondition -Minimum 0 -Maximum 10 -BackgroundColor "#ff0000" -TextColor "#ffffff" -BarColor "#ff0000"
Creates a new table percentage bar condition object for the range 0-10 with specified colors.
```

### EXAMPLE 2
```powershell
New-TablePercentageBarCondition -Minimum 11 -Maximum 20 -BackgroundColor "#00ff00" -BarColor "#00ff00"
Creates a new table percentage bar condition object for the range 11-20 with specified colors.
```

### EXAMPLE 3
```powershell
New-TablePercentageBarCondition -Minimum 21 -Maximum 23 -BackgroundColor "#0000ff" -BarColor "#0000ff"
Creates a new table percentage bar condition object for the range 21-23 with specified colors.
```

### EXAMPLE 4
```powershell
New-TablePercentageBarCondition -Minimum 24 -Maximum 100 -BackgroundColor "#00FFFF" -BarColor "#00FFFF"
Creates a new table percentage bar condition object for the range 24-100 with specified colors.
```

## PARAMETERS

### -BackgroundColor
Specifies the background color for the percentage bar.

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

### -BarColor
Specifies the color of the percentage bar.

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

### -Maximum
Specifies the maximum value for the percentage range.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: True
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -Minimum
Specifies the minimum value for the percentage range.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: True
Position: 0
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextColor
Specifies the text color for the percentage bar.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

