function EmailBody {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][ScriptBlock] $EmailBody,
        [string] $Color,
        [string] $BackGroundColor,
        [alias('Size')][int] $FontSize,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [ValidateSet('normal', 'italic', 'oblique')][string] $FontStyle,
        [ValidateSet('normal', 'small-caps')][string] $FontVariant,
        [string] $FontFamily ,
        [ValidateSet('left', 'center', 'right', 'justify')][string] $Alignment,
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string] $TextDecoration,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransform,
        [ValidateSet('rtl')][string] $Direction
    )

    $newHTMLSplat = @{}
    if ($Alignment) {
        $newHTMLSplat.Alignment = $Alignment
    }
    if ($FontSize) {
        $newHTMLSplat.FontSize = $FontSize
    }
    if ($TextTransform) {
        $newHTMLSplat.TextTransform = $TextTransform
    }
    if ($Color) {
        $newHTMLSplat.Color = $Color
    }
    if ($FontFamily) {
        $newHTMLSplat.FontFamily = $FontFamily
    }
    if ($Direction) {
        $newHTMLSplat.Direction = $Direction
    }
    if ($FontStyle) {
        $newHTMLSplat.FontStyle = $FontStyle
    }
    if ($TextDecoration) {
        $newHTMLSplat.TextDecoration = $TextDecoration
    }
    if ($BackGroundColor) {
        $newHTMLSplat.BackGroundColor = $BackGroundColor
    }
    if ($FontVariant) {
        $newHTMLSplat.FontVariant = $FontVariant
    }
    if ($FontWeight) {
        $newHTMLSplat.FontWeight = $FontWeight
    }
    <#
    [bool] $SpanRequired = $false
    foreach ($Entry in $newHTMLSplat.GetEnumerator()) {
        if (($Entry.Value | Measure-Object).Count -gt 0) {
            $SpanRequired = $true
            break
        }
    }
    #>
    if ($newHTMLSplat.Count -gt 0) {
        $SpanRequired = $true
    } else {
        $SpanRequired = $false
    }
    if ($SpanRequired) {
        New-HTMLSpanStyle @newHTMLSplat {
            Invoke-Command -ScriptBlock $EmailBody
        }
    } else {
        Invoke-Command -ScriptBlock $EmailBody
    }
}

Register-ArgumentCompleter -CommandName EmailBody -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName EmailBody -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors