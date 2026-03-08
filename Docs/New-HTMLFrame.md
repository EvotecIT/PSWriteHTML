---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLFrame
## SYNOPSIS
Allows to inline other HTML files into the current HTML file.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLFrame [[-Id] <string>] [[-Name] <string>] [[-SourcePath] <string>] [[-Scrolling] <string>] [[-Height] <Object>] [[-FrameBorder] <Object>] [-UseiFrameResizer] [-EnableLogging] [<CommonParameters>]
```

## DESCRIPTION
Allows to inline other HTML files into the current HTML file. This can be useful if we want to display content from another file.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTML {
    New-HTMLSection {
        New-HTMLFrame -SourcePath "$PSSCriptRoot\GPOZaurr.html" -Scrolling Auto
    } -HeaderText 'Test'
    New-HTMLSection {
        New-HTMLFrame -SourcePath "$PSSCriptRoot\GPOZaurr.html" -Scrolling Auto -Height 1500px
    } -HeaderText 'Test'
    New-HTMLSection {
        New-HTMLFrame -SourcePath "C:\Support\GitHub\PSWriteHTML\Examples\Example-Maps\Example-Maps.html"
    } -HeaderText 'Test' -Height 100vh
} -Online -TitleText 'Test Inline' -ShowHTML -FilePath "$PSScriptRoot\Example-InlineHTML01.html" -AddComment
```

## PARAMETERS

### -EnableLogging
Enable logging to Console for debugging purposes when using iFrameResizer (requires UseiFrameResizer).

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

### -FrameBorder
Set the frameborder attribute of the <iframe> element. This attribute specifies whether the frame should have a border. The default value is 0.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -Height
Set the height of the iFrame to static value. This should be used when not using iFrameResizer.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Id
ID of the HTML element. By default it's auto-generated.

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

### -Name
Name of the HTML element. By default it's empty.

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

### -Scrolling
The HTML <iframe> scrolling Attribute is used to specify that whether the scrollbar will be displayed or not in the <Iframe> Element. Basically the scrollbar is used when the content is large than the Iframe Element.
Available options are:
- auto: It has a default value. The scrollbar appears when needed.
- yes: This value shows the scrollbar in the Iframe Element.
- no: This value does not show the scrollbar in the Iframe Element.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: No, Yes, Auto

Required: False
Position: 3
Default value: auto
Accept pipeline input: False
Accept wildcard characters: True
```

### -SourcePath
Path to a file with HTML file to display within iFrame

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

### -UseiFrameResizer
Forces HTML inline feature to use iFrameResizer instead of native functionality. For fully functional feature it requires modifying the source HTML file.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

