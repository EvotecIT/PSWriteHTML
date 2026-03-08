---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-TableContent
## SYNOPSIS
Provide a way to style or overwrite the table content with new content or style

## SYNTAX
### __AllParameterSets
```powershell
New-TableContent [[-ColumnName] <string[]>] [[-ColumnIndex] <int[]>] [[-RowIndex] <int[]>] [[-Text] <string[]>] [[-Color] <string>] [[-BackGroundColor] <string>] [[-FontSize] <Object>] [[-FontWeight] <string>] [[-FontStyle] <string>] [[-FontVariant] <string>] [[-FontFamily] <string>] [[-Alignment] <string>] [[-TextDecoration] <string>] [[-TextTransform] <string>] [[-Direction] <string>] [[-WordBreak] <string>] [<CommonParameters>]
```

## DESCRIPTION
Provide a way to style or overwrite the table content with new content or style

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTML -TitleText "Example37 - Word Breaking" -FilePath "$PSScriptRoot\Example37.html" {
    New-HTMLSection -HeaderText "Word Break for whole table" -HeaderTextAlignment center -Content {
        New-HTMLTable -DataTable $(Get-Process | Select-Object -First 5) -WordBreak 'break-word'
    }
    New-HTMLSection -HeaderText "Word Break per column" -HeaderTextAlignment center -Content {
        New-HTMLTable -DataTable $(Get-Process | Select-Object -First 5) {
            New-TableContent -WordBreak break-all -ColumnName 'Path'
        }
    }
    New-HTMLSection -HeaderText "No word break" -HeaderTextAlignment center -Content {
        New-HTMLTable -DataTable $(Get-Process | Select-Object -First 5)
    }
} -Online -ShowHTML
```

### EXAMPLE 2
```powershell
$Values = @(
    [PSCustomObject] @{
        Test1 = 1
        Test2 = 2
        Test3 = 3
        Test4 = 1
    }
    [PSCustomObject] @{
        Test1 = 1
        Test2 = 2
        Test3 = 3
        Test4 = 1
    }
    [PSCustomObject] @{
        Test1 = 1
        Test2 = 2
        Test3 = 3
        Test4 = 2
    }
    [PSCustomObject] @{
        Test1 = 1
        Test2 = 2
        Test3 = 3
        Test4 = 1
    }
    [PSCustomObject] @{
        Test1 = 1
        Test2 = 2
        Test3 = 3
        Test4 = 1
    }
    [PSCustomObject] @{
        Test1 = 1
        Test2 = 2
        Test3 = 3
        Test4 = 2
    }
)
```

New-HTML -TitleText "Example41 - Table" -FilePath "$PSScriptRoot\Example41.html" {
    New-HTMLSection -HeaderText "Testing" -HeaderTextAlignment center -Content {
        New-HTMLTable -DataTable $Values {
            for ($i = 0; $i -le $Values.Count; $i++) {
                if ($Values[$i].Test1 -ne $Values[$i].Test4) {
                    New-TableContent -BackGroundColor Red -ColumnName 'Test4' -RowIndex ($i+1)
                }
            }
        }
    }
} -Online -ShowHTML

## PARAMETERS

### -Alignment
Provide new alignment. When skipped the alignment will not be changed. Options are: 'left', 'center', 'right', 'justify'

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: left, center, right, justify

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BackGroundColor
Pick one of the 800 colors or provide a hex color code.

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

### -Color
Pick one of the 800 colors or provide a hex color code.

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

### -ColumnIndex
Define column index to search where to replace the content or style. Conflicts with ColumnName. Choose one or the other.

```yaml
Type: Int32[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColumnName
Define column name to search where to replace the content or style. Conflicts with ColumnIndex. Choose one or the other.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: ColumnNames, Names, Name
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Direction
Provide new direction. When skipped the direction will not be changed. Options are: 'rtl','ltr'. By default it's 'ltr'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: rtl, ltr

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontFamily
Provide new font family. When skipped the font family will not be changed.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontSize
Provide new font size. When skipped the font size will not be changed.

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

### -FontStyle
Provide new font style. When skipped the font style will not be changed. Options are: 'normal', 'italic', 'oblique'

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, italic, oblique

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontVariant
Provide new font variant. When skipped the font variant will not be changed. Options are: 'normal', 'small-caps'

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, small-caps

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontWeight
Provide new font weight. When skipped the font weight will not be changed. Options are: 'normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900'

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -RowIndex
Define row index to search where to replace the content or style.

```yaml
Type: Int32[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Text
Overwrite the text content of the cell. If not defined the cell will be styled only.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextDecoration
Provide new text decoration. When skipped the text decoration will not be changed. Options are: 'none', 'line-through', 'overline', 'underline'

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, line-through, overline, underline

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextTransform
Provide new text transform. When skipped the text transform will not be changed. Options are: 'uppercase', 'lowercase', 'capitalize'

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: uppercase, lowercase, capitalize

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -WordBreak
Provide new word break. When skipped the word break will not be changed. Options are: 'normal', 'break-all', 'keep-all', 'break-word'

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, break-all, keep-all, break-word

Required: False
Position: 15
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

