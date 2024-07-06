function New-HTMLListItem {
    <#
    .SYNOPSIS
    Creates a new HTML list item with customizable styling options.

    .DESCRIPTION
    The New-HTMLListItem function generates an HTML list item with various styling options such as text color, background color, font size, font weight, alignment, and more.

    .PARAMETER NestedListItems
    Specifies the nested list items to be included within the current list item.

    .PARAMETER Text
    Specifies the text content of the list item.

    .PARAMETER Color
    Specifies the color of the text in the list item.

    .PARAMETER BackGroundColor
    Specifies the background color of the list item.

    .PARAMETER FontSize
    Specifies the font size of the text in the list item.

    .PARAMETER FontWeight
    Specifies the weight of the font. Valid values include 'normal', 'bold', 'bolder', 'lighter', and numeric values from 100 to 900.

    .PARAMETER FontStyle
    Specifies the style of the font. Valid values are 'normal', 'italic', and 'oblique'.

    .PARAMETER FontVariant
    Specifies the variant of the font. Valid values are 'normal' and 'small-caps'.

    .PARAMETER FontFamily
    Specifies the font family for the text in the list item.

    .PARAMETER Alignment
    Specifies the alignment of the text within the list item. Valid values are 'left', 'center', 'right', and 'justify'.

    .PARAMETER TextDecoration
    Specifies the decoration of the text. Valid values are 'none', 'line-through', 'overline', and 'underline'.

    .PARAMETER TextTransform
    Specifies the transformation of the text. Valid values are 'uppercase', 'lowercase', and 'capitalize'.

    .PARAMETER Direction
    Specifies the direction of the text. Valid value is 'rtl' (right-to-left).

    .PARAMETER LineBreak
    Indicates whether to include a line break after the list item.

    .EXAMPLE
    New-HTMLListItem -Text 'Item 1' -Color 'blue' -FontSize '12px' -FontWeight 'bold' -Alignment 'center'
    Creates an HTML list item with the text 'Item 1' in blue color, font size of 12 pixels, bold font weight, and centered alignment.

    .EXAMPLE
    New-HTMLListItem -Text 'Item 2' -FontFamily 'Arial' -TextDecoration 'underline' -Direction 'rtl'
    Creates an HTML list item with the text 'Item 2' in Arial font family, underlined text decoration, and right-to-left direction.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)][scriptblock] $NestedListItems,
        [Parameter(Position = 1)][string[]] $Text,
        [Parameter(Position = 2)][string[]] $Color = @(),
        [Parameter(Position = 3)][string[]] $BackGroundColor = @(),
        [object[]] $FontSize = @(),
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string[]] $FontWeight = @(),
        [ValidateSet('normal', 'italic', 'oblique')][string[]] $FontStyle = @(),
        [ValidateSet('normal', 'small-caps')][string[]] $FontVariant = @(),
        [string[]] $FontFamily = @(),
        [ValidateSet('left', 'center', 'right', 'justify')][string[]] $Alignment = @(),
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string[]] $TextDecoration = @(),
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string[]] $TextTransform = @(),
        [ValidateSet('rtl')][string[]] $Direction = @(),
        [switch] $LineBreak
    )

    $newHTMLTextSplat = @{
        Alignment       = $Alignment
        FontSize        = $FontSize
        TextTransform   = $TextTransform
        Text            = $Text
        Color           = $Color
        FontFamily      = $FontFamily
        Direction       = $Direction
        FontStyle       = $FontStyle
        TextDecoration  = $TextDecoration
        BackGroundColor = $BackGroundColor
        FontVariant     = $FontVariant
        FontWeight      = $FontWeight
        LineBreak       = $LineBreak
    }
    <#
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


            'text-decoration'  = $TextDecoration
            'text-transform'   = $TextTransform
            'direction'        = $Direction
        }
    }
    #>

    New-HTMLTag -Tag 'li' -Attributes $Style -Value {
        New-HTMLText @newHTMLTextSplat -SkipParagraph
        if ($NestedListItems) {
            & $NestedListItems
        }
    }
}

Register-ArgumentCompleter -CommandName New-HTMLListItem -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLListItem -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors