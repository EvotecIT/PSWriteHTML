---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-DiagramOptionsInteraction
## SYNOPSIS
Creates a new diagram options interaction object with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-DiagramOptionsInteraction [[-DragNodes] <bool>] [[-DragView] <bool>] [[-HideEdgesOnDrag] <bool>] [[-HideEdgesOnZoom] <bool>] [[-HideNodesOnDrag] <bool>] [[-Hover] <bool>] [[-HoverConnectedEdges] <bool>] [[-KeyboardEnabled] <bool>] [[-KeyboardSpeedX] <int>] [[-KeyboardSpeedY] <int>] [[-KeyboardSpeedZoom] <decimal>] [[-KeyboardBindToWindow] <bool>] [[-Multiselect] <bool>] [[-NavigationButtons] <bool>] [[-Selectable] <bool>] [[-SelectConnectedEdges] <bool>] [[-TooltipDelay] <int>] [[-ZoomView] <bool>] [<CommonParameters>]
```

## DESCRIPTION
This function defines a diagram options interaction object with various interactive features such as dragging nodes, dragging view, hiding edges on drag, hiding edges on zoom, hiding nodes on drag, hover effects, keyboard navigation, multiselect, navigation buttons, and selection options.

## EXAMPLES

### EXAMPLE 1
```powershell
New-DiagramOptionsInteraction -DragNodes -DragView -HideEdgesOnDrag -HideNodesOnDrag -Hover -KeyboardEnabled -Multiselect -Selectable -SelectConnectedEdges
Creates a new diagram options interaction object with basic interactive features enabled.
```

### EXAMPLE 2
```powershell
New-DiagramOptionsInteraction -DragNodes -DragView -HideEdgesOnDrag -HideNodesOnDrag -Hover -KeyboardEnabled -Multiselect -Selectable -SelectConnectedEdges -NavigationButtons
Creates a new diagram options interaction object with navigation buttons added.
```

## PARAMETERS

### -DragNodes
Specifies whether dragging nodes is enabled.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DragView
Specifies whether dragging the view is enabled.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HideEdgesOnDrag
Specifies whether edges are hidden when dragging.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HideEdgesOnZoom
Specifies whether edges are hidden when zooming.

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

### -HideNodesOnDrag
Specifies whether nodes are hidden when dragging.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Hover
Specifies whether hover effects are enabled.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HoverConnectedEdges
Specifies whether connected edges are affected by hover.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -KeyboardBindToWindow
Specifies whether keyboard events are bound to the window.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -KeyboardEnabled
Specifies whether keyboard navigation is enabled.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -KeyboardSpeedX
Specifies the speed of movement in the X direction using the keyboard.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -KeyboardSpeedY
Specifies the speed of movement in the Y direction using the keyboard.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -KeyboardSpeedZoom
Specifies the speed of zooming using the keyboard.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Multiselect
Specifies whether multiple selections are allowed.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -NavigationButtons
Specifies whether navigation buttons are displayed.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Selectable
Specifies whether nodes and edges are selectable.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SelectConnectedEdges
Specifies whether connected edges are selected along with nodes.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TooltipDelay
{{ Fill TooltipDelay Description }}

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ZoomView
{{ Fill ZoomView Description }}

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 17
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

