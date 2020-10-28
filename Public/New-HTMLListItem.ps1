function New-HTMLListItem {
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