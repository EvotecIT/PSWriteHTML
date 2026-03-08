---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLSummaryItem
## SYNOPSIS
Creates a new HTML summary item with specified parameters.

## SYNTAX
### FontAwesomeSolid (Default)
```powershell
New-HTMLSummaryItem [-NestedItems <scriptblock>] [-Text <string>] [-Open] [-IconSize <int>] [-IconColor <string>] [-IconSolid <string>] [<CommonParameters>]
```

### FontAwesomeRegular
```powershell
New-HTMLSummaryItem [-NestedItems <scriptblock>] [-Text <string>] [-Open] [-IconSize <int>] [-IconColor <string>] [-IconRegular <string>] [<CommonParameters>]
```

### FontAwesomeBrands
```powershell
New-HTMLSummaryItem [-NestedItems <scriptblock>] [-Text <string>] [-Open] [-IconSize <int>] [-IconColor <string>] [-IconBrands <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML summary item with customizable text, icons, and other visual properties.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLSummaryItem -Text "Summary Item 1" -IconBrands "fa-windows" -IconSize 2 -IconColor "blue" -Open
```

Creates a new HTML summary item with the text "Summary Item 1", using the Windows icon brand, a size of 2, blue color, and initially open.

### EXAMPLE 2
```powershell
New-HTMLSummaryItem -Text "Summary Item 2" -IconRegular "fa-address-book" -IconSize 3 -IconColor "green"
```

Creates a new HTML summary item with the text "Summary Item 2", using the address book regular icon, a size of 3, and green color.

## PARAMETERS

### -IconBrands
Specifies the icon brand to use for the summary item. Valid values are retrieved from the available FontAwesome brands.

```yaml
Type: String
Parameter Sets: FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconColor
Specifies the color of the icon in the summary item.

```yaml
Type: String
Parameter Sets: FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconRegular
Specifies the regular icon to use for the summary item. Valid values are retrieved from the available FontAwesome regular icons.

```yaml
Type: String
Parameter Sets: FontAwesomeRegular
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconSize
Specifies the size of the icon in the summary item.

```yaml
Type: Int32
Parameter Sets: FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconSolid
ICON SOLID

```yaml
Type: String
Parameter Sets: FontAwesomeSolid
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -NestedItems
Specifies the nested items to include within the summary item.

```yaml
Type: ScriptBlock
Parameter Sets: FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Open
Indicates whether the summary item should be initially open or closed.

```yaml
Type: SwitchParameter
Parameter Sets: FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -Text
Specifies the text content of the summary item.

```yaml
Type: String
Parameter Sets: FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
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

- `None`

## RELATED LINKS

- None

