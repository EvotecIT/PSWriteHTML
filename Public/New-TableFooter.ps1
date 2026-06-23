function New-TableFooter {
    <#
    .SYNOPSIS
    Creates a static table footer row.

    .DESCRIPTION
    Creates a footer row for New-HTMLTable. Use Values when the footer follows the rendered column order, or ValueByColumn when footer values should be assigned by column name.

    .PARAMETER Values
    Footer cell values in rendered column order.

    .PARAMETER ValueByColumn
    Footer cell values keyed by rendered column name.

    .PARAMETER Color
    Pick one of the 800 colors or provide a hex color code.

    .PARAMETER BackGroundColor
    Pick one of the 800 colors or provide a hex color code.

    .PARAMETER FontSize
    Provide new font size.

    .PARAMETER FontWeight
    Provide new font weight.

    .PARAMETER Alignment
    Provide new text alignment.

    .EXAMPLE
    New-HTMLTable -DataTable $Data {
        New-TableFooter -ValueByColumn @{ Name = 'Total'; Amount = 42 } -FontWeight bold
    }
    #>
    [alias('TableFooter', 'EmailTableFooter', 'New-HTMLTableFooter')]
    [CmdletBinding()]
    param(
        [object[]] $Values,
        [System.Collections.IDictionary] $ValueByColumn,
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
        [ValidateSet('rtl', 'ltr')][string] $Direction,
        [ValidateSet('baseline', 'sub', 'super', 'text-top', 'text-bottom', 'middle', 'top', 'bottom')][string] $VerticalAlignment,
        [ValidateSet('none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset')][string] $BorderStyle,
        [object] $BorderWidth,
        [string] $BorderColor
    )

    $Style = @{
        Color             = $Color
        BackGroundColor   = $BackGroundColor
        FontSize          = $FontSize
        FontWeight        = $FontWeight
        FontStyle         = $FontStyle
        FontVariant       = $FontVariant
        FontFamily        = $FontFamily
        Alignment         = $Alignment
        TextDecoration    = $TextDecoration
        TextTransform     = $TextTransform
        Direction         = $Direction
        VerticalAlignment = $VerticalAlignment
        BorderStyle       = $BorderStyle
        BorderWidth       = $BorderWidth
        BorderColor       = $BorderColor
    }
    Remove-EmptyValue -Hashtable $Style

    [PSCustomObject]@{
        Type   = 'TableFooter'
        Output = [ordered]@{
            Values        = $Values
            ValueByColumn = $ValueByColumn
            Style         = ConvertTo-HTMLStyle @Style
        }
    }
}

Register-ArgumentCompleter -CommandName New-TableFooter -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TableFooter -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TableFooter -ParameterName BorderColor -ScriptBlock $Script:ScriptBlockColors
