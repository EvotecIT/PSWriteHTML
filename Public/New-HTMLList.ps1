function New-HTMLList {
    [CmdletBinding()]
    param(
        [ScriptBlock]$ListItems,
        [ValidateSet('Unordered', 'Ordered')] [string] $Type = 'Unordered',
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
        [switch] $LineBreak
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
    if ($LineBreak) {
        $newHTMLSplat.LineBreak = $LineBreak
    }

    [bool] $SpanRequired = $false
    foreach ($Entry in $newHTMLSplat.GetEnumerator()) {
        if ((Get-ObjectCount -Object $Entry.Value) -gt 0) {
            $SpanRequired = $true
            break
        }
    }

    if ($SpanRequired) {
        New-HTMLSpanStyle @newHTMLSplat {
            if ($Type -eq 'Unordered') {
                New-HTMLTag -Tag 'ul' {
                    Invoke-Command -ScriptBlock $ListItems
                }
            } else {
                New-HTMLTag -Tag 'ol' {
                    Invoke-Command -ScriptBlock $ListItems
                }
            }
        }
    } else {
        if ($Type -eq 'Unordered') {
            New-HTMLTag -Tag 'ul' {
                Invoke-Command -ScriptBlock $ListItems
            }
        } else {
            New-HTMLTag -Tag 'ol' {
                Invoke-Command -ScriptBlock $ListItems
            }
        }
    }
}