---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLOrgChart
## SYNOPSIS
Creates an HTML organizational chart based on the provided nodes and options.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLOrgChart [[-ChartNodes] <scriptblock>] [[-Direction] <string>] [[-VisileLevel] <int>] [[-VerticalLevel] <int>] [[-NodeTitle] <string>] [[-ZoomInLimit] <double>] [[-ZoomOutLimit] <double>] [[-ExportFileName] <string>] [[-ExportExtension] <Object>] [[-ChartID] <string>] [-ToggleSiblings] [-Pan] [-Zoom] [-Draggable] [-AllowExport] [<CommonParameters>]
```

## DESCRIPTION
This function generates an interactive HTML organizational chart based on the specified nodes and customization options. Users can define the layout direction, initial visibility level, vertical alignment, and various interactive features like panning, zooming, dragging, and exporting.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTML {
    New-HTMLOrgChart {
        New-OrgChartNode -Name 'CEO' -Title 'Chief Executive Officer' {
            New-OrgChartNode -Name 'Manager' -Title 'Manager'
            New-OrgChartNode -Name 'Supervisor' -Title 'Supervisor'
            New-OrgChartNode -Name 'Employee' -Title 'Employee' {
                New-OrgChartNode -Name 'Assistant' -Title 'Assistant'
            }
        }
    } -AllowExport -ExportExtension pdf -Draggable
} -FilePath $PSScriptRoot\OrgChart.html -ShowHTML -Online
```

## PARAMETERS

### -AllowExport
Enables the export button for the org chart.

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

### -ChartID
Specifies a custom ID for the org chart. If not provided, a random ID will be generated.

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

### -ChartNodes
Specifies the nodes to be displayed on the chart. This parameter should contain a script block defining the organizational structure.

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

### -Direction
Specifies the layout direction of the chart. Available values are "TopToBottom" (default), "BottomToTop", "LeftToRight", and "RightToLeft".

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: TopToBottom, BottomToTop, LeftToRight, RightToLeft

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Draggable
Enables dragging and dropping nodes within the org chart. Note: This feature is not supported on Internet Explorer.

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

### -ExportExtension
Specifies the format for exporting the org chart. Available values are "png" and "pdf".

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: png, pdf

Required: False
Position: 8
Default value: png
Accept pipeline input: False
Accept wildcard characters: True
```

### -ExportFileName
Specifies the filename when exporting the org chart as an image.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: PSWriteHTML-OrgChart
Accept pipeline input: False
Accept wildcard characters: True
```

### -NodeTitle
Sets the text content of the title section of each org chart node.

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

### -Pan
Enables panning the org chart by mouse drag and drop.

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

### -ToggleSiblings
Enables the ability to show/hide left and right sibling nodes by clicking arrows.

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

### -VerticalLevel
Aligns the nodes vertically starting from the specified level.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -VisileLevel
Sets the initial visibility level of the org chart.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -Zoom
Enables zooming in and out of the org chart using the mouse wheel.

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

### -ZoomInLimit
Sets the maximum zoom-in limit.

```yaml
Type: Double
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -ZoomOutLimit
Sets the maximum zoom-out limit.

```yaml
Type: Double
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
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

