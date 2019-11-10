function New-DiagramNode {
    [alias('DiagramNode')]
    [CmdLetBinding(DefaultParameterSetName = 'Shape')]
    param(
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][ScriptBlock] $TextBox,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string] $Id,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")] [string] $Label,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string[]] $To,
        [parameter(ParameterSetName = "Shape")][string][ValidateSet(
            'circle', 'dot', 'diamond', 'ellipse', 'database', 'box', 'square', 'triangle', 'triangleDown', 'text', 'star', 'hexagon')] $Shape,
        [parameter(ParameterSetName = "Image")][ValidateSet('squareImage', 'circularImage')][string] $ImageType,
        [parameter(ParameterSetName = "Image")][uri] $Image,
        #[string] $BrokenImage,
        #[string] $ImagePadding,
        #[string] $ImagePaddingLeft,
        #[string] $ImagePaddingRight,
        #[string] $ImagePaddingTop,
        #[string] $ImagePaddingBottom,
        #[string] $UseImageSize,
        #[alias('BackgroundColor')][string] $Color,
        #[string] $Border,
        #[string] $HighlightBackground,
        #[string] $HighlightBorder,
        #[string] $HoverBackground,
        #[string] $HoverBorder,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][nullable[int]] $BorderWidth,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][nullable[int]] $BorderWidthSelected,
        [parameter(ParameterSetName = "Image")][string] $BrokenImages,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][nullable[bool]] $Chosen,
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string] $ColorBorder = "",
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string] $ColorBackground = "",
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string] $ColorHighlightBorder = "",
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string] $ColorHighlightBackground = "",
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string] $ColorHoverBorder = "",
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string] $ColorHoverBackground = "",
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][nullable[bool]]$FixedX,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][nullable[bool]]$FixedY,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string] $FontColor = "",
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][nullable[int]] $FontSize, #// px
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string] $FontName,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string] $FontBackground = "",
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][nullable[int]] $FontStrokeWidth, #// px
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string] $FontStrokeColor = "",
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][ValidateSet('center', 'left')][string] $FontAlign,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][ValidateSet('false', 'true', 'markdown', 'html')][string]$FontMulti,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][nullable[int]] $FontVAdjust,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][nullable[int]] $Size,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][nullable[int]] $X,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][nullable[int]] $Y,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][switch] $IconAsImage,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $IconColor = "",
        # ICON BRANDS
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeBrands.Keys)
            }
        )]
        [ValidateScript(
            {
                $_ -in (($Global:HTMLIcons.FontAwesomeBrands.Keys))
            }
        )]
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [string] $IconBrands,

        # ICON REGULAR
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeRegular.Keys)
            }
        )]
        [ValidateScript(
            {
                $_ -in (($Global:HTMLIcons.FontAwesomeRegular.Keys))
            }
        )]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [string] $IconRegular,

        # ICON SOLID
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeSolid.Keys)
            }
        )]
        [ValidateScript(
            {
                $_ -in (($Global:HTMLIcons.FontAwesomeSolid.Keys))
            }
        )]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [string] $IconSolid,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][nullable[int]] $Level,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][nullable[int]] $HeightConstraintMinimum,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][ValidateSet('top', 'middle', 'bottom')][string] $HeightConstraintVAlign,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][nullable[int]] $WidthConstraintMinimum,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][nullable[int]] $WidthConstraintMaximum
    )

    if (-not $Label) {
        Write-Warning 'New-DiagramNode - Label is required. Skipping node.'
        return
    }

    $Object = [PSCustomObject] @{
        Type     = 'DiagramNode'
        Settings = @{ }
        Edges    = @{ }
    }
    $Icon = @{ } # Reset value, just in case

    # If ID is not defined use label
    if (-not $ID) {
        $ID = $Label
    }

    if ($IconBrands -or $IconRegular -or $IconSolid) {
        if ($IconBrands) {
            if (-not $IconAsImage) {
                # Workaround using image for Fonts
                # https://use.fontawesome.com/releases/v5.11.2/svgs/brands/accessible-icon.svg
                <# Until all Icons work, using images instead. Currently only Brands work fine / Solid/Regular is weird #>
                $NodeShape = 'icon'
                $icon = @{
                    face   = '"Font Awesome 5 Brands"'
                    code   = -join ('\u', $Global:HTMLIcons.FontAwesomeBrands[$IconBrands])    # "\uf007"
                    color  = ConvertFrom-Color -Color $IconColor
                    weight = 'bold'
                }

            } else {
                $NodeShape = 'image'
                $Image = -join ($Script:Configuration.Features.FontsAwesome.Other.Link, 'brands/', $IconBrands, '.svg')
            }
        } elseif ($IconRegular) {
            if (-not $IconAsImage) {
                $NodeShape = 'icon'
                $icon = @{
                    face   = '"Font Awesome 5 Free"'
                    code   = -join ('\u', $Global:HTMLIcons.FontAwesomeRegular[$IconRegular])    # "\uf007"
                    color  = ConvertFrom-Color -Color $IconColor
                    weight = 'bold'
                }
            } else {
                $NodeShape = 'image'
                $Image = -join ($Script:Configuration.Features.FontsAwesome.Other.Link, 'regular/', $IconRegular, '.svg')
            }
        } else {
            if (-not $IconAsImage) {
                $NodeShape = 'icon'
                $icon = @{
                    face   = '"Font Awesome 5 Free"'
                    code   = -join ('\u', $Global:HTMLIcons.FontAwesomeSolid[$IconSolid])    # "\uf007"
                    color  = ConvertFrom-Color -Color $IconColor
                    weight = 'bold'
                }

            } else {
                $NodeShape = 'image'
                $Image = -join ($Script:Configuration.Features.FontsAwesome.Other.Link, 'solid/', $IconSolid, '.svg')
            }
        }
    } elseif ($Image) {
        if ($ImageType -eq 'squareImage') {
            $NodeShape = 'image'
        } else {
            $NodeShape = 'circularImage'
        }
    } else {
        $NodeShape = $Shape
    }

    if ($To) {
        $Object.Edges = @{
            from = if ($To) { $Id } else { '' }
            to   = if ($To) { $To } else { '' }
        }
    }
    $Object.Settings = [ordered] @{
        id                  = $Id
        label               = $Label
        shape               = $NodeShape

        image               = $Image
        icon                = $icon

        level               = $Level


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
            size        = $FontSize
            face        = $FontName
            background  = ConvertFrom-Color -Color $FontBackground
            strokeWidth = $FontStrokeWidth
            strokeColor = ConvertFrom-Color -Color $FontStrokeColor
            align       = $FontAlign
            multi       = $FontMulti
            vadjust     = $FontVAdjust
        }
        size                = $Size
        heightConstraint    = @{
            minimum = $HeightConstraintMinimum
            valign  = $HeightConstraintVAlign
        }
        widthConstraint     = @{
            minimum = $WidthConstraintMinimum
            maximum = $WidthConstraintMaximum
        }
        x                   = $X
        y                   = $Y
    }

    Remove-EmptyValues -Hashtable $Object.Settings -Recursive -Rerun 2
    Remove-EmptyValues -Hashtable $Object.Edges -Recursive
    $Object
}

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