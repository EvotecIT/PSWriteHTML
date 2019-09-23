function New-DiagramNode {
    [alias('DiagramNode')]
    [CmdletBinding()]
    param(
        [string] $Id,
        [string] $Label,
        [string[]] $To,
        [string][ValidateSet(
            'circle', 'dot', 'diamond', 'ellipse', 'database', 'box', 'square', 'triangle', 'triangleDown', 'text', 'star', 'hexagon',
            'icon',
            'circularImage',
            'image', 'default')] $Shape = 'default',

        [int] $Size = 25,
        #[string] $BrokenImage,
        #[string] $ImagePadding,
        #[string] $ImagePaddingLeft,
        #[string] $ImagePaddingRight,
        #[string] $ImagePaddingTop,
        #[string] $ImagePaddingBottom,
        #[string] $UseImageSize,
        [alias('BackgroundColor')][RGBColors] $Color,
        [RGBColors] $Border,
        [RGBColors] $HighlightBackground,
        [RGBColors] $HighlightBorder,
        [RGBColors] $HoverBackground,
        [RGBColors] $HoverBorder,


          # ICON BRANDS
          [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeBrands)
            }
        )]
        [ValidateScript(
            {
                $_ -in (($Global:HTMLIcons.FontAwesomeBrands))
            }
        )]
        #[parameter(ParameterSetName = "FontAwesomeBrands")]
        [string] $IconBrands,

        # ICON REGULAR
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeRegular)
            }
        )]
        [ValidateScript(
            {
                $_ -in (($Global:HTMLIcons.FontAwesomeRegular))
            }
        )]
        #[parameter(ParameterSetName = "FontAwesomeRegular")]
        [string] $IconRegular,

        # ICON SOLID
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeSolid)
            }
        )]
        [ValidateScript(
            {
                $_ -in (($Global:HTMLIcons.FontAwesomeSolid))
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
        $IconUse = '\uf233'
    }

    $Object.Settings = [ordered] @{
        ID                  = $Id
        Label               = $Label
        From                = if ($To) { $Id } else { '' }
        To                  = if ($To) { $To } else { '' }

        Shape               = $Shape
        Size = $Size

Icon = $IconUse

        Border              = $Border
        Background          = $Color
        HighlightBackground = $HighlightBackground
        HighlightBorder     = $HighlightBorder
        HoverBorder         = $HoverBorder
        HoverBackground     = $HoverBackground
    }

    $Object
}