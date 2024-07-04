function New-TableConditionGroup {
    <#
    .SYNOPSIS
    Creates a new table condition group with specified conditions and styling options.

    .DESCRIPTION
    This function creates a new table condition group with the specified conditions and allows customization of the styling options for both pass and fail conditions.

    .PARAMETER Conditions
    Specifies the conditions to be applied within the condition group.

    .PARAMETER Logic
    Specifies the logic to be used for combining conditions. Valid values are 'AND', 'OR', or 'NONE'.

    .PARAMETER HighlightHeaders
    Specifies an array of headers to highlight based on the conditions.

    .PARAMETER Row
    Switch parameter to indicate if the styling should be applied to the entire row.

    .PARAMETER Inline
    Switch parameter to indicate if the styling should be applied inline.

    .PARAMETER Color
    Specifies the text color for pass conditions.

    .PARAMETER BackgroundColor
    Specifies the background color for pass conditions.

    .PARAMETER FontSize
    Specifies the font size for pass conditions.

    .PARAMETER FontWeight
    Specifies the font weight for pass conditions.

    .PARAMETER FontStyle
    Specifies the font style for pass conditions.

    .PARAMETER FontVariant
    Specifies the font variant for pass conditions.

    .PARAMETER FontFamily
    Specifies the font family for pass conditions.

    .PARAMETER Alignment
    Specifies the alignment for pass conditions.

    .PARAMETER TextDecoration
    Specifies the text decoration for pass conditions.

    .PARAMETER TextTransform
    Specifies the text transformation for pass conditions.

    .PARAMETER Direction
    Specifies the text direction for pass conditions.

    .PARAMETER FailColor
    Specifies the text color for fail conditions.

    .PARAMETER FailBackgroundColor
    Specifies the background color for fail conditions.

    .PARAMETER FailFontSize
    Specifies the font size for fail conditions.

    .PARAMETER FailFontWeight
    Specifies the font weight for fail conditions.

    .PARAMETER FailFontStyle
    Specifies the font style for fail conditions.

    .PARAMETER FailFontVariant
    Specifies the font variant for fail conditions.

    .PARAMETER FailFontFamily
    Specifies the font family for fail conditions.

    .PARAMETER FailAlignment
    Specifies the alignment for fail conditions.

    .PARAMETER FailTextDecoration
    Specifies the text decoration for fail conditions.

    .PARAMETER FailTextTransform
    Specifies the text transformation for fail conditions.

    .PARAMETER FailDirection
    Specifies the text direction for fail conditions.

    .EXAMPLE
    New-TableConditionGroup -Conditions { 
        New-HTMLTableCondition -Name 'Test1' -Value 1 -ComparisonType number
        New-HTMLTableCondition -Name 'Test2' -Value 2 -ComparisonType number
    } -Logic 'OR' -HighlightHeaders 'Test1', 'Test2', 'DisplayName', 'DomainName' -Color 'Green' -BackgroundColor 'LightGreen' -FontSize 12 -FontWeight 'bold' -Alignment 'center'

    Description:
    Creates a new table condition group with specified conditions, logic, highlighted headers, and styling options for pass conditions.

    .NOTES
    Additional notes about the function.
    #>
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