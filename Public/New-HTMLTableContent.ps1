function New-HTMLTableContent {
    [alias('TableContent', 'EmailTableContent')]
    [CmdletBinding()]
    param(
        [string[]] $Names,
        [alias('Row')][int] $RowIndex,
        [alias('Column')][int] $ColumnIndex,
        [string] $Title,
        [RGBColors] $Color,
        [RGBColors] $BackGroundColor,
        [int] $FontSize,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [ValidateSet('normal', 'italic', 'oblique')][string] $FontStyle,
        [ValidateSet('normal', 'small-caps')][string] $FontVariant,
        [string] $FontFamily,
        [ValidateSet('left', 'center', 'right', 'justify')][string] $Alignment,
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string] $TextDecoration,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransform,
        [ValidateSet('rtl')][string] $Direction
    )

    $Style = @{
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
    Remove-EmptyValues -Hashtable $Style

    if ($Title -and -not $Names) {
        #      $Type = 'TableContentFullRow'
    } elseif ($Title -and $Names) {
        $Type = 'TableContentMerge'
    } else {
        $Type = 'TableContentStyle'
    }

    [PSCustomObject]@{
        Type   = $Type
        Output = @{
            Names       = $Names
            Title       = $Title
            Row         = $RowIndex
            ColumnIndex = $ColumnIndex
            Style       = ConvertTo-HTMLStyle @Style
            # ColumnCount = $ColumnCount
        }
    }
}