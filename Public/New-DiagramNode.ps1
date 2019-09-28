function New-DiagramNode {
  [alias('DiagramNode')]
  [CmdletBinding()]
  param(
    [string] $Id,
    [string] $Label,
    [string[]] $To,
    [string][ValidateSet(
      'circle', 'dot', 'diamond', 'ellipse', 'database', 'box', 'square', 'triangle', 'triangleDown', 'text', 'star', 'hexagon')] $Shape = 'ellipse',
    [ValidateSet('squareImage', 'circularImage')][string] $ImageType = 'circularImage',
    [uri] $Image,
    #[string] $BrokenImage,
    #[string] $ImagePadding,
    #[string] $ImagePaddingLeft,
    #[string] $ImagePaddingRight,
    #[string] $ImagePaddingTop,
    #[string] $ImagePaddingBottom,
    #[string] $UseImageSize,
    #[alias('BackgroundColor')][RGBColors] $Color,
    #[RGBColors] $Border,
    #[RGBColors] $HighlightBackground,
    #[RGBColors] $HighlightBorder,
    #[RGBColors] $HoverBackground,
    #[RGBColors] $HoverBorder,
    [int] $BorderWidth = 1,
    [int] $BorderWidthSelected = 2,
    [string] $BrokenImages,
    [bool] $Chosen = $true,
    [RGBColors] $ColorBorder = [RGBColors]::None,
    [RGBColors] $ColorBackground = [RGBColors]::None,
    [RGBColors] $ColorHighlightBorder = [RGBColors]::None,
    [RGBColors] $ColorHighlightBackground = [RGBColors]::None,
    [RGBColors] $ColorHoverBorder = [RGBColors]::None,
    [RGBColors] $ColorHoverBackground = [RGBColors]::None,
    [bool]$FixedX = $false,
    [bool]$FixedY = $false,
    [RGBColors] $FontColor = [RGBColors]::None,
    [int] $FontSize = 14, #// px
    [string] $FontName = 'arial',
    [RGBColors] $FontBackground = [RGBColors]::None,
    [int] $FontStrokeWidth = 0, #// px
    [RGBColors] $FontStrokeColor = [RGBColors]::None,
    [ValidateSet('center', 'left')][string] $FontAlign = 'center',
    [ValidateSet('false', 'true', 'markdown', 'html')][string]$FontMulti,
    [int] $FontVAdjust = 0,
    [int] $Size = 25,
    [bool]$WidthConstraint = $false,
    [nullable[int]] $X,
    [nullable[int]] $Y,
    #[RGBColors] $IconColor = [RGBColors]::None,
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
    #[parameter(ParameterSetName = "FontAwesomeBrands")]
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
    #[parameter(ParameterSetName = "FontAwesomeRegular")]
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
    #[parameter(ParameterSetName = "FontAwesomeSolid")]
    [string] $IconSolid
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
      # Workaround using image for Fonts
      # https://use.fontawesome.com/releases/v5.11.2/svgs/brands/accessible-icon.svg
      <# Until all Icons work, using images instead. Currently only Brands work fine / Solid/Regular is weird
      $NodeShape = 'icon'
      $icon = @{
        face  = '"Font Awesome 5 Brands"'
        code  = -join ('\u', $Global:HTMLIcons.FontAwesomeBrands[$IconBrands])    # "\uf007"
        color = ConvertFrom-Color -Color $IconColor
      }
      #>
      $NodeShape = 'image'
      $Image = -join ($Script:Configuration.Features.FontsAwesome.Other.Link, 'brands/', $IconBrands, '.svg')
    } elseif ($IconRegular) {
      <#
      $icon = @{
        face  = '"Font Awesome 5 Free"'
        code  = -join ('\u', $Global:HTMLIcons.FontAwesomeRegular[$IconRegular])    # "\uf007"
        color = ConvertFrom-Color -Color $IconColor
      }
      #>
      $NodeShape = 'image'
      $Image = -join ($Script:Configuration.Features.FontsAwesome.Other.Link, 'regular/', $IconRegular, '.svg')
    } else {
      <#
      $icon = @{
        face  = '"Font Awesome 5 Free"'
        code  = -join ('\u', $Global:HTMLIcons.FontAwesomeSolid[$IconSolid])    # "\uf007"
        color = ConvertFrom-Color -Color $IconColor
      }
      #>
      $NodeShape = 'image'
      $Image = -join ($Script:Configuration.Features.FontsAwesome.Other.Link, 'solid/', $IconSolid, '.svg')
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
    size                = $Size
    widthConstraint     = $WidthConstrain
    x = $X
    y = $Y
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