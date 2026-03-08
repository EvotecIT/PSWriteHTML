---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLTextBox
## SYNOPSIS
Adds text to HTML where each line in TextBlock is treated as next line (adds BR to each line)

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLTextBox [[-TextBlock] <scriptblock>] [-Color <string[]>] [-BackGroundColor <string[]>] [-FontSize <int[]>] [-FontWeight <string[]>] [-FontStyle <string[]>] [-TextDecoration <string[]>] [-FontVariant <string[]>] [-FontFamily <string[]>] [-Alignment <string[]>] [-TextTransform <string[]>] [-Direction <string[]>] [-LineBreak] [<CommonParameters>]
```

## DESCRIPTION
Adds text to HTML where each line in TextBlock is treated as next line (adds BR to each line).
Automatic line breaks are main feature that differentiate New-HTMLTextBox from New-HTMLText
where TextBlock is treated as single line of text unless LineBreak switch is used.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLTextBox {
    "Hello $UserNotify,"
    ""
    "Your password is due to expire in $PasswordExpiryDays days."
    ""
    'To change your password: '
    '- press CTRL+ALT+DEL -> Change a password...'
    ''
    'If you have forgotten your password and need to reset it, you can do this by clicking here. '
    "In case of problems please contact the HelpDesk by visiting [Evotec Website](https://evotec.xyz) or by sending an email to Help Desk."
    ''
    'Alternatively you can always call Help Desk at +48 22 00 00 00'
    ''
    'Kind regards,'
    'Evotec IT'
}
```

## PARAMETERS

### -Alignment
Chhoose Alignment

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: left, center, right, justify

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -BackGroundColor
Color of Background for a Text to set. Choose one or more colors from up to 800 defined colors. Alternatively provide your own Hex value

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -Color
Color of Text to set. Choose one or more colors from up to 800 defined colors. Alternatively provide your own Hex value

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -Direction
Parameter description

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: rtl

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontFamily
Parameter description

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontSize
Choose FontSize. You can provide just int value which will assume pixels or string value with any other size value.

```yaml
Type: Int32[]
Parameter Sets: __AllParameterSets
Aliases: Size
Possible values: 

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStyle
Parameter description

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, italic, oblique

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontVariant
Parameter description

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, small-caps

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontWeight
Parameter description

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -LineBreak
Parameter description

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

### -TextBlock
ScriptBlock of one or more strings

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

### -TextDecoration
Parameter description

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, line-through, overline, underline

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextTransform
Parameter description

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: uppercase, lowercase, capitalize

Required: False
Position: named
Default value: @()
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

