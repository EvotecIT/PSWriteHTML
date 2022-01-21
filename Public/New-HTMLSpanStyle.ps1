function New-HTMLSpanStyle {
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