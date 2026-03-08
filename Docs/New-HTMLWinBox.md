---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLWinBox
## SYNOPSIS
Creates a customizable HTML window box with various options for styling and functionality.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLWinBox [[-HTML] <scriptblock>] [[-Title] <string>] [[-BackgroundColor] <string>] [[-Index] <int>] [[-Border] <string>] [[-Height] <string>] [[-Width] <string>] [[-X] <string>] [[-Y] <string>] [[-Top] <string>] [[-Right] <string>] [[-Bottom] <string>] [[-Left] <string>] [[-Url] <uri>] [[-Theme] <string>] [-Modal] [-Maximize] [-NoAnimation] [-NoShadow] [-NoHeader] [-NoMinmizeIcon] [-NoMaximizeIcon] [-NoFullScreenIcon] [-NoCloseIcon] [-NoResizeCapability] [-NoMoveCapability] [<CommonParameters>]
```

## DESCRIPTION
This function allows you to create an HTML window box with customizable features such as title, background color, initial position, size, URL content, modal display, theme, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
$Data = Get-Process | Select-Object -First 3
```

New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example-WinBox01.html" {
    New-HTMLWinBox -Title 'This is a test Window' -BackgroundColor Red {
        New-HTMLText -Text 'This is a text within modal dialog'
        New-HTMLTable -DataTable $Data
    } -Width 50% -Height 50% -X center -Y center
} -Online -ShowHTML

## PARAMETERS

### -BackgroundColor
Specifies the background color of the window box title.

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

### -Border
Set the border width of the window (supports all css units, like px, %, em, rem, vh, vmax).

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

### -Bottom
Set or limit the viewport of the window's available area (supports units "px" and "%").

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

### -Height
Set the initial width/height of the window (supports units "px" and "%").

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

### -HTML
Specifies the HTML content to be displayed within the window box.

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

### -Index
Set the initial z-index of the window to this value (could be increased automatically when unfocused/focused).

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Left
Set or limit the viewport of the window's available area (supports units "px" and "%").

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

### -Maximize
Automatically maximizes the window box when created.

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

### -Modal
Indicates whether the window box should be displayed as a modal window.

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

### -NoAnimation
Disables transition animations for the window box.

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

### -NoCloseIcon
Hides the close icon in the window box.

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

### -NoFullScreenIcon
Hides the fullscreen icon in the window box.

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

### -NoHeader
Hides the header of the window box, including the title and toolbar.

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

### -NoMaximizeIcon
Hides the maximize icon in the window box.

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

### -NoMinmizeIcon
Hides the minimize icon in the window box.

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

### -NoMoveCapability
Disables the moving capability of the window box.

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

### -NoResizeCapability
Disables the resizing capability of the window box.

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

### -NoShadow
Disables the drop shadow effect for the window box.

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

### -Right
Set or limit the viewport of the window's available area (supports units "px" and "%").

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

### -Theme
Specifies the theme of the window box.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: modern, white

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Title
Specifies the title of the window box.

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

### -Top
Set or limit the viewport of the window's available area (supports units "px" and "%").

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

### -Url
Specifies the URL content to be loaded inside the window box via iframe.

```yaml
Type: Uri
Parameter Sets: __AllParameterSets
Aliases: Uri
Possible values: 

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Width
Set the initial width/height of the window (supports units "px" and "%").

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -X
Set the initial position of the window (supports: "right" for x-axis, "bottom" for y-axis, "center" for both, units "px" and "%" for both).

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Y
Set the initial position of the window (supports: "right" for x-axis, "bottom" for y-axis, "center" for both, units "px" and "%" for both).

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 8
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

