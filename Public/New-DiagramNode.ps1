function New-DiagramNode {
    <#
    .SYNOPSIS
    Creates nodes on a diagram

    .DESCRIPTION
    Creates nodes on a diagram

    .PARAMETER HtmlTextBox
    Experimental TextBox to put HTML instead of Image using SVG

    .PARAMETER Id
    Id of a node. If not set, label will be used as Id.

    .PARAMETER Label
    Label for a diagram

    .PARAMETER Title
    Label that shows up when hovering over node

    .PARAMETER To
    Parameter description

    .PARAMETER ArrowsToEnabled
    Parameter description

    .PARAMETER ArrowsMiddleEnabled
    Parameter description

    .PARAMETER ArrowsFromEnabled
    Parameter description

    .PARAMETER LinkColor
    Parameter description

    .PARAMETER Shape
    Parameter description

    .PARAMETER ImageType
    Parameter description

    .PARAMETER Image
    Parameter description

    .PARAMETER BorderWidth
    Parameter description

    .PARAMETER BorderWidthSelected
    Parameter description

    .PARAMETER BrokenImages
    Parameter description

    .PARAMETER Chosen
    Parameter description

    .PARAMETER ColorBorder
    Parameter description

    .PARAMETER ColorBackground
    Parameter description

    .PARAMETER ColorHighlightBorder
    Parameter description

    .PARAMETER ColorHighlightBackground
    Parameter description

    .PARAMETER ColorHoverBorder
    Parameter description

    .PARAMETER ColorHoverBackground
    Parameter description

    .PARAMETER FixedX
    Parameter description

    .PARAMETER FixedY
    Parameter description

    .PARAMETER FontColor
    Color of the label text.

    .PARAMETER FontSize
    Size of the label text.

    .PARAMETER FontName
    Font face (or font family) of the label text.

    .PARAMETER FontBackground
    When not undefined but a color string, a background rectangle will be drawn behind the label in the supplied color.

    .PARAMETER FontStrokeWidth
    As an alternative to the background rectangle, a stroke can be drawn around the text. When a value higher than 0 is supplied, the stroke will be draw

    .PARAMETER FontStrokeColor
    This is the color of the stroke assuming the value for stroke is higher than 0.

    .PARAMETER FontAlign
    This can be set to 'left' to make the label left-aligned. Otherwise, defaults to 'center'.

    .PARAMETER FontMulti
    If false, the label is treated as pure text drawn with the base font.
    If true or 'html' the label may be multifonted, with bold, italic and code markup, interpreted as html.
    If the value is 'markdown' or 'md' the label may be multifonted, with bold, italic and code markup, interpreted as markdown.
    The bold, italic, bold-italic and monospaced fonts may be set up under in the font.bold, font.ital, font.boldital and font.mono properties, respectively.

    .PARAMETER FontVAdjust
    Parameter description

    .PARAMETER Size
    The size is used to determine the size of node shapes that do not have the label inside of them.
    These shapes are: image, circularImage, diamond, dot, star, triangle, triangleDown, hexagon, square and icon

    .PARAMETER X
    Parameter description

    .PARAMETER Y
    Parameter description

    .PARAMETER IconAsImage
    Parameter description

    .PARAMETER IconColor
    Parameter description

    .PARAMETER IconBrands
    Parameter description

    .PARAMETER IconRegular
    Parameter description

    .PARAMETER IconSolid
    Parameter description

    .PARAMETER Level
    Parameter description

    .PARAMETER HeightConstraintMinimum
    Parameter description

    .PARAMETER HeightConstraintVAlign
    Parameter description

    .PARAMETER WidthConstraintMinimum
    Parameter description

    .PARAMETER WidthConstraintMaximum
    Parameter description

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [alias('DiagramNode')]
    [CmdLetBinding(DefaultParameterSetName = 'Shape')]
    param(
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][ScriptBlock] $HtmlTextBox,
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
        [parameter(ParameterSetName = "Shape")] [string] $Title,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string[]] $To,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")]
        [switch] $ArrowsToEnabled,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")]
        [switch] $ArrowsMiddleEnabled,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")]
        [switch] $ArrowsFromEnabled,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")]
        [alias('EdgeColor')][string] $LinkColor,
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
        [parameter(ParameterSetName = "Shape")][string] $ColorBorder,
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string] $ColorBackground,
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string] $ColorHighlightBorder,
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string] $ColorHighlightBackground,
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string] $ColorHoverBorder,
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string] $ColorHoverBackground,
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
        [parameter(ParameterSetName = "Shape")][string] $FontColor,
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
        [parameter(ParameterSetName = "Shape")][string] $FontBackground,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][nullable[int]] $FontStrokeWidth, #// px
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "Image")]
        [parameter(ParameterSetName = "Shape")][string] $FontStrokeColor,
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
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $IconColor,
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
        $Script:HTMLSchema.Features.FontsAwesome = $true
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
                $Image = -join ($Script:CurrentConfiguration.Features.FontsAwesome.Other.Link, 'brands/', $IconBrands, '.svg')
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
                $Image = -join ($Script:CurrentConfiguration.Features.FontsAwesome.Other.Link, 'regular/', $IconRegular, '.svg')
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
                $Image = -join ($Script:CurrentConfiguration.Features.FontsAwesome.Other.Link, 'solid/', $IconSolid, '.svg')
            }
        }
    } elseif ($Image) {
        if ($ImageType -eq 'squareImage') {
            $NodeShape = 'image'
        } else {
            $NodeShape = 'circularImage'
        }
    } elseif ($HtmlTextBox) {
        $OutputSVG = New-HTMLTag -Tag 'svg' -Attributes @{ xmlns = 'http://www.w3.org/2000/svg'; width = '390' ; height = '70' } {
            #New-HTMLTag -Tag 'rect' -Attributes @{ x = "0"; y = "0"; width = "100%"; height = "100%"; fill = "#7890A7"; 'stroke-width' = "20"; stroke = "#ffffff"; }
            New-HTMLTag -Tag 'foreignObject' -Attributes @{x = "15"; y = "10"; width = "100%"; height = "100%"; } {
                New-HTMLTag -Tag 'div' -Attributes @{ xmlns = 'http://www.w3.org/1999/xhtml' } {
                    & $HtmlTextBox
                }
            }
        }
        $Image = ConvertTo-SVG -FileType 'svg+xml' -Content $OutputSVG
        $NodeShape = 'image'
    } else {
        $NodeShape = $Shape
    }

    if ($To) {
        $Object.Edges = [ordered] @{
            arrows = [ordered]@{
                to     = [ordered]@{
                    enabled = if ($ArrowsToEnabled) { $ArrowsToEnabled.IsPresent } else { $null }
                }
                middle = [ordered]@{
                    enabled = if ($ArrowsMiddleEnabled) { $ArrowsMiddleEnabled.IsPresent } else { $null }
                }
                from   = [ordered]@{
                    enabled = if ($ArrowsFromEnabled) { $ArrowsFromEnabled.IsPresent } else { $null }
                }
            }
            color  = [ordered]@{
                color = ConvertFrom-Color -Color $LinkColor
            }
            from   = if ($To) { $Id } else { '' }
            to     = if ($To) { $To } else { '' }
        }
    }
    $Object.Settings = [ordered] @{
        id                  = $Id
        label               = $Label
        title               = $Title
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

    Remove-EmptyValue -Hashtable $Object.Settings -Recursive -Rerun 2
    Remove-EmptyValue -Hashtable $Object.Edges -Recursive -Rerun 2
    $Object
}
Register-ArgumentCompleter -CommandName New-DiagramNode -ParameterName ColorBorder -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramNode -ParameterName ColorBackground -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramNode -ParameterName ColorHighlightBorder -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramNode -ParameterName ColorHighlightBackground -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramNode -ParameterName ColorHoverBorder -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramNode -ParameterName ColorHoverBackground -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramNode -ParameterName FontColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramNode -ParameterName FontBackground -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramNode -ParameterName FontStrokeColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramNode -ParameterName IconColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-DiagramNode -ParameterName LinkColor -ScriptBlock $Script:ScriptBlockColors
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