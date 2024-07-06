function New-HTMLList {
    <#
    .SYNOPSIS
    Creates an HTML list with customizable styling options.

    .DESCRIPTION
    The New-HTMLList function generates an HTML list with various styling options such as color, font size, font weight, alignment, and more.

    .PARAMETER ListItems
    Specifies the list items to be included in the HTML list.

    .PARAMETER Type
    Specifies the type of list to create. Valid values are 'Unordered' (default) and 'Ordered'.

    .PARAMETER Color
    Specifies the color of the text in the list.

    .PARAMETER BackGroundColor
    Specifies the background color of the list.

    .PARAMETER FontSize
    Specifies the font size of the text in the list.

    .PARAMETER FontWeight
    Specifies the weight of the font. Valid values include 'normal', 'bold', 'bolder', 'lighter', and numeric values from 100 to 900.

    .PARAMETER FontStyle
    Specifies the style of the font. Valid values are 'normal', 'italic', and 'oblique'.

    .PARAMETER FontVariant
    Specifies the variant of the font. Valid values are 'normal' and 'small-caps'.

    .PARAMETER FontFamily
    Specifies the font family for the text in the list.

    .PARAMETER Alignment
    Specifies the alignment of the text within the list. Valid values are 'left', 'center', 'right', and 'justify'.

    .PARAMETER TextDecoration
    Specifies the decoration of the text. Valid values are 'none', 'line-through', 'overline', and 'underline'.

    .PARAMETER TextTransform
    Specifies the transformation of the text. Valid values are 'uppercase', 'lowercase', and 'capitalize'.

    .PARAMETER Direction
    Specifies the direction of the text. Valid value is 'rtl' (right-to-left).

    .PARAMETER LineBreak
    Indicates whether to include line breaks between list items.

    .PARAMETER Reversed
    Indicates whether the list should be displayed in reverse order.

    .EXAMPLE
    New-HTMLList -ListItems { 'Item 1', 'Item 2', 'Item 3' } -Type Unordered -Color 'blue' -FontSize 12 -FontWeight 'bold' -Alignment 'center'

    Creates an unordered HTML list with three items ('Item 1', 'Item 2', 'Item 3') displayed in blue color, font size 12, bold font weight, and centered alignment.

    .EXAMPLE
    New-HTMLList -ListItems { 'Apple', 'Banana', 'Cherry' } -Type Ordered -FontFamily 'Arial' -TextDecoration 'underline' -Direction 'rtl'

    Creates an ordered HTML list with three items ('Apple', 'Banana', 'Cherry') using Arial font family, underlined text decoration, and right-to-left text direction.

    #>
    [alias('EmailList')]
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)][ScriptBlock]$ListItems,
        [ValidateSet('Unordered', 'Ordered')] [string] $Type = 'Unordered',
        [string] $Color,
        [string] $BackGroundColor,
        [object] $FontSize,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [ValidateSet('normal', 'italic', 'oblique')][string] $FontStyle,
        [ValidateSet('normal', 'small-caps')][string] $FontVariant,
        [string] $FontFamily,
        [ValidateSet('left', 'center', 'right', 'justify')][string] $Alignment,
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string] $TextDecoration,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransform,
        [ValidateSet('rtl')][string] $Direction,
        [switch] $LineBreak,
        [switch] $Reversed
    )

    $newHTMLSplat = @{ }
    if ($Alignment) {
        $newHTMLSplat.Alignment = $Alignment
    }
    if ($FontSize) {
        $newHTMLSplat.FontSize = $FontSize
    }
    if ($TextTransform) {
        $newHTMLSplat.TextTransform = $TextTransform
    }
    if ($Color) {
        $newHTMLSplat.Color = $Color
    }
    if ($FontFamily) {
        $newHTMLSplat.FontFamily = $FontFamily
    }
    if ($Direction) {
        $newHTMLSplat.Direction = $Direction
    }
    if ($FontStyle) {
        $newHTMLSplat.FontStyle = $FontStyle
    }
    if ($TextDecoration) {
        $newHTMLSplat.TextDecoration = $TextDecoration
    }
    if ($BackGroundColor) {
        $newHTMLSplat.BackGroundColor = $BackGroundColor
    }
    if ($FontVariant) {
        $newHTMLSplat.FontVariant = $FontVariant
    }
    if ($FontWeight) {
        $newHTMLSplat.FontWeight = $FontWeight
    }
    if ($LineBreak) {
        $newHTMLSplat.LineBreak = $LineBreak
    }

    [bool] $SpanRequired = $false
    foreach ($Entry in $newHTMLSplat.GetEnumerator()) {
        if (($Entry.Value | Measure-Object).Count -gt 0) {
            $SpanRequired = $true
            break
        }
    }

    $ListAttributes = [ordered] @{}
    if ($Reversed) {
        $ListAttributes['reversed'] = 'reversed'
    }
    if ($ListItems) {
        [string] $List = @(
            if ($Type -eq 'Unordered') {
                New-HTMLTag -Tag 'ul' -Attributes $ListAttributes {
                    Invoke-Command -ScriptBlock $ListItems
                }
            } else {
                New-HTMLTag -Tag 'ol' -Attributes $ListAttributes {
                    Invoke-Command -ScriptBlock $ListItems
                }
            }
        )
        if ($SpanRequired) {
            New-HTMLSpanStyle @newHTMLSplat {
                $List
            }
        } else {
            $List
        }
    } else {
        Write-Warning "New-HTMLList - No content provided. Please use New-HTMLListItem inside New-HTMLList."
    }
}

Register-ArgumentCompleter -CommandName New-HTMLList -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLList -ParameterName BackGroundColor -ScriptBlock $Script:ScriptBlockColors