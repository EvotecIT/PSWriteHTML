function New-TableConditionGroup {
    [alias('EmailTableConditionGroup', 'TableConditionGroup', 'New-HTMLTableConditionGroup')]
    [CmdletBinding()]
    param(
        [scriptblock] $Conditions,
        [ValidateSet('AND', 'OR')][string] $Logic = 'AND',
        [string[]] $HighlightHeaders,

        [switch] $Row,
        [string]$Color,
        [string]$BackgroundColor,
        [int] $FontSize,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [ValidateSet('normal', 'italic', 'oblique')][string] $FontStyle,
        [ValidateSet('normal', 'small-caps')][string] $FontVariant,
        [string] $FontFamily,
        [ValidateSet('left', 'center', 'right', 'justify')][string] $Alignment,
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string] $TextDecoration,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransform,
        [ValidateSet('rtl')][string] $Direction,
        [switch] $Inline,
        [switch] $CaseInsensitive
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

        $TableConditionGroup = [PSCustomObject] @{
            Style            = ConvertTo-HTMLStyle @Style
            Conditions       = & $Conditions
            Row              = $Row
            Logic            = $Logic
            #Color            = $Color
            #BackgroundColor  = $BackgroundColor
            HighlightHeaders = $HighlightHeaders
            CaseInsensitive  = $CaseInsensitive.IsPresent
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