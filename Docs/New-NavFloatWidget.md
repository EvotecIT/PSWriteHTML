---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-NavFloatWidget
## SYNOPSIS
Creates a new navigation float widget with customizable options for different types of widgets.

## SYNTAX
### __AllParameterSets
```powershell
New-NavFloatWidget [[-Items] <scriptblock>] [[-Type] <string>] [[-Title] <string>] [<CommonParameters>]
```

## DESCRIPTION
The New-NavFloatWidget function creates a new navigation float widget with various customizable options such as Dots, SelectBox, List, Toggle, and Text. Each type of widget has specific styling and functionality.

## EXAMPLES

### EXAMPLE 1
```powershell
New-NavFloatWidget -Items { New-NavFloatWidgetItem -Name "Home" -Href "/home" -IconBrands "fab fa-home" -IconColor "blue" } -Type "Dots"
Creates a new navigation float widget with Dots type, displaying a single item named "Home" with a home icon in blue color.
```

### EXAMPLE 2
```powershell
New-NavFloatWidget -Items { New-NavFloatWidgetItem -Name "About" -Href "/about" -IconRegular "far fa-address-card" -IconColor "green" } -Type "List" -Title "About Us"
Creates a new navigation float widget with List type, displaying a single item named "About" with an address card icon in green color and a title "About Us".
```

### EXAMPLE 3
```powershell
New-NavFloatWidget -Items { New-NavFloatWidgetItem -Name "Toggle 1" -Href "/toggle1" } -Type "Toggle" -Title "Toggle Items"
Creates a new navigation float widget with Toggle type, displaying a single item named "Toggle 1" linking to "/toggle1" and a title "Toggle Items".
```

## PARAMETERS

### -Items
Specifies the script block defining the items to be included in the widget.

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

### -Title
Specifies the title of the widget.

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

### -Type
Specifies the type of the widget. Valid values are: Dots, SelectBox, List, Toggle, Text.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: Dots, SelectBox, List, Toggle, Text

Required: False
Position: 1
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

