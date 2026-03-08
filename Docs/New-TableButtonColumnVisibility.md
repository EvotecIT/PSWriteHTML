---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-TableButtonColumnVisibility
## SYNOPSIS
Creates a new table button for column visibility control.

## SYNTAX
### __AllParameterSets
```powershell
New-TableButtonColumnVisibility [[-ButtonName] <string>] [[-CollectionTitle] <string>] [[-CollectionPosition] <string>] [[-CollectionLayout] <string>] [[-Fade] <int>] [-DropUp] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new table button for controlling the visibility of columns in a table. It allows customization of the button text, layout, and other properties.

## EXAMPLES

### EXAMPLE 1
```powershell
New-TableButtonColumnVisibility -ButtonName "Toggle Columns" -CollectionTitle "Column Visibility" -CollectionPosition "fixed" -CollectionLayout "two-column" -DropUp -Fade 500
Creates a new table button with the specified properties.
```

## PARAMETERS

### -ButtonName
Specifies the text to display on the button.

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

### -CollectionLayout
Specifies the layout of the collection (columns, two-column, three-column, four-column). Default is 'columns'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: columns, two-column, three-column, four-column

Required: False
Position: 3
Default value: columns
Accept pipeline input: False
Accept wildcard characters: True
```

### -CollectionPosition
Specifies the position of the collection (fixed or dropdown). Default is 'dropdown'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: fixed, dropdown

Required: False
Position: 2
Default value: dropdown
Accept pipeline input: False
Accept wildcard characters: True
```

### -CollectionTitle
Specifies the title for the column visibility control collection. Default is 'Visibility control'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: Visibility control
Accept pipeline input: False
Accept wildcard characters: True
```

### -DropUp
Indicates whether the collection should be displayed as a drop-up menu.

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

### -Fade
Specifies the fade effect duration when toggling visibility.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: 0
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

