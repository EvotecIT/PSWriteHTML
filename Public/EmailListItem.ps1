function EmailListItem {
    <#
    .SYNOPSIS
    Creates an HTML list item with customizable text styling.

    .DESCRIPTION
    The EmailListItem function generates an HTML list item with customizable text styling options such as color, font size, font weight, font style, alignment, text decoration, text transformation, and more.

    .PARAMETER Text
    Specifies the text content of the list item.

    .PARAMETER Color
    Specifies the color of the text. Default is an empty array.

    .PARAMETER BackGroundColor
    Specifies the background color of the list item. Default is an empty array.

    .PARAMETER FontSize
    Specifies the font size of the text. Default is an empty array.

    .PARAMETER FontWeight
    Specifies the font weight of the text. Valid values are 'normal', 'bold', 'bolder', 'lighter', and numeric values from 100 to 900. Default is an empty array.

    .PARAMETER FontStyle
    Specifies the font style of the text. Valid values are 'normal', 'italic', 'oblique'. Default is an empty array.

    .PARAMETER FontVariant
    Specifies the font variant of the text. Valid values are 'normal', 'small-caps'. Default is an empty array.

    .PARAMETER FontFamily
    Specifies the font family of the text. Default is an empty array.

    .PARAMETER Alignment
    Specifies the alignment of the text. Valid values are 'left', 'center', 'right', 'justify'. Default is an empty array.

    .PARAMETER TextDecoration
    Specifies the text decoration of the text. Valid values are 'none', 'line-through', 'overline', 'underline'. Default is an empty array.

    .PARAMETER TextTransform
    Specifies the text transformation of the text. Valid values are 'uppercase', 'lowercase', 'capitalize'. Default is an empty array.

    .PARAMETER Direction
    Specifies the direction of the text. Valid value is 'rtl'. Default is an empty array.

    .PARAMETER LineBreak
    Indicates whether a line break should be added after the list item.

    .EXAMPLE
    EmailListItem -Text "Example Text" -Color "red" -FontSize 14 -FontWeight "bold" -Alignment "center"
    Creates an HTML list item with the text "Example Text" in red color, font size 14, bold font weight, and centered alignment.

    #>
    [CmdletBinding()]
    param(
        [string[]] $Text,
        [string[]] $Color = @(),
        [string[]] $BackGroundColor = @(),
        [int[]] $FontSize = @(),
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

    New-HTMLListItem @newHTMLTextSplat
}
Register-ArgumentCompleter -CommandName EmailListItem -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName EmailListItem -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors