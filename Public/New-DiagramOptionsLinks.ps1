function New-DiagramOptionsLinks {
    <#
    .SYNOPSIS
    Creates a new set of options for diagram edges in a diagram.

    .DESCRIPTION
    This function creates a new set of options for diagram edges in a diagram. It allows customization of various properties such as arrows, colors, fonts, and constraints for diagram edges.

    .PARAMETER ArrowsToEnabled
    Specifies whether arrows pointing to the edge are enabled.

    .PARAMETER ArrowsToScaleFactor
    Specifies the scale factor for arrows pointing to the edge.

    .PARAMETER ArrowsToType
    Specifies the type of arrows pointing to the edge. Valid values are 'arrow', 'bar', 'circle'.

    .PARAMETER ArrowsMiddleEnabled
    Specifies whether arrows in the middle of the edge are enabled.

    .PARAMETER ArrowsMiddleScaleFactor
    Specifies the scale factor for arrows in the middle of the edge.

    .PARAMETER ArrowsMiddleType
    Specifies the type of arrows in the middle of the edge. Valid values are 'arrow', 'bar', 'circle'.

    .PARAMETER ArrowsFromEnabled
    Specifies whether arrows pointing from the edge are enabled.

    .PARAMETER ArrowsFromScaleFactor
    Specifies the scale factor for arrows pointing from the edge.

    .PARAMETER ArrowsFromType
    Specifies the type of arrows pointing from the edge. Valid values are 'arrow', 'bar', 'circle'.

    .PARAMETER ArrowStrikethrough
    Specifies whether the arrow should have a strikethrough effect.

    .PARAMETER Chosen
    Specifies whether the edge is chosen.

    .PARAMETER Color
    Specifies the color of the edge.

    .PARAMETER ColorHighlight
    Specifies the color of the edge when highlighted.

    .PARAMETER ColorHover
    Specifies the color of the edge when hovered over.

    .PARAMETER ColorInherit
    Specifies how the color of the edge should inherit. Valid values are 'true', 'false', 'from', 'to', 'both'.

    .PARAMETER ColorOpacity
    Specifies the opacity of the color of the edge. Range between 0 and 1.

    .PARAMETER Dashes
    Specifies whether the edge should be dashed.

    .PARAMETER Length
    Specifies the length of the edge.

    .PARAMETER FontColor
    Specifies the color of the font on the edge.

    .PARAMETER FontSize
    Specifies the font size in pixels.

    .PARAMETER FontName
    Specifies the font name for the edge.

    .PARAMETER FontBackground
    Specifies the background color of the font on the edge.

    .PARAMETER FontStrokeWidth
    Specifies the stroke width of the font in pixels.

    .PARAMETER FontStrokeColor
    Specifies the stroke color of the font on the edge.

    .PARAMETER FontAlign
    Specifies the alignment of the font. Valid values are 'center', 'left'.

    .PARAMETER FontMulti
    Specifies whether the font supports multiline. Valid values are 'false', 'true', 'markdown', 'html'.

    .PARAMETER FontVAdjust
    Specifies the vertical adjustment of the font.

    .PARAMETER WidthConstraint
    Specifies the width constraint of the edge.

    .EXAMPLE
    New-DiagramOptionsLinks -ArrowsToEnabled $true -ArrowsToScaleFactor 2 -ArrowsToType 'arrow' -ArrowsMiddleEnabled $false -ArrowsMiddleScaleFactor 1 -ArrowsMiddleType 'bar' -ArrowsFromEnabled $true -ArrowsFromScaleFactor 2 -ArrowsFromType 'circle' -ArrowStrikethrough $false -Chosen $true -Color 'blue' -ColorHighlight 'yellow' -ColorHover 'green' -ColorInherit 'from' -ColorOpacity 0.8 -Dashes $false -Length '100px' -FontColor 'black' -FontSize 12 -FontName 'Arial' -FontBackground 'white' -FontStrokeWidth 1 -FontStrokeColor 'gray' -FontAlign 'center' -FontMulti 'true' -FontVAdjust 0 -WidthConstraint 150

    Description
    -----------
    Creates a new set of diagram edge options with specific configurations.
    #>
    [alias('DiagramOptionsEdges', 'New-DiagramOptionsEdges', 'DiagramOptionsLinks')]
    [CmdletBinding()]
    param(
        [nullable[bool]] $ArrowsToEnabled,
        [nullable[int]] $ArrowsToScaleFactor,
        [ValidateSet('arrow', 'bar', 'circle')][string] $ArrowsToType,
        [nullable[bool]] $ArrowsMiddleEnabled,
        [nullable[int]] $ArrowsMiddleScaleFactor,
        [ValidateSet('arrow', 'bar', 'circle')][string] $ArrowsMiddleType,
        [nullable[bool]] $ArrowsFromEnabled,
        [nullable[int]] $ArrowsFromScaleFactor,
        [ValidateSet('arrow', 'bar', 'circle')][string] $ArrowsFromType,
        [nullable[bool]] $ArrowStrikethrough,
        [nullable[bool]] $Chosen,
        [string] $Color,
        [string] $ColorHighlight,
        [string] $ColorHover,
        [ValidateSet('true', 'false', 'from', 'to', 'both')][string]$ColorInherit,
        [nullable[double]] $ColorOpacity, # range between 0 and 1
        [nullable[bool]]  $Dashes,
        [string] $Length,
        [string] $FontColor,
        [nullable[int]] $FontSize, #// px
        [string] $FontName,
        [string] $FontBackground,
        [nullable[int]] $FontStrokeWidth, #// px
        [string] $FontStrokeColor,
        [ValidateSet('center', 'left')][string] $FontAlign,
        [ValidateSet('false', 'true', 'markdown', 'html')][string]$FontMulti,
        [nullable[int]] $FontVAdjust,
        [nullable[int]] $WidthConstraint
    )
    $Object = [PSCustomObject] @{
        Type     = 'DiagramOptionsEdges'
        Settings = @{
            edges = [ordered] @{
                #length             = $Length
                arrows             = [ordered]@{
                    to     = [ordered]@{
                        enabled     = $ArrowsToEnabled
                        scaleFactor = $ArrowsToScaleFactor
                        type        = $ArrowsToType
                    }
                    middle = [ordered]@{
                        enabled     = $ArrowsMiddleEnabled
                        scaleFactor = $ArrowsMiddleScaleFactor
                        type        = $ArrowsMiddleType
                    }
                    from   = [ordered]@{
                        enabled     = $ArrowsFromEnabled
                        scaleFactor = $ArrowsFromScaleFactor
                        type        = $ArrowsFromType
                    }
                }
                arrowStrikethrough = $ArrowStrikethrough
                chosen             = $Chosen
                color              = [ordered]@{
                    color     = ConvertFrom-Color -Color $Color
                    highlight = ConvertFrom-Color -Color $ColorHighlight
                    hover     = ConvertFrom-Color -Color $ColorHover
                    inherit   = $ColorInherit
                    opacity   = $ColorOpacity
                }
                font               = [ordered]@{
                    color       = ConvertFrom-Color -Color $FontColor
                    size        = $FontSize
                    face        = $FontName
                    background  = ConvertFrom-Color -Color $FontBackground
                    strokeWidth = $FontStrokeWidth
                    strokeColor = ConvertFrom-Color -Color $FontStrokeColor
                    align       = $FontAlign
                    multi       = $FontMulti
                    vadjust     = $FontVAdjust
                }
                dashes             = $Dashes
                widthConstraint    = $WidthConstraint
            }
        }
    }
    Remove-EmptyValue -Hashtable $Object.Settings -Recursive -Rerun 2
    $Object
}
Register-ArgumentCompleter -CommandName New-DiagramOptionsLinks -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramOptionsLinks -ParameterName ColorHighlight -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramOptionsLinks -ParameterName ColorHover -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramOptionsLinks -ParameterName FontColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramOptionsLinks -ParameterName FontBackground -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramOptionsLinks -ParameterName FontStrokeColor -ScriptBlock $Script:ScriptBlockColors
<#
// these are all options in full.
var options = {
  edges:{
    arrows: {
      to:     {enabled: false, scaleFactor:1, type:'arrow'},
      middle: {enabled: false, scaleFactor:1, type:'arrow'},
      from:   {enabled: false, scaleFactor:1, type:'arrow'}
    },
    arrowStrikethrough: true,
    chosen: true,
    color: {
      color:'#848484',
      highlight:'#848484',
      hover: '#848484',
      inherit: 'from',
      opacity:1.0
    },
    dashes: false,
    font: {
      color: '#343434',
      size: 14, // px
      face: 'arial',
      background: 'none',
      strokeWidth: 2, // px
      strokeColor: '#ffffff',
      align: 'horizontal',
      multi: false,
      vadjust: 0,
      bold: {
        color: '#343434',
        size: 14, // px
        face: 'arial',
        vadjust: 0,
        mod: 'bold'
      },
      ital: {
        color: '#343434',
        size: 14, // px
        face: 'arial',
        vadjust: 0,
        mod: 'italic',
      },
      boldital: {
        color: '#343434',
        size: 14, // px
        face: 'arial',
        vadjust: 0,
        mod: 'bold italic'
      },
      mono: {
        color: '#343434',
        size: 15, // px
        face: 'courier new',
        vadjust: 2,
        mod: ''
      }
    },
    hidden: false,
    hoverWidth: 1.5,
    label: undefined,
    labelHighlightBold: true,
    length: undefined,
    physics: true,
    scaling:{
      min: 1,
      max: 15,
      label: {
        enabled: true,
        min: 14,
        max: 30,
        maxVisible: 30,
        drawThreshold: 5
      },
      customScalingFunction: function (min,max,total,value) {
        if (max === min) {
          return 0.5;
        }
        else {
          var scale = 1 / (max - min);
          return Math.max(0,(value - min)*scale);
        }
      }
    },
    selectionWidth: 1,
    selfReferenceSize:20,
    shadow:{
      enabled: false,
      color: 'rgba(0,0,0,0.5)',
      size:10,
      x:5,
      y:5
    },
    smooth: {
      enabled: true,
      type: "dynamic",
      roundness: 0.5
    },
    title:undefined,
    value: undefined,
    width: 1,
    widthConstraint: false
  }
}

network.setOptions(options);
#>