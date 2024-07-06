function EmailLayoutColumn {
    <#
    .SYNOPSIS
    Defines the layout structure for a column in an email content.

    .DESCRIPTION
    This function defines the layout structure for a column in an email content using specified parameters. It allows customization of column layout properties such as width, alignment, padding, and borders.

    .PARAMETER ColumnLayout
    Specifies the ScriptBlock containing the content of the column.

    .PARAMETER Width
    Specifies the width of the column.

    .PARAMETER Alignment
    Specifies the alignment of the content within the column. Valid values are 'left', 'center', 'right', or 'justify'.

    .PARAMETER Padding
    Specifies the padding for all sides of the column.

    .PARAMETER PaddingTop
    Specifies the padding for the top side of the column.

    .PARAMETER PaddingRight
    Specifies the padding for the right side of the column.

    .PARAMETER PaddingBottom
    Specifies the padding for the bottom side of the column.

    .PARAMETER PaddingLeft
    Specifies the padding for the left side of the column.

    .PARAMETER BorderTopStyle
    Specifies the style of the top border. Valid values are 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'.

    .PARAMETER BorderTopColor
    Specifies the color of the top border.

    .PARAMETER BorderTopWidthSize
    Specifies the width of the top border.

    .PARAMETER BorderBottomStyle
    Specifies the style of the bottom border. Valid values are 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'.

    .PARAMETER BorderBottomColor
    Specifies the color of the bottom border.

    .PARAMETER BorderBottomWidthSize
    Specifies the width of the bottom border.

    .PARAMETER BorderLeftStyle
    Specifies the style of the left border. Valid values are 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'.

    .PARAMETER BorderLeftColor
    Specifies the color of the left border.

    .PARAMETER BorderLeftWidthSize
    Specifies the width of the left border.

    .PARAMETER BorderRightStyle
    Specifies the style of the right border. Valid values are 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'.

    .PARAMETER BorderRightColor
    Specifies the color of the right border.

    .PARAMETER BorderRightWidthSize
    Specifies the width of the right border.
    #>
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