---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLInfoCard
## SYNOPSIS
Creates a dashboard info card with customizable styling options.

## SYNTAX
### Emoji (Default)
```powershell
New-HTMLInfoCard [-Title <string>] [-Number <string>] [-Subtitle <string>] [-Icon <string>] [-IconColor <string>] [-NumberColor <string>] [-TitleColor <string>] [-SubtitleColor <string>] [-ShadowColor <string>] [-ShadowDirection <string>] [-ShadowIntensity <string>] [-ShadowBlur <int>] [-ShadowSpread <int>] [-Style <string>] [-Alignment <string>] [-BackgroundColor <string>] [-BorderRadius <string>] [-AnchorName <string>] [<CommonParameters>]
```

### Dictionary
```powershell
New-HTMLInfoCard [-Title <string>] [-Number <string>] [-Subtitle <string>] [-IconColor <string>] [-NumberColor <string>] [-TitleColor <string>] [-SubtitleColor <string>] [-ShadowColor <string>] [-ShadowDirection <string>] [-ShadowIntensity <string>] [-ShadowBlur <int>] [-ShadowSpread <int>] [-Style <string>] [-Alignment <string>] [-BackgroundColor <string>] [-BorderRadius <string>] [-AnchorName <string>] [<CommonParameters>]
```

### FontAwesomeSolid
```powershell
New-HTMLInfoCard [-Title <string>] [-Number <string>] [-Subtitle <string>] [-IconSolid <string>] [-IconColor <string>] [-NumberColor <string>] [-TitleColor <string>] [-SubtitleColor <string>] [-ShadowColor <string>] [-ShadowDirection <string>] [-ShadowIntensity <string>] [-ShadowBlur <int>] [-ShadowSpread <int>] [-Style <string>] [-Alignment <string>] [-BackgroundColor <string>] [-BorderRadius <string>] [-AnchorName <string>] [<CommonParameters>]
```

### FontAwesomeRegular
```powershell
New-HTMLInfoCard [-Title <string>] [-Number <string>] [-Subtitle <string>] [-IconRegular <string>] [-IconColor <string>] [-NumberColor <string>] [-TitleColor <string>] [-SubtitleColor <string>] [-ShadowColor <string>] [-ShadowDirection <string>] [-ShadowIntensity <string>] [-ShadowBlur <int>] [-ShadowSpread <int>] [-Style <string>] [-Alignment <string>] [-BackgroundColor <string>] [-BorderRadius <string>] [-AnchorName <string>] [<CommonParameters>]
```

### FontAwesomeBrands
```powershell
New-HTMLInfoCard [-Title <string>] [-Number <string>] [-Subtitle <string>] [-IconBrands <string>] [-IconColor <string>] [-NumberColor <string>] [-TitleColor <string>] [-SubtitleColor <string>] [-ShadowColor <string>] [-ShadowDirection <string>] [-ShadowIntensity <string>] [-ShadowBlur <int>] [-ShadowSpread <int>] [-Style <string>] [-Alignment <string>] [-BackgroundColor <string>] [-BorderRadius <string>] [-AnchorName <string>] [<CommonParameters>]
```

## DESCRIPTION
The New-HTMLInfoCard function creates modern, responsive dashboard cards displaying key metrics or information.
It supports multiple styles including standard, compact, fixed layout (multiline-safe), and classic designs.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLInfoCard -Title "Total Users" -Number 47 -Subtitle "21.28% of users" -Icon "👥" -IconColor "#0078d4"
```

Creates a standard info card with a user icon and blue background.

### EXAMPLE 2
```powershell
New-HTMLInfoCard -Title "Sales Today" -Number 132 -Subtitle "12 waiting payments" -Style "Classic" -IconFromDictionary "Money" -IconColor "#21c87a"
```

Creates a classic style card using icon from dictionary.

### EXAMPLE 3
```powershell
New-HTMLInfoCard -Title "Analytics Report" -Number 156 -Subtitle "Reports generated" -IconSolid "chart-bar" -IconColor "#6f42c1"
```

Creates a card with FontAwesome solid icon.

### EXAMPLE 4
```powershell
New-HTMLInfoCard -Title "Revenue" -Number "$45,320" -Subtitle "This month" -Style "NoIcon" -Alignment "Center" -NumberColor "#21c87a"
```

Creates a centered card without an icon.

### EXAMPLE 5
```powershell
New-HTMLInfoCard -Title "Server Status" -Number "Online" -Subtitle "Last check: 2 min ago" -Icon "Server" -IconColor "#28a745" -TitleColor "#2c3e50" -SubtitleColor "#7f8c8d" -ShadowColor "rgba(40, 167, 69, 0.15)"
```

Creates a card with custom title, subtitle, and shadow colors.

### EXAMPLE 6
```powershell
New-HTMLInfoCard -Title "Alert" -Number "3" -Subtitle "Requires attention" -Icon "Warning" -IconColor "#dc3545" -ShadowDirection "Right" -ShadowColor "rgba(220, 53, 69, 0.2)"
```

Creates a card with a right-side red shadow for emphasis.

## PARAMETERS

### -Alignment
Text alignment within the card. Options:
- 'Left' (default): Left-aligned text
- 'Center': Center-aligned text
- 'Right': Right-aligned text

```yaml
Type: String
Parameter Sets: Emoji, Dictionary, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: Left, Center, Right

Required: False
Position: named
Default value: Left
Accept pipeline input: False
Accept wildcard characters: True
```

### -AnchorName
Optional anchor name for the card element.

```yaml
Type: String
Parameter Sets: Emoji, Dictionary, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BackgroundColor
Background color of the card. Defaults to white.

```yaml
Type: String
Parameter Sets: Emoji, Dictionary, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: #ffffff
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderRadius
Border radius for rounded corners. Defaults to 14px.

```yaml
Type: String
Parameter Sets: Emoji, Dictionary, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: 14px
Accept pipeline input: False
Accept wildcard characters: True
```

### -Icon
Icon to display on the card. Can be an emoji (like 👥, 🔒, 💪).

```yaml
Type: String
Parameter Sets: Emoji
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconBrands
FontAwesome brands icon name.

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
Background color for the icon. Supports color names, hex codes, or RGB values.

```yaml
Type: String
Parameter Sets: Emoji, Dictionary, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: #0078d4
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconRegular
FontAwesome regular icon name.

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

### -IconSolid
FontAwesome solid icon name.

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

### -Number
The primary numeric value or main statistic to display.

```yaml
Type: String
Parameter Sets: Emoji, Dictionary, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -NumberColor
Color for the main number/statistic. Defaults to blue (#0078d4).

```yaml
Type: String
Parameter Sets: Emoji, Dictionary, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: #0078d4
Accept pipeline input: False
Accept wildcard characters: True
```

### -ShadowBlur
{{ Fill ShadowBlur Description }}

```yaml
Type: Int32
Parameter Sets: Emoji, Dictionary, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: 8
Accept pipeline input: False
Accept wildcard characters: True
```

### -ShadowColor
Color for the card shadow. Defaults to light gray (rgba(60, 60, 60, 0.08)).

```yaml
Type: String
Parameter Sets: Emoji, Dictionary, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: rgba(60, 60, 60, 0.25)
Accept pipeline input: False
Accept wildcard characters: True
```

### -ShadowDirection
Direction/position of the card shadow. Options:
- 'Bottom' (default): Standard shadow below the card
- 'Top': Shadow above the card
- 'Left': Shadow to the left of the card
- 'Right': Shadow to the right of the card
- 'All': Shadow on all sides

```yaml
Type: String
Parameter Sets: Emoji, Dictionary, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: Bottom, Top, Left, Right, All

Required: False
Position: named
Default value: Bottom
Accept pipeline input: False
Accept wildcard characters: True
```

### -ShadowIntensity
{{ Fill ShadowIntensity Description }}

```yaml
Type: String
Parameter Sets: Emoji, Dictionary, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: None, Subtle, Normal, Bold, ExtraBold, Custom

Required: False
Position: named
Default value: Normal
Accept pipeline input: False
Accept wildcard characters: True
```

### -ShadowSpread
{{ Fill ShadowSpread Description }}

```yaml
Type: Int32
Parameter Sets: Emoji, Dictionary, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -Style
The visual style of the card. Options:
- 'Standard' (default): Regular cards with icons on the left
- 'Compact': Smaller cards with reduced padding
- 'Fixed': Multiline-safe layout where numbers stay aligned
- 'Classic': Traditional style with square colored icon backgrounds
- 'NoIcon': Cards without any icons

```yaml
Type: String
Parameter Sets: Emoji, Dictionary, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: Standard, Compact, Fixed, Classic, NoIcon

Required: False
Position: named
Default value: Standard
Accept pipeline input: False
Accept wildcard characters: True
```

### -Subtitle
Optional subtitle or description text below the number.

```yaml
Type: String
Parameter Sets: Emoji, Dictionary, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SubtitleColor
Color for the subtitle text. Defaults to medium gray (#666).

```yaml
Type: String
Parameter Sets: Emoji, Dictionary, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: #666
Accept pipeline input: False
Accept wildcard characters: True
```

### -Title
The main title/label text for the card.

```yaml
Type: String
Parameter Sets: Emoji, Dictionary, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: True
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleColor
Color for the title text. Defaults to dark gray (#222).

```yaml
Type: String
Parameter Sets: Emoji, Dictionary, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: #222
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

