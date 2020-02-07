function New-TableContent {
    [alias('TableContent', 'EmailTableContent', 'New-HTMLTableContent')]
    [CmdletBinding()]
    param(
        [alias('ColumnNames', 'Names', 'Name')][string[]] $ColumnName,
        [int[]] $ColumnIndex,
        [int[]] $RowIndex,
        [string[]] $Text,
        [string] $Color,
        [string] $BackGroundColor,
        [int] $FontSize,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [ValidateSet('normal', 'italic', 'oblique')][string] $FontStyle,
        [ValidateSet('normal', 'small-caps')][string] $FontVariant,
        [string] $FontFamily,
        [ValidateSet('left', 'center', 'right', 'justify')][string] $Alignment,
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string] $TextDecoration,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransform,
        [ValidateSet('rtl')][string] $Direction,
        [ValidateSet('normal', 'break-all', 'keep-all', 'break-word')][string] $WordBreak
    )
    if ($WordBreak -eq '' -or $WordBreak -eq 'normal') {
        $WordBreakStyle = ''
    } else {
        $WordBreakStyle = $WordBreak
    }

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
        WordBreak       = $WordBreakStyle
    }
    Remove-EmptyValues -Hashtable $Style

    [PSCustomObject]@{
        Type   = 'TableContentStyle'
        Output = @{
            Name        = $ColumnName
            Text        = $Text
            RowIndex    = $RowIndex | Sort-Object
            ColumnIndex = $ColumnIndex | Sort-Object
            Style       = ConvertTo-HTMLStyle @Style
            Used        = $false
        }
    }
}

Register-ArgumentCompleter -CommandName New-TableContent -ParameterName Color -ScriptBlock { $Script:RGBColors.Keys }
Register-ArgumentCompleter -CommandName New-TableContent -ParameterName BackgroundColor -ScriptBlock { $Script:RGBColors.Keys }