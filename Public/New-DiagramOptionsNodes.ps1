function New-DiagramOptionsNodes {
    <#
    .SYNOPSIS
    Creates a custom object representing options for diagram nodes.

    .DESCRIPTION
    This function creates a custom object with various settings for diagram nodes, such as border width, colors, font styles, shape, constraints, and margins.

    .PARAMETER BorderWidth
    Specifies the width of the border around the node.

    .PARAMETER BorderWidthSelected
    Specifies the width of the border around the node when selected.

    .PARAMETER BrokenImage
    Specifies the image to display if the node image is broken.

    .PARAMETER Chosen
    Indicates whether the node is chosen.

    .PARAMETER ColorBorder
    Specifies the color of the node border.

    .PARAMETER ColorBackground
    Specifies the background color of the node.

    .PARAMETER ColorHighlightBorder
    Specifies the color of the node border when highlighted.

    .PARAMETER ColorHighlightBackground
    Specifies the background color of the node when highlighted.

    .PARAMETER ColorHoverBorder
    Specifies the color of the node border when hovered over.

    .PARAMETER ColorHoverBackground
    Specifies the background color of the node when hovered over.

    .PARAMETER FixedX
    Indicates whether the node's X position is fixed.

    .PARAMETER FixedY
    Indicates whether the node's Y position is fixed.

    .PARAMETER FontColor
    Specifies the color of the node's font.

    .PARAMETER FontSize
    Specifies the font size of the node text in pixels.

    .PARAMETER FontName
    Specifies the font family of the node text.

    .PARAMETER FontBackground
    Specifies the background color of the node's font.

    .PARAMETER FontStrokeWidth
    Specifies the stroke width of the node's font.

    .PARAMETER FontStrokeColor
    Specifies the stroke color of the node's font.

    .PARAMETER FontAlign
    Specifies the alignment of the node's text (center or left).

    .PARAMETER FontMulti
    Specifies the multi-line mode for the node's text (false, true, markdown, html).

    .PARAMETER FontVAdjust
    Specifies the vertical adjustment of the node's text.

    .PARAMETER Size
    Specifies the size of the node.

    .PARAMETER Shape
    Specifies the shape of the node (circle, dot, diamond, ellipse, database, box, square, triangle, triangleDown, text, star, hexagon).

    .PARAMETER HeightConstraintMinimum
    Specifies the minimum height constraint for the node.

    .PARAMETER HeightConstraintVAlign
    Specifies the vertical alignment of the node within its height constraint (top, middle, bottom).

    .PARAMETER WidthConstraintMinimum
    Specifies the minimum width constraint for the node.

    .PARAMETER WidthConstraintMaximum
    Specifies the maximum width constraint for the node.

    .PARAMETER Margin
    Specifies the margin around the node on all sides.

    .PARAMETER MarginTop
    Specifies the top margin around the node.

    .PARAMETER MarginRight
    Specifies the right margin around the node.

    .PARAMETER MarginBottom
    Specifies the bottom margin around the node.

    .PARAMETER MarginLeft
    Specifies the left margin around the node.

    .EXAMPLE
    New-DiagramOptionsNodes -BorderWidth 1 -BorderWidthSelected 2 -ColorBorder '#2B7CE9' -ColorBackground '#97C2FC' -Shape 'circle' -Size 50
    Creates a new diagram node with specified border widths, colors, shape, and size.

    .EXAMPLE
    New-DiagramOptionsNodes -FontColor '#000000' -FontSize 12 -FontName 'Arial' -Shape 'square' -Size 30
    Creates a new diagram node with specified font color, size, font family, shape, and size.

    #>
    [alias('DiagramOptionsNodes')]
    [CmdletBinding()]
    param(
        [nullable[int]] $BorderWidth,
        [nullable[int]] $BorderWidthSelected,
        [string] $BrokenImage,
        [nullable[bool]] $Chosen,
        [string] $ColorBorder,
        [string] $ColorBackground,
        [string] $ColorHighlightBorder,
        [string] $ColorHighlightBackground,
        [string] $ColorHoverBorder,
        [string] $ColorHoverBackground,
        [nullable[bool]] $FixedX,
        [nullable[bool]] $FixedY,
        [string] $FontColor,
        [nullable[int]] $FontSize, #// px
        [string] $FontName,
        [string] $FontBackground,
        [nullable[int]] $FontStrokeWidth, #// px
        [string] $FontStrokeColor,
        [ValidateSet('center', 'left')][string] $FontAlign,
        [ValidateSet('false', 'true', 'markdown', 'html')][string]$FontMulti,
        [nullable[int]] $FontVAdjust,
        [nullable[int]] $Size,
        [parameter(ParameterSetName = "Shape")][string][ValidateSet(
            'circle', 'dot', 'diamond', 'ellipse', 'database', 'box', 'square', 'triangle', 'triangleDown', 'text', 'star', 'hexagon')] $Shape,
        [nullable[int]] $HeightConstraintMinimum,
        [ValidateSet('top', 'middle', 'bottom')][string] $HeightConstraintVAlign,
        [nullable[int]] $WidthConstraintMinimum,
        [nullable[int]] $WidthConstraintMaximum,
        [nullable[int]] $Margin,
        [nullable[int]] $MarginTop,
        [nullable[int]] $MarginRight,
        [nullable[int]] $MarginBottom,
        [nullable[int]] $MarginLeft
    )
    $Object = [PSCustomObject] @{
        Type     = 'DiagramOptionsNodes'
        Settings = @{
            nodes = [ordered] @{
                borderWidth         = $BorderWidth
                borderWidthSelected = $BorderWidthSelected
                brokenImage         = $BrokenImage
                chosen              = $Chosen
                color               = [ordered]@{
                    border     = ConvertFrom-Color -Color $ColorBorder
                    background = ConvertFrom-Color -Color $ColorBackground
                    highlight  = [ordered]@{
                        border     = ConvertFrom-Color -Color $ColorHighlightBorder
                        background = ConvertFrom-Color -Color $ColorHighlightBackground
                    }
                    hover      = [ordered]@{
                        border     = ConvertFrom-Color -Color $ColorHoverBorder
                        background = ConvertFrom-Color -Color $ColorHoverBackground
                    }
                }
                fixed               = [ordered]@{
                    x = $FixedX
                    y = $FixedY
                }
                font                = [ordered]@{
                    color       = ConvertFrom-Color -Color $FontColor
                    size        = $FontSize #// px
                    face        = $FontName
                    background  = ConvertFrom-Color -Color $FontBackground
                    strokeWidth = $FontStrokeWidth #// px
                    strokeColor = ConvertFrom-Color -Color $FontStrokeColor
                    align       = $FontAlign
                    multi       = $FontMulti
                    vadjust     = $FontVAdjust
                }
                heightConstraint    = @{
                    minimum = $HeightConstraintMinimum
                    valign  = $HeightConstraintVAlign
                }
                size                = $Size
                shape               = $Shape
                widthConstraint     = @{
                    minimum = $WidthConstraintMinimum
                    maximum = $WidthConstraintMaximum
                }
            }
        }
    }

    if ($Margin) {
        $Object.Settings.nodes.margin = $Margin
    } else {
        $Object.Settings.nodes.margin = @{
            top    = $MarginTop
            right  = $MarginRight
            bottom = $MarginBottom
            left   = $MarginLeft
        }
    }


    Remove-EmptyValue -Hashtable $Object.Settings -Recursive -Rerun 2
    $Object
}

Register-ArgumentCompleter -CommandName New-DiagramOptionsNodes -ParameterName ColorBorder -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramOptionsNodes -ParameterName ColorBackground -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramOptionsNodes -ParameterName ColorHighlightBorder -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramOptionsNodes -ParameterName ColorHighlightBackground -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramOptionsNodes -ParameterName ColorHoverBorder -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramOptionsNodes -ParameterName ColorHoverBackground -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramOptionsNodes -ParameterName FontColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramOptionsNodes -ParameterName FontBackground -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramOptionsNodes -ParameterName FontStrokeColor -ScriptBlock $Script:ScriptBlockColors

<#
// these are all options in full.
var options = {
  nodes:{
    borderWidth: 1,
    borderWidthSelected: 2,
    brokenImage:undefined,
    chosen: true,
    color: {
      border: '#2B7CE9',
      background: '#97C2FC',
      highlight: {
        border: '#2B7CE9',
        background: '#D2E5FF'
      },
      hover: {
        border: '#2B7CE9',
        background: '#D2E5FF'
      }
    },
    fixed: {
      x:false,
      y:false
    },
    font: {
      color: '#343434',
      size: 14, // px
      face: 'arial',
      background: 'none',
      strokeWidth: 0, // px
      strokeColor: '#ffffff',
      align: 'center',
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
    group: undefined,
    heightConstraint: false,
    hidden: false,
    icon: {
      face: 'FontAwesome',
      code: undefined,
      size: 50,  //50,
      color:'#2B7CE9'
    },
    image: undefined,
    imagePadding: {
      left: 0,
      top: 0,
      bottom: 0,
      right: 0
    },
    label: undefined,
    labelHighlightBold: true,
    level: undefined,
    mass: 1,
    physics: true,
    scaling: {
      min: 10,
      max: 30,
      label: {
        enabled: false,
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
          let scale = 1 / (max - min);
          return Math.max(0,(value - min)*scale);
        }
      }
    },
    shadow:{
      enabled: false,
      color: 'rgba(0,0,0,0.5)',
      size:10,
      x:5,
      y:5
    },
    shape: 'ellipse',
    shapeProperties: {
      borderDashes: false, // only for borders
      borderRadius: 6,     // only for box shape
      interpolation: false,  // only for image and circularImage shapes
      useImageSize: false,  // only for image and circularImage shapes
      useBorderWithImage: false  // only for image shape
    }
    size: 25,
    title: undefined,
    value: undefined,
    widthConstraint: false,
    x: undefined,
    y: undefined
  }
}

network.setOptions(options)
#>