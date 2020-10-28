function New-HTMLList {
    [alias('EmailList')]
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)][ScriptBlock]$ListItems,
        [ValidateSet('Unordered', 'Ordered')] [string] $Type = 'Unordered',
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
        [switch] $LineBreak,
        [switch] $Reversed
    )

    $newHTMLSplat = @{ }
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
        if (($Entry.Value | Measure-Object).Count -gt 0) {
            $SpanRequired = $true
            break
        }
    }

    $ListAttributes = [ordered] @{}
    if ($Reversed) {
        $ListAttributes['reversed'] = 'reversed'
    }
    if ($ListItems) {
        [string] $List = @(
            if ($Type -eq 'Unordered') {
                New-HTMLTag -Tag 'ul' -Attributes $ListAttributes {
                    Invoke-Command -ScriptBlock $ListItems
                }
            } else {
                New-HTMLTag -Tag 'ol' -Attributes $ListAttributes {
                    Invoke-Command -ScriptBlock $ListItems
                }
            }
        )
        if ($SpanRequired) {
            New-HTMLSpanStyle @newHTMLSplat {
                $List
            }
        } else {
            $List
        }
    } else {
        Write-Warning "New-HTMLList - No content provided. Please use New-HTMLListItem inside New-HTMLList."
    }
}

Register-ArgumentCompleter -CommandName New-HTMLList -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLList -ParameterName BackGroundColor -ScriptBlock $Script:ScriptBlockColors