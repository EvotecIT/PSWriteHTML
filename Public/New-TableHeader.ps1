function New-TableHeader {
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