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
        [RGBColors] $Background,
        [RGBColors] $Border,
        [RGBColors] $HighlightBackground,
        [RGBColors] $HighlightBorder,
        [RGBColors] $HoverBackground,
        [RGBColors] $HoverBorder
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

    $Object.Settings = [ordered] @{
        ID                  = $Id
        Label               = $Label
        From                = if ($To) { $Id } else { '' }
        To                  = if ($To) { $To } else { '' }

        Shape               = $Shape
        Size = $Size

        Border              = $Border
        Background          = $Background
        HighlightBackground = $HighlightBackground
        HighlightBorder     = $HighlightBorder
        HoverBorder         = $HoverBorder
        HoverBackground     = $HoverBackground
    }

    $Object
}