---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartToolbar
## SYNOPSIS
Creates a new chart toolbar object with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartToolbar [[-AutoSelected] <string>] [-Download] [-Selection] [-Zoom] [-ZoomIn] [-ZoomOut] [-Pan] [-Reset] [<CommonParameters>]
```

## DESCRIPTION
This function defines a chart toolbar object with various tools such as download, selection, zoom, zoom in, zoom out, pan, and reset. It allows customization of the toolbar appearance and behavior.

## EXAMPLES

### EXAMPLE 1
```powershell
New-ChartToolbar -Download -Selection -Zoom -ZoomIn -ZoomOut -Pan -Reset -AutoSelected 'zoom'
Creates a new chart toolbar object with all tools enabled and the default tool set to zoom.
```

### EXAMPLE 2
```powershell
New-ChartToolbar -Download -Zoom -ZoomOut -Pan -AutoSelected 'pan'
Creates a new chart toolbar object with download, zoom, zoom out, and pan tools enabled, and the default tool set to pan.
```

## PARAMETERS

### -AutoSelected
Specifies the default tool to be auto-selected when the toolbar is loaded. Valid values are 'zoom', 'selection', or 'pan'. Default is 'zoom'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: zoom, selection, pan

Required: False
Position: 0
Default value: zoom
Accept pipeline input: False
Accept wildcard characters: True
```

### -Download
Switch parameter to enable the download tool in the toolbar.

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

### -Pan
Switch parameter to enable the pan tool in the toolbar.

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

### -Reset
Switch parameter to enable the reset tool in the toolbar.

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

### -Selection
Switch parameter to enable the selection tool in the toolbar.

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

### -Zoom
Switch parameter to enable the zoom tool in the toolbar.

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

### -ZoomIn
Switch parameter to enable the zoom in tool in the toolbar.

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

### -ZoomOut
Switch parameter to enable the zoom out tool in the toolbar.

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

