---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLNavFloat
## SYNOPSIS
Creates a new HTML floating navigation menu with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLNavFloat [[-NavigationLinks] <scriptblock>] [[-Title] <string>] [[-Tagline] <string>] [[-TitleColor] <string>] [[-TaglineColor] <string>] [[-ButtonLocationTop] <Object>] [[-ButtonLocationLeft] <Object>] [[-ButtonLocationRight] <Object>] [[-ButtonLocationBottom] <Object>] [[-ButtonColor] <string>] [[-ButtonColorBackground] <string>] [[-ButtonColorOnHover] <string>] [[-ButtonColorBackgroundOnHover] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML floating navigation menu with various customization options such as navigation links, title, tagline, colors, and button styling for hover effects.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLNavFloat -ButtonColor 'Value'
```

## PARAMETERS

### -ButtonColor
Specifies the color of the floating navigation menu button.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ButtonColorBackground
Specifies the background color of the floating navigation menu button.

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

### -ButtonColorBackgroundOnHover
Specifies the background color of the floating navigation menu button on hover.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ButtonColorOnHover
Specifies the color of the floating navigation menu button on hover.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ButtonLocationBottom
Specifies the bottom position of the floating navigation menu button.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ButtonLocationLeft
Specifies the left position of the floating navigation menu button.

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

### -ButtonLocationRight
Specifies the right position of the floating navigation menu button.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ButtonLocationTop
Specifies the top position of the floating navigation menu button.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -NavigationLinks
Specifies the script block containing navigation links to be displayed in the menu.

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

### -Tagline
{{ Fill Tagline Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: SubTitle
Possible values: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TaglineColor
Specifies the color of the tagline text.

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

### -Title
Specifies the title of the floating navigation menu.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleColor
Specifies the color of the title text.

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

