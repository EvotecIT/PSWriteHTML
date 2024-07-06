function New-TableHeader {
    <#
    .SYNOPSIS
    Creates a new table header with specified styling options.

    .DESCRIPTION
    The New-TableHeader function creates a new table header with customizable styling options such as font size, color, alignment, and more.

    .EXAMPLE
    New-TableHeader -Names "Name", "Age", "Email" -Title "Employee Information" -Color "black" -BackGroundColor "lightgray" -FontSize 14 -FontWeight "bold" -FontStyle "normal" -FontVariant "normal" -FontFamily "Arial" -Alignment "center" -TextDecoration "none" -TextTransform "uppercase" -Direction "ltr" -AddRow -ColumnCount 3 -Display "all"
    Creates a table header with specified column names, title, and styling options.

    .PARAMETER Names
    Specifies an array of column names for the table header.

    .PARAMETER Title
    Specifies the title of the table header.

    .PARAMETER Color
    Specifies the text color of the table header.

    .PARAMETER BackGroundColor
    Specifies the background color of the table header.

    .PARAMETER FontSize
    Specifies the font size of the table header.

    .PARAMETER FontWeight
    Specifies the font weight of the table header.

    .PARAMETER FontStyle
    Specifies the font style of the table header.

    .PARAMETER FontVariant
    Specifies the font variant of the table header.

    .PARAMETER FontFamily
    Specifies the font family of the table header.

    .PARAMETER Alignment
    Specifies the alignment of the table header.

    .PARAMETER TextDecoration
    Specifies the text decoration of the table header.

    .PARAMETER TextTransform
    Specifies the text transformation of the table header.

    .PARAMETER Direction
    Specifies the text direction of the table header.

    .PARAMETER AddRow
    Switch parameter to add an additional row to the table header.

    .PARAMETER ColumnCount
    Specifies the number of columns in the table header.

    .PARAMETER Display
    Specifies the display settings for the table header.

    #>
    [alias('TableHeader', 'EmailTableHeader','New-HTMLTableHeader')]
    [CmdletBinding()]
    param(
        [string[]] $Names,
        [string] $Title,
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
        [switch] $AddRow,
        [int] $ColumnCount,
        [ValidateSet(
            'all',
            'none',
            'never',
            'desktop',
            'not-desktop',
            'tablet-l',
            'tablet-p',
            'mobile-l',
            'mobile-p',
            'min-desktop',
            'max-desktop',
            'tablet',
            'not-tablet',
            'min-tablet',
            'max-tablet',
            'not-tablet-l',
            'min-tablet-l',
            'max-tablet-l',
            'not-tablet-p',
            'min-tablet-p',
            'max-tablet-p',
            'mobile',
            'not-mobile',
            'min-mobile',
            'max-mobile',
            'not-mobile-l',
            'min-mobile-l',
            'max-mobile-l',
            'not-mobile-p',
            'min-mobile-p',
            'max-mobile-p'
        )][string] $ResponsiveOperations

    )
    if ($AddRow) {
        Write-Warning "New-HTMLTableHeader - Using AddRow switch is deprecated. It's not nessecary anymore. Just use Title alone. It will be removed later on."
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
    }
    Remove-EmptyValue -Hashtable $Style

    if (($AddRow -and $Title) -or ($Title -and -not $Names)) {
        $Type = 'TableHeaderFullRow'
    } elseif ((-not $AddRow -and $Title) -or ($Title -and $Names)) {
        $Type = 'TableHeaderMerge'
    } elseif ($Names -and $ResponsiveOperations) {
        $Type = 'TableHeaderResponsiveOperations'
    } elseif ($ResponsiveOperations) {
        Write-Warning 'New-HTMLTableHeader - ResponsiveOperations require Names (ColumnNames) to apply operation to.'
        return
    } else {
        $Type = 'TableHeaderStyle'
    }

    [PSCustomObject]@{
        Type   = $Type
        Output = @{
            Names                = $Names
            ResponsiveOperations = $ResponsiveOperations
            Title                = $Title
            Style                = ConvertTo-HTMLStyle @Style
            ColumnCount          = $ColumnCount
        }
    }
}

Register-ArgumentCompleter -CommandName New-TableHeader -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TableHeader -ParameterName BackGroundColor -ScriptBlock $Script:ScriptBlockColors