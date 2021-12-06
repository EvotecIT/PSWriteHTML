function New-TableConditionGroup {
    [alias('EmailTableConditionGroup', 'TableConditionGroup', 'New-HTMLTableConditionGroup')]
    [CmdletBinding()]
    param(
        [scriptblock] $Conditions,
        [ValidateSet('AND', 'OR', 'NONE')][string] $Logic = 'AND',
        [string[]] $HighlightHeaders,
        [switch] $Row,
        [switch] $Inline,
        # Style for PASS
        [string]$Color,
        [string]$BackgroundColor,
        [object] $FontSize,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [ValidateSet('normal', 'italic', 'oblique')][string] $FontStyle,
        [ValidateSet('normal', 'small-caps')][string] $FontVariant,
        [string] $FontFamily,
        [ValidateSet('left', 'center', 'right', 'justify')][string] $Alignment,
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string] $TextDecoration,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransform,
        [ValidateSet('rtl')][string] $Direction,
        # Style for FAIL
        [string]$FailColor,
        [string]$FailBackgroundColor,
        [object] $FailFontSize,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FailFontWeight,
        [ValidateSet('normal', 'italic', 'oblique')][string] $FailFontStyle,
        [ValidateSet('normal', 'small-caps')][string] $FailFontVariant,
        [string] $FailFontFamily,
        [ValidateSet('left', 'center', 'right', 'justify')][string] $FailAlignment,
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string] $FailTextDecoration,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $FailTextTransform,
        [ValidateSet('rtl')][string] $FailDirection
    )
    if ($Conditions) {
        $Script:HTMLSchema.Features.DataTablesConditions = $true

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

        $FailStyle = @{
            Color           = $FailColor
            BackGroundColor = $FailBackGroundColor
            FontSize        = $FailFontSize
            FontWeight      = $FailFontWeight
            FontStyle       = $FailFontStyle
            FontVariant     = $FailFontVariant
            FontFamily      = $FailFontFamily
            Alignment       = $FailAlignment
            TextDecoration  = $FailTextDecoration
            TextTransform   = $FailTextTransform
            Direction       = $FailDirection
        }
        Remove-EmptyValue -Hashtable $FailStyle

        $TableConditionGroup = [PSCustomObject] @{
            ConditionType    = 'ConditionGroup'
            Style            = ConvertTo-HTMLStyle @Style
            FailStyle        = ConvertTo-HTMLStyle @FailStyle
            Conditions       = & $Conditions
            Row              = $Row
            Logic            = $Logic
            HighlightHeaders = $HighlightHeaders
            DateTimeFormat   = $DateTimeFormat
        }
        [PSCustomObject] @{
            Type   = if ($Inline) { 'TableConditionGroupInline' } else { 'TableConditionGroup' }
            Output = $TableConditionGroup
        }
    }
}

Register-ArgumentCompleter -CommandName New-TableConditionGroup -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TableConditionGroup -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TableConditionGroup -ParameterName FailColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TableConditionGroup -ParameterName FailBackgroundColor -ScriptBlock $Script:ScriptBlockColors