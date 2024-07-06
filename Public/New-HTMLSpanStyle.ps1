function New-HTMLSpanStyle {
    <#
    .SYNOPSIS
    Creates an HTML <span> element with specified styling.

    .DESCRIPTION
    The New-HTMLSpanStyle function generates an HTML <span> element with customizable styling options such as color, background color, font size, font weight, font style, alignment, text decoration, text transformation, and more.

    .PARAMETER Content
    The content to be placed within the <span> element.

    .PARAMETER Color
    The color of the text.

    .PARAMETER BackGroundColor
    The background color of the <span> element.

    .PARAMETER FontSize
    The font size of the text.

    .PARAMETER LineHeight
    The height of each line of text.

    .PARAMETER FontWeight
    The weight of the font.

    .PARAMETER FontStyle
    The style of the font.

    .PARAMETER FontVariant
    The variant of the font.

    .PARAMETER FontFamily
    The font family to be used.

    .PARAMETER Alignment
    The alignment of the text within the <span> element.

    .PARAMETER TextDecoration
    The decoration to be applied to the text.

    .PARAMETER TextTransform
    The transformation to be applied to the text.

    .PARAMETER Direction
    The direction of the text.

    .PARAMETER Display
    The display style of the <span> element.

    .PARAMETER Opacity
    The opacity of the <span> element.

    .PARAMETER LineBreak
    Indicates whether to allow line breaks within the <span> element.

    .EXAMPLE
    New-HTMLSpanStyle -Content { "Hello, World!" } -Color 'red' -FontSize '12px' -FontWeight 'bold' -Alignment 'center'
    Creates a <span> element with red text, font size of 12 pixels, bold weight, and centered alignment containing the text "Hello, World!".

    .EXAMPLE
    New-HTMLSpanStyle -Content { "This is underlined text" } -Color 'blue' -TextDecoration 'underline'
    Creates a <span> element with blue text and underlined decoration containing the text "This is underlined text".

    #>
    [CmdletBinding()]
    param(
        [ScriptBlock] $Content,
        [string] $Color,
        [string] $BackGroundColor,
        [object] $FontSize,
        [string] $LineHeight,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [ValidateSet('normal', 'italic', 'oblique')][string] $FontStyle,
        [ValidateSet('normal', 'small-caps')][string] $FontVariant,
        [string] $FontFamily,
        [ValidateSet('left', 'center', 'right', 'justify')][string]  $Alignment,
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string]  $TextDecoration,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string]  $TextTransform,
        [ValidateSet('rtl')][string] $Direction,
        [ValidateSet(
            'none', 'inline', 'block', 'inline-block', 'contents',
            'flex', 'grid', 'inline-flex', 'inline-grid', 'inline-table', 'list-item', 'run-in',
            'table', 'table-caption', 'table-column-group', 'table-header-group', 'table-footer-group',
            'table-row-group', 'table-cell', 'table-column', 'table-row'
        )][string] $Display,
        [double] $Opacity,
        [switch] $LineBreak
    )
    $Style = @{
        style = @{
            'color'            = ConvertFrom-Color -Color $Color
            'background-color' = ConvertFrom-Color -Color $BackGroundColor
            'font-size'        = ConvertFrom-Size -FontSize $FontSize
            'font-weight'      = $FontWeight
            'font-variant'     = $FontVariant
            'font-family'      = $FontFamily
            'font-style'       = $FontStyle
            'text-align'       = $Alignment
            'line-height'      = $LineHeight
            'text-decoration'  = $TextDecoration
            'text-transform'   = $TextTransform
            'direction'        = $Direction
            'display'          = $Display
            'opacity'          = $Opacity
        }
    }

    if ($Alignment) {
        $StyleDiv = @{ }
        $StyleDiv.Align = $Alignment

        New-HTMLTag -Tag 'div' -Attributes $StyleDiv {
            New-HTMLTag -Tag 'span' -Attributes $Style {
                if ($Content) {
                    Invoke-Command -ScriptBlock $Content
                }
            }
        }
    } else {
        New-HTMLTag -Tag 'span' -Attributes $Style {
            if ($Content) {
                Invoke-Command -ScriptBlock $Content
            }
        }
    }
}

Register-ArgumentCompleter -CommandName New-HTMLSpanStyle -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLSpanStyle -ParameterName BackGroundColor -ScriptBlock $Script:ScriptBlockColors