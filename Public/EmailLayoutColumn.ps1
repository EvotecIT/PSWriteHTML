function EmailLayoutColumn {
    [cmdletBinding()]
    param(
        [ScriptBlock] $ColumnLayout,
        [string] $Width,
        [string] $Alignment,
        [string] $Padding,
        [string] $PaddingTop,
        [string] $PaddingRight,
        [string] $PaddingBottom,
        [string] $PaddingLeft,
        [Parameter()][ValidateSet('none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset')] $BorderTopStyle,
        [Parameter()][string] $BorderTopColor,
        [Parameter()][string] $BorderTopWidthSize = 0,
        [Parameter()][ValidateSet('none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset')] $BorderBottomStyle,
        [Parameter()][string] $BorderBottomColor,
        [Parameter()][string] $BorderBottomWidthSize = 0,
        [Parameter()][ValidateSet('none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset')] $BorderLeftStyle,
        [Parameter()][string] $BorderLeftColor,
        [Parameter()][string] $BorderLeftWidthSize = 0,
        [Parameter()][ValidateSet('none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset')] $BorderRightStyle,
        [Parameter()][string] $BorderRightColor,
        [Parameter()][string] $BorderRightWidthSize = 0
    )

    if ($ColumnLayout) {
        $Output = & $ColumnLayout

        $Style = @{
            'padding'             = ConvertFrom-Size -Size $Padding
            'padding-top'         = ConvertFrom-Size -Size $PaddingTop
            'padding-right'       = ConvertFrom-Size -Size $PaddingRight
            'padding-bottom'      = ConvertFrom-Size -Size $PaddingBottom
            'padding-left'        = ConvertFrom-Size -Size $PaddingLeft
            'max-width'           = ConvertFrom-Size -Size $Width
            "text-align"          = $Alignment
            'border-top-width'    = $BorderTopWidthSize
            'border-bottom-width' = $BorderBottomWidthSize
            'border-left-width'   = $BorderLeftWidthSize
            'border-right-width'  = $BorderRightWidthSize
            'border-top-color'    = $BorderTopColor
            'border-bottom-color' = $BorderBottomColor
            'border-left-color'   = $BorderLeftColor
            'border-right-color'  = $BorderRightColor
            'border-top-style'    = $BorderTopStyle
            'border-bottom-style' = $BorderBottomStyle
            'border-left-style'   = $BorderLeftStyle
            'border-right-style'  = $BorderRightStyle
        }
        New-HTMLTag -Tag 'td' -Attributes @{ class = 'layoutTableColumn'; width = $HTMLWidth; align = $Alignment; style = $Style } {
            $Output
        }
    }
}