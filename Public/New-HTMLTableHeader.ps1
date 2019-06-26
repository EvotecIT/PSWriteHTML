function New-HTMLTableHeader {
    [alias('TableHeader', 'EmailTableHeader')]
    [CmdletBinding()]
    param(
        [string[]] $Names,
        [string] $Title,
        [RGBColors[]] $Color = @(),
        [RGBColors[]] $BackGroundColor = @(),
        [int[]] $FontSize = @(),
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string[]] $FontWeight = @(),
        [ValidateSet('normal', 'italic', 'oblique')][string[]] $FontStyle = @(),
        [ValidateSet('normal', 'small-caps')][string[]] $FontVariant = @(),
        [string[]] $FontFamily = @(),
        [ValidateSet('left', 'center', 'right', 'justify')][string[]] $Alignment = @(),
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string[]] $TextDecoration = @(),
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string[]] $TextTransform = @(),
        [ValidateSet('rtl')][string[]] $Direction = @()
    )

    $DefaultColor = $Color[0]
    $DefaultFontSize = $FontSize[0]
    $DefaultFontWeight = if ($null -eq $FontWeight[0] ) { '' } else { $FontWeight[0] }
    $DefaultBackGroundColor = $BackGroundColor[0]
    $DefaultFontFamily = if ($null -eq $FontFamily[0] ) { '' } else { $FontFamily[0] }
    $DefaultFontStyle = if ($null -eq $FontStyle[0] ) { '' } else { $FontStyle[0] }
    $DefaultTextDecoration = if ($null -eq $TextDecoration[0]) { '' } else { $TextDecoration[0] }
    $DefaultTextTransform = if ($null -eq $TextTransform[0]) { '' } else { $TextTransform[0] }
    $DefaultFontVariant = if ($null -eq $FontVariant[0]) { '' } else { $FontVariant }
    $DefaultDirection = if ($null -eq $Direction[0]) { '' } else { $Direction[0] }
    $DefaultAlignment = if ($null -eq $Alignment[0]) { '' } else { $Alignment[0] }

    $Style = @{
        Color           = $DefaultColor
        BackGroundColor = $DefaultBackGroundColor
        FontSize        = $DefaultFontSize
        FontWeight      = $DefaultFontWeight
        FontStyle       = $DefaultFontStyle
        FontVariant     = $DefaultFontVariant
        FontFamily      = $DefaultFontFamily
        Alignment       = $DefaultAlignment
        TextDecoration  = $DefaultTextDecoration
        TextTransform   = $DefaultTextTransform
        Direction       = $DefaultDirection
    }
    #$Style = Remove-EmptyValues -Hashtable $Style

    [PSCustomObject]@{
        Type   = 'TableHeaderRow'
        Output = @{
            Names = $Names
            TItle = $Title
            <#
            Style = @{
                Color           = $Color
                BackGroundColor = $BackGroundColor
                FontSize        = $FontSize
                FontWeight      = $FontWeight
                FontStyle       = $FontStyle
                FontVariant     = $FontVariant
                FontFamily      = $FontFamily
                Alignment       = $Alignment
                TextDecoration  = $TextDecoration
                TextTransform   = $TextTransform
                Direction       = $Direction
            }
            #>
            #Style = ConvertTo-HTMLStyle @Style
        }
    }
}

function Remove-EmptyValues {
    param(
        [hashtable] $Hashtable
    )
    foreach ($_ in $Hashtable.Keys) {
        if ($null -eq $Hashtable[$_] -or $Hashtable[$_] -eq '') {
            $Hashtable.Remove($_)
        }
    }
    return $Hashtable
}

function ConvertTo-HTMLStyle {
    [CmdletBinding()]
    param(
        [nullable[RGBColors]] $Color,
        [nullable[RGBColors]] $BackGroundColor,
        [int] $FontSize,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [ValidateSet('normal', 'italic', 'oblique')][string] $FontStyle,
        [ValidateSet('normal', 'small-caps')][string] $FontVariant,
        [string] $FontFamily,
        [ValidateSet('left', 'center', 'right', 'justify')][string]  $Alignment,
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string]  $TextDecoration,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string]  $TextTransform,
        [ValidateSet('rtl')][string] $Direction,
        [switch] $LineBreak
    )
    if ($FontSize -eq 0) {
        $Size = ''
    } else {
        $size = "$($FontSize)px"
    }
    $Style = @{
        style = @{
            'color'            = ConvertFrom-Color -Color $Color
            'background-color' = ConvertFrom-Color -Color $BackGroundColor
            'font-size'        = $Size
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
    return $Style
}