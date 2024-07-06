function EmailLayoutRow {
    <#
    .SYNOPSIS
    Defines the layout structure for a row in an email content.

    .DESCRIPTION
    This function defines the layout structure for a row in an email content using a ScriptBlock. It generates an HTML table row layout for the email content.

    .PARAMETER RowLayout
    Specifies the ScriptBlock containing the content of the row.

    .PARAMETER Height
    Specifies the height of the row.

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

    .EXAMPLE
    $RowLayout = {
        'Column 1 content'
        'Column 2 content'
    }
    $Row = EmailLayoutRow -RowLayout $RowLayout -Height '50px' -BorderTopStyle 'solid' -BorderTopColor 'black' -BorderTopWidthSize '1px' -BorderBottomStyle 'dotted' -BorderBottomColor 'gray' -BorderBottomWidthSize '2px' -BorderLeftStyle 'dashed' -BorderLeftColor 'blue' -BorderLeftWidthSize '1px' -BorderRightStyle 'dotted' -BorderRightColor 'green' -BorderRightWidthSize '1px'
    Generates an HTML table row layout with specified content and border styles.

    #>
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