---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartLine
## SYNOPSIS
Add a line to a chart

## SYNTAX
### __AllParameterSets
```powershell
New-ChartLine [[-Name] <string>] [[-Value] <Object>] [[-Color] <string>] [[-Curve] <Object>] [[-Width] <int>] [[-Cap] <string>] [[-Dash] <int>] [<CommonParameters>]
```

## DESCRIPTION
Add a line to a chart

## EXAMPLES

### EXAMPLE 1
```powershell
An example
```

## PARAMETERS

### -Cap
For setting the starting and ending points of stroke

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: butt, square, round

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Color
Colors to fill the border for paths.

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

### -Curve
Whether to draw smooth lines or straight lines

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: straight, smooth, stepline

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Dash
Creates dashes in borders of svg path. Higher number creates more space between dashes in the border.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Name
Name of the line

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

### -Value
Values to display

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

### -Width
Sets the width of border for svg path

```yaml
Type: Nullable`1
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

