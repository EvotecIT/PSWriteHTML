function New-DiagramNode {
    [alias('DiagramNode')]
    [CmdletBinding()]
    param(
        [string] $Id,
        [string] $Label,
        [string[]] $To,
        [string][ValidateSet(
            'circle', 'dot', 'diamond', 'ellipse', 'database', 'box', 'square', 'triangle', 'triangleDown', 'text', 'star', 'hexagon',
            'default')] $Shape = 'default',
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
        Settings = [ordered] @{ }
    }

    # If ID is not defined use label
    if (-not $ID) {
        $ID = $Label
    }

    if ($IconBrands -or $IconRegular -or $IconSolid) {
        #$IconUse = "\uf36e"
        #$NodeShape = 'icon'

        # Workaround using image for Fonts
        # https://use.fontawesome.com/releases/v5.11.2/svgs/brands/accessible-icon.svg

        #if ($ImageType -eq 'squareImage') {
        $NodeShape = 'image'
        #} else {
        # $NodeShape = 'circularImage'
        #}
        if ($IconBrands) {
            $Image = -join ($Script:Configuration.Features.FontsAwesome.Other.Link, 'brands/', $IconBrands, '.svg')
        } elseif ($IconRegular) {
            $Image = -join ($Script:Configuration.Features.FontsAwesome.Other.Link, 'regular/', $IconRegular, '.svg')
        } else {
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

    $Object.Settings = [ordered] @{
        ID                  = $Id
        Label               = $Label
        From                = if ($To) { $Id } else { '' }
        To                  = if ($To) { $To } else { '' }

        Shape               = $NodeShape
        Size                = $Size

        Image               = $Image
        Icon                = $IconUse

        Border              = $ColorBorder
        Background          = $ColorBackground
        HighlightBackground = $ColorHighlightBackground
        HighlightBorder     = $ColorHighlightBorder
        HoverBorder         = $ColorHoverBorder
        HoverBackground     = $ColorHoverBackground
    }

    Remove-EmptyValues -Hashtable $Object.Settings -Recursive
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