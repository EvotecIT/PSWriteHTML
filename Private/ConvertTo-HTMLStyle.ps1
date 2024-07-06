function ConvertTo-HTMLStyle {
    <#
    .SYNOPSIS
    Converts input parameters to HTML style attributes.

    .DESCRIPTION
    This function converts input parameters to HTML style attributes for styling elements in HTML documents.

    .PARAMETER Color
    Specifies the color of the text.

    .PARAMETER BackGroundColor
    Specifies the background color of the text.

    .PARAMETER FontSize
    Specifies the font size.

    .PARAMETER FontWeight
    Specifies the font weight. Valid values are 'normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900'.

    .PARAMETER FontStyle
    Specifies the font style. Valid values are 'normal', 'italic', 'oblique'.

    .PARAMETER FontVariant
    Specifies the font variant. Valid values are 'normal', 'small-caps'.

    .PARAMETER FontFamily
    Specifies the font family.

    .PARAMETER Alignment
    Specifies the text alignment. Valid values are 'left', 'center', 'right', 'justify'.

    .PARAMETER TextDecoration
    Specifies the text decoration. Valid values are 'none', 'line-through', 'overline', 'underline'.

    .PARAMETER TextTransform
    Specifies the text transformation. Valid values are 'uppercase', 'lowercase', 'capitalize'.

    .PARAMETER Direction
    Specifies the text direction. Valid values are 'rtl'.

    .PARAMETER LineBreak
    Indicates whether to add a line break.

    .PARAMETER WordBreak
    Specifies the word break behavior. Valid values are 'normal', 'break-all', 'keep-all', 'break-word'.

    .EXAMPLE
    ConvertTo-HTMLStyle -Color 'red' -FontSize '12px' -FontWeight 'bold' -Alignment 'center'
    Converts the input parameters to HTML style attributes for a text element with red color, 12px font size, bold font weight, and centered alignment.

    #>
    [CmdletBinding()]
    param(
        [string]$Color,
        [string]$BackGroundColor,
        [object] $FontSize,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [ValidateSet('normal', 'italic', 'oblique')][string] $FontStyle,
        [ValidateSet('normal', 'small-caps')][string] $FontVariant,
        [string] $FontFamily,
        [ValidateSet('left', 'center', 'right', 'justify')][string]  $Alignment,
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string]  $TextDecoration,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string]  $TextTransform,
        [ValidateSet('rtl')][string] $Direction,
        [switch] $LineBreak,
        [ValidateSet('normal', 'break-all', 'keep-all', 'break-word')][string] $WordBreak
    )
    $Style = @{
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
        'word-break'       = $WordBreak
    }
    # Removes empty, not needed values from hashtable. It's much easier then using if/else to verify for null/empty string
    Remove-EmptyValue -Hashtable $Style
    $Style
}