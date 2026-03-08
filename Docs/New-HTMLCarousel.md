---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLCarousel
## SYNOPSIS
Creates a new HTML carousel element with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLCarousel [[-Slide] <scriptblock>] [[-Mode] <string>] [[-Align] <string>] [[-PerView] <Object>] [[-Height] <string>] [[-Margin] <string>] [[-Speed] <int>] [[-MoveBy] <int>] [[-StartAt] <int>] [[-AutoPlayEvery] <int>] [[-AutoPlaySyncID] <string>] [[-ArrowTemplate] <string[]>] [[-PaginationTemplate] <string>] [[-CountTemplate] <string>] [-Loop] [-Pagination] [-MoveOnClick] [-AutoPlay] [-AutoPlayRewind] [-AutoPlayPauseOnFocus] [-AutoPlayPauseOnHover] [-DisableArrows] [-Count] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML carousel element with the specified options such as slide content, mode (Horizontal/Vertical), alignment, number of slides per view, height, margin, looping, pagination, speed, starting slide, autoplay settings, arrow visibility, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLCarousel -Slide { "Slide Content Here" } -Mode Horizontal -Align center -PerView 3 -Height adaptive -Margin '10px' -Loop -Pagination -Speed 500 -MoveBy 1 -StartAt 0 -MoveOnClick -AutoPlay -AutoPlayEvery 3000 -AutoPlayRewind -AutoPlayPauseOnFocus -AutoPlayPauseOnHover -AutoPlaySyncID 'carousel1' -DisableArrows -ArrowTemplate @('left-arrow', 'right-arrow') -PaginationTemplate 'index' -Count -CountTemplate 'Slide {index} of {total}'
```

Creates a new HTML carousel with the specified options.

## PARAMETERS

### -Align
Specifies the alignment of the carousel slides (center/start/end/justify).

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: center, start, end, justify

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ArrowTemplate
Specifies custom arrow templates.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -AutoPlay
Indicates whether autoplay is enabled.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: Stream
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -AutoPlayEvery
Specifies the interval for autoplay.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: StreamEvery
Possible values: 

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -AutoPlayPauseOnFocus
Indicates whether autoplay should pause on focus.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: StreamPauseOnFocus
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -AutoPlayPauseOnHover
Indicates whether autoplay should pause on hover.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: StreamPauseOnHover
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -AutoPlayRewind
Indicates whether autoplay should rewind.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: StreamRewind
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -AutoPlaySyncID
Specifies the ID to sync autoplay with.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: StreamSyncID
Possible values: 

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Count
Indicates whether slide count should be displayed.

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

### -CountTemplate
Specifies the template for displaying slide count.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DisableArrows
Indicates whether the arrow navigation should be disabled.

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

### -Height
Specifies the height of the carousel (adaptive/equal/auto).

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: adaptive, equal, auto

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Loop
Indicates whether the carousel should loop.

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

### -Margin
Specifies the margin between slides.

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

### -Mode
Specifies the mode of the carousel (Horizontal/Vertical). Default is Horizontal.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: Horizontal, Vertical

Required: False
Position: 1
Default value: Horizontal
Accept pipeline input: False
Accept wildcard characters: True
```

### -MoveBy
Specifies the number of slides to move at a time.

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

### -MoveOnClick
Indicates whether the carousel should move to the next slide on click.

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

### -Pagination
Indicates whether pagination should be enabled.

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

### -PaginationTemplate
Specifies the pagination template ('default'/'index'/'custom').

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

### -PerView
Specifies the number of slides per view.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Slide
Specifies the content of the carousel slide as a script block.

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

### -Speed
Specifies the speed of the carousel animation.

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

### -StartAt
Specifies the index of the slide to start at.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

