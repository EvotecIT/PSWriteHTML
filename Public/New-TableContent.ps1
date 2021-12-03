function New-TableContent {
    <#
    .SYNOPSIS
    Provide a way to style or overwrite the table content with new content or style

    .DESCRIPTION
    Provide a way to style or overwrite the table content with new content or style

    .PARAMETER ColumnName
    Define column name to search where to replace the content or style. Conflicts with ColumnIndex. Choose one or the other.

    .PARAMETER ColumnIndex
    Define column index to search where to replace the content or style. Conflicts with ColumnName. Choose one or the other.

    .PARAMETER RowIndex
    Define row index to search where to replace the content or style.

    .PARAMETER Text
    Overwrite the text content of the cell. If not defined the cell will be styled only.

    .PARAMETER Color
    Pick one of the 800 colors or provide a hex color code.

    .PARAMETER BackGroundColor
    Pick one of the 800 colors or provide a hex color code.

    .PARAMETER FontSize
    Provide new font size. When skipped the font size will not be changed.

    .PARAMETER FontWeight
    Provide new font weight. When skipped the font weight will not be changed. Options are: 'normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900'

    .PARAMETER FontStyle
    Provide new font style. When skipped the font style will not be changed. Options are: 'normal', 'italic', 'oblique'

    .PARAMETER FontVariant
    Provide new font variant. When skipped the font variant will not be changed. Options are: 'normal', 'small-caps'

    .PARAMETER FontFamily
    Provide new font family. When skipped the font family will not be changed.

    .PARAMETER Alignment
    Provide new alignment. When skipped the alignment will not be changed. Options are: 'left', 'center', 'right', 'justify'

    .PARAMETER TextDecoration
    Provide new text decoration. When skipped the text decoration will not be changed. Options are: 'none', 'line-through', 'overline', 'underline'

    .PARAMETER TextTransform
    Provide new text transform. When skipped the text transform will not be changed. Options are: 'uppercase', 'lowercase', 'capitalize'

    .PARAMETER Direction
    Provide new direction. When skipped the direction will not be changed. Options are: 'rtl','ltr'. By default it's 'ltr'.

    .PARAMETER WordBreak
    Provide new word break. When skipped the word break will not be changed. Options are: 'normal', 'break-all', 'keep-all', 'break-word'

    .EXAMPLE
    New-HTML -TitleText "Example37 - Word Breaking" -FilePath "$PSScriptRoot\Example37.html" {
        New-HTMLSection -HeaderText "Word Break for whole table" -HeaderTextAlignment center -Content {
            New-HTMLTable -DataTable $(Get-Process | Select-Object -First 5) -WordBreak 'break-word'
        }
        New-HTMLSection -HeaderText "Word Break per column" -HeaderTextAlignment center -Content {
            New-HTMLTable -DataTable $(Get-Process | Select-Object -First 5) {
                New-TableContent -WordBreak break-all -ColumnName 'Path'
            }
        }
        New-HTMLSection -HeaderText "No word break" -HeaderTextAlignment center -Content {
            New-HTMLTable -DataTable $(Get-Process | Select-Object -First 5)
        }
    } -Online -ShowHTML

    .EXAMPLE
    $Values = @(
        [PSCustomObject] @{
            Test1 = 1
            Test2 = 2
            Test3 = 3
            Test4 = 1
        }
        [PSCustomObject] @{
            Test1 = 1
            Test2 = 2
            Test3 = 3
            Test4 = 1
        }
        [PSCustomObject] @{
            Test1 = 1
            Test2 = 2
            Test3 = 3
            Test4 = 2
        }
        [PSCustomObject] @{
            Test1 = 1
            Test2 = 2
            Test3 = 3
            Test4 = 1
        }
        [PSCustomObject] @{
            Test1 = 1
            Test2 = 2
            Test3 = 3
            Test4 = 1
        }
        [PSCustomObject] @{
            Test1 = 1
            Test2 = 2
            Test3 = 3
            Test4 = 2
        }
    )

    New-HTML -TitleText "Example41 - Table" -FilePath "$PSScriptRoot\Example41.html" {
        New-HTMLSection -HeaderText "Testing" -HeaderTextAlignment center -Content {
            New-HTMLTable -DataTable $Values {
                for ($i = 0; $i -le $Values.Count; $i++) {
                    if ($Values[$i].Test1 -ne $Values[$i].Test4) {
                        New-TableContent -BackGroundColor Red -ColumnName 'Test4' -RowIndex ($i+1)
                    }
                }
            }
        }
    } -Online -ShowHTML

    .NOTES
    General notes
    #>
    [alias('TableContent', 'EmailTableContent', 'New-HTMLTableContent')]
    [CmdletBinding()]
    param(
        [alias('ColumnNames', 'Names', 'Name')][string[]] $ColumnName,
        [int[]] $ColumnIndex,
        [int[]] $RowIndex,
        [string[]] $Text,
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
        [ValidateSet('rtl','ltr')][string] $Direction,
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
    Remove-EmptyValue -Hashtable $Style

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

Register-ArgumentCompleter -CommandName New-TableContent -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TableContent -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors