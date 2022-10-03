function EmailLayoutRow {
    [cmdletBinding()]
    param(
        [ScriptBlock] $RowLayout,
        [string] $Height,
        [Parameter()][ValidateSet('none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset')] $BorderTopStyle,
        [Parameter()][string] $BorderTopColor,
        [Parameter()][string] $BorderTopWidthSize,
        [Parameter()][ValidateSet('none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset')] $BorderBottomStyle,
        [Parameter()][string] $BorderBottomColor,
        [Parameter()][string] $BorderBottomWidthSize,
        [Parameter()][ValidateSet('none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset')] $BorderLeftStyle,
        [Parameter()][string] $BorderLeftColor,
        [Parameter()][string] $BorderLeftWidthSize,
        [Parameter()][ValidateSet('none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset')] $BorderRightStyle,
        [Parameter()][string] $BorderRightColor,
        [Parameter()][string] $BorderRightWidthSize
    )
    if ($RowLayout) {
        $Output = & $RowLayout

        $HTMLHeight = ConvertFrom-Size -Size $Height
        $Style = @{
            'height'              = $HTMLHeight
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
        New-HTMLTag -Tag 'table' -Attributes @{ class = 'layoutTable' } {
            New-HTMLTag -Tag 'tbody' {
                New-HTMLTag -Tag 'tr' -Attributes @{class = 'layoutTableRow'; style = $Style } {
                    $Output
                }
            }
        }

    }
}