---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLTableStyle
## SYNOPSIS
Apply new style for HTML Table

## SYNTAX
### Manual (Default)
```powershell
New-HTMLTableStyle [-Type <string>] [-FontSize <string>] [-FontWeight <string>] [-FontStyle <string>] [-FontVariant <string>] [-FontFamily <string>] [-BackgroundColor <string>] [-TextColor <string>] [-TextDecoration <string>] [-TextTransform <string>] [-TextAlign <string>] [-BorderTopStyle <Object>] [-BorderTopColor <string>] [-BorderTopWidthSize <string>] [-BorderBottomStyle <Object>] [-BorderBottomColor <string>] [-BorderBottomWidthSize <string>] [-BorderLeftStyle <Object>] [-BorderLeftColor <string>] [-BorderLeftWidthSize <string>] [-BorderRightStyle <Object>] [-BorderRightColor <string>] [-BorderRightWidthSize <string>] [<CommonParameters>]
```

## DESCRIPTION
Apply new style for HTML Table. Currently only works with DataTables (javascript). It doesn't affect CSS only tables (emails, etc). Keep in mind this affects all tables, not just one.

## EXAMPLES

### EXAMPLE 1
```powershell
$Table = Get-Process | Select-Object -First 3
```

New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Yellow -TextColor Aquamarine -TextAlign center -Type RowOdd
New-HTMLTableStyle -BackgroundColor Red -TextColor Aquamarine -Type Button
New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor DarkSlateGray -TextColor Aquamarine -TextAlign center -Type RowEven
New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor DarkSlateGray -TextColor Aquamarine -TextAlign center -Type Row
New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor DarkSlateGray -TextColor Aquamarine -TextAlign center -Type Header
New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Orange -TextColor Aquamarine -TextAlign center -Type Footer
New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Orange -TextColor Aquamarine -TextAlign center -Type RowSelectedEven
New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Green -TextColor Aquamarine -TextAlign center -Type RowSelectedOdd
New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Yellow -TextColor Aquamarine -TextAlign center -Type RowHover
New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Red -TextColor Aquamarine -TextAlign center -Type RowHoverSelected
New-HTMLTableStyle -Type Header -BorderLeftStyle dashed -BorderLeftColor Red -BorderLeftWidthSize 1px
New-HTMLTableStyle -Type Footer -BorderLeftStyle dotted -BorderLeftColor Red -BorderleftWidthSize 1px
New-HTMLTableStyle -Type Footer -BorderTopStyle none -BorderTopColor Red -BorderTopWidthSize 5px -BorderBottomColor Yellow -BorderBottomStyle solid
New-HTMLTableStyle -Type Footer -BorderTopStyle none -BorderTopColor Red -BorderTopWidthSize 5px -BorderBottomColor Yellow -BorderBottomStyle solid
New-HTMLTableStyle -Type Footer -BorderTopStyle none -BorderTopColor Red -BorderTopWidthSize 5px -BorderBottomColor Yellow -BorderBottomStyle none

New-HTML -ShowHTML -HtmlData {
    New-HTMLTable -DataTable $table -HideButtons {

    } -DisablePaging
} -FilePath $PSScriptRoot\Example7_TableStyle.html -Online

## PARAMETERS

### -BackgroundColor
Set the background color. Choose one of the 800 colors or provide a hex value.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderBottomColor
Set the border color for the bottom border

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderBottomStyle
Set the border style for the bottom border. Allowed options are: 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'

```yaml
Type: Object
Parameter Sets: Manual
Aliases: 
Possible values: none, hidden, dotted, dashed, solid, double, groove, ridge, inset, outset

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderBottomWidthSize
Set the border width for the bottom border

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderLeftColor
Set the border color for the left border

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderLeftStyle
Set the border style for the left border. Allowed options are: 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'

```yaml
Type: Object
Parameter Sets: Manual
Aliases: 
Possible values: none, hidden, dotted, dashed, solid, double, groove, ridge, inset, outset

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderLeftWidthSize
Set the border width for the left border

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderRightColor
Set the border color for the right border

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderRightStyle
Set the border style for the right border. Allowed options are: 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'

```yaml
Type: Object
Parameter Sets: Manual
Aliases: 
Possible values: none, hidden, dotted, dashed, solid, double, groove, ridge, inset, outset

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderRightWidthSize
Set the border width for the right border

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderTopColor
Set the border color for the top border

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderTopStyle
Set the border style for the top border. Allowed options are: 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'

```yaml
Type: Object
Parameter Sets: Manual
Aliases: 
Possible values: none, hidden, dotted, dashed, solid, double, groove, ridge, inset, outset

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderTopWidthSize
Set the border width for the top border

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontFamily
Specify the font to be used for text.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontSize
Set font size for the text.

```yaml
Type: String
Parameter Sets: Manual
Aliases: TextSize
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStyle
Set different font styles to be used for text. Allowed styles: 'normal', 'italic', 'oblique'

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: normal, italic, oblique

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontVariant
Set different font variant to be used for text. Allowed variants: 'normal', 'small-caps'. In a small-caps font, all lowercase letters are converted to uppercase letters. However, the converted uppercase letters appears in a smaller font size than the original uppercase letters in the text.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: normal, small-caps

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontWeight
Set font weight for the text. Allowed options: 'normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900'

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextAlign
Set the text alignment. Allowed options are: 'left', 'right', 'center', 'justify'

```yaml
Type: String
Parameter Sets: Manual
Aliases: FontAlign, Align
Possible values: left, right, center, justify

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextColor
Set the text color. Choose one of the 800 colors or provide a hex value.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextDecoration
Set different font decoration. Allowed options are: 'none', 'line-through', 'overline', 'underline'

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: none, line-through, overline, underline

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextTransform
Set different text transform. Allowed options are: 'uppercase', 'lowercase', 'capitalize'

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: uppercase, lowercase, capitalize

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Type
Choose type to apply style on. You can choose from: 'Content', 'Table', 'Header', 'Row', 'Footer', 'RowOdd', 'RowEven', 'RowSelected', 'RowSelectedEven', 'RowSelectedOdd', 'RowHover', 'RowHoverSelected', 'Button'. Content is duplicate to Row.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: Content, Table, Header, Row, Footer, RowOdd, RowEven, RowSelected, RowSelectedEven, RowSelectedOdd, RowHover, RowHoverSelected, Button

Required: False
Position: named
Default value: Table
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

