function New-HTMLText {
    [CmdletBinding()]
    param(
        [string[]] $Text,
        [RGBColors[]] $Color = @(),
        [RGBColors[]] $BackGroundColor = @(),
        [int[]] $FontSize = @(),
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string[]] $FontWeight = @(),
        [ValidateSet('normal', 'italic', 'oblique')][string[]] $FontStyle = @(),
        [ValidateSet('normal', 'small-caps')][string[]] $FontVariant = @(),
        [string[]] $FontFamily = @(),
        [ValidateSet('left', 'center', 'right', 'justify')][string[]] $Alignment = @(),
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string[]] $TextDecoration = @(),
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string[]] $TextTransform = @(),
        [ValidateSet('rtl')][string[]] $Direction = @(),
        [switch] $LineBreak,
        [switch] $SkipParagraph
    )
    #Write-Verbose 'New-HTMLText - Processing...'
    $DefaultColor = $Color[0]
    $DefaultFontSize = $FontSize[0]
    $DefaultFontWeight = if ($null -eq $FontWeight[0] ) { '' } else { $FontWeight[0] }
    $DefaultBackGroundColor = $BackGroundColor[0]
    $DefaultFontFamily = if ($null -eq $FontFamily[0] ) { '' } else { $FontFamily[0] }
    $DefaultFontStyle = if ($null -eq $FontStyle[0] ) { '' } else { $FontStyle[0] }
    $DefaultTextDecoration = if ($null -eq $TextDecoration[0]) { '' } else { $TextDecoration[0] }
    $DefaultTextTransform = if ($null -eq $TextTransform[0]) { '' } else { $TextTransform[0] }
    $DefaultFontVariant = if ($null -eq $FontVariant[0]) { '' } else { $FontVariant }
    $DefaultDirection = if ($null -eq $Direction[0]) { '' } else { $Direction[0] }
    $DefaultAlignment = if ($null -eq $Alignment[0]) { '' } else { $Alignment[0] }


    $Output = for ($i = 0; $i -lt $Text.Count; $i++) {
        if ($null -eq $FontWeight[$i]) {
            $ParamFontWeight = $DefaultFontWeight
        } else {
            $ParamFontWeight = $FontWeight[$i]
        }
        if ($null -eq $FontSize[$i]) {
            $ParamFontSize = $DefaultFontSize
        } else {
            $ParamFontSize = $FontSize[$i]
        }
        if ($null -eq $Color[$i]) {
            $ParamColor = $DefaultColor
        } else {
            $ParamColor = $Color[$i]
        }
        if ($null -eq $BackGroundColor[$i]) {
            $ParamBackGroundColor = $DefaultBackGroundColor
        } else {
            $ParamBackGroundColor = $BackGroundColor[$i]
        }
        if ($null -eq $FontFamily[$i]) {
            $ParamFontFamily = $DefaultFontFamily
        } else {
            $ParamFontFamily = $FontFamily[$i]
        }
        if ($null -eq $FontStyle[$i]) {
            $ParamFontStyle = $DefaultFontStyle
        } else {
            $ParamFontStyle = $FontStyle[$i]
        }

        if ($null -eq $TextDecoration[$i]) {
            $ParamTextDecoration = $DefaultTextDecoration
        } else {
            $ParamTextDecoration = $TextDecoration[$i]
        }

        if ($null -eq $TextTransform[$i]) {
            $ParamTextTransform = $DefaultTextTransform
        } else {
            $ParamTextTransform = $TextTransform[$i]
        }

        if ($null -eq $FontVariant[$i]) {
            $ParamFontVariant = $DefaultFontVariant
        } else {
            $ParamFontVariant = $FontVariant[$i]
        }
        if ($null -eq $Direction[$i]) {
            $ParamDirection = $DefaultDirection
        } else {
            $ParamDirection = $Direction[$i]
        }
        if ($null -eq $Alignment[$i]) {
            $ParamAlignment = $DefaultAlignment
        } else {
            $ParamAlignment = $Alignment[$i]
        }

        $newSpanTextSplat = @{}
        $newSpanTextSplat.Color = $ParamColor
        $newSpanTextSplat.BackGroundColor = $ParamBackGroundColor

        $newSpanTextSplat.FontSize = $ParamFontSize
        if ($ParamFontWeight -ne '') {
            $newSpanTextSplat.FontWeight = $ParamFontWeight
        }
        $newSpanTextSplat.FontFamily = $ParamFontFamily
        if ($ParamFontStyle -ne '') {
            $newSpanTextSplat.FontStyle = $ParamFontStyle
        }
        if ($ParamFontVariant -ne '') {
            $newSpanTextSplat.FontVariant = $ParamFontVariant
        }
        if ($ParamTextDecoration -ne '') {
            $newSpanTextSplat.TextDecoration = $ParamTextDecoration
        }
        if ($ParamTextTransform -ne '') {
            $newSpanTextSplat.TextTransform = $ParamTextTransform
        }
        if ($ParamDirection -ne '') {
            $newSpanTextSplat.Direction = $ParamDirection
        }
        if ($ParamAlignment -ne '') {
            $newSpanTextSplat.Alignment = $ParamAlignment
        }

        $newSpanTextSplat.LineBreak = $LineBreak
        New-HTMLSpanStyle @newSpanTextSplat {
            if ($Text[$i] -match "\[([^\[]*)\)") {
                # Covers markdown LINK  "[somestring](https://evotec.xyz)"
                $RegexBrackets1 = [regex] "\[([^\[]*)\]" # catch 'sometstring'
                $RegexBrackets2 = [regex] "\(([^\[]*)\)" # catch link
                $RegexBrackets3 = [regex] "\[([^\[]*)\)" # catch both somestring and link
                $Text1 = $RegexBrackets1.match($Text[$i]).Groups[1].value
                $Text2 = $RegexBrackets2.match($Text[$i]).Groups[1].value
                $Text3 = $RegexBrackets3.match($Text[$i]).Groups[0].value
                if ($Text1 -ne '' -and $Text2 -ne '') {
                    $Link = New-HTMLAnchor -HrefLink $Text2 -Text $Text1
                    $Text[$i].Replace($Text3, $Link)
                }
            } else {
                # Default
                $Text[$i]
            }
        }
    }

    if ($SkipParagraph) {
        $Output -join ''
    } else {
        New-HTMLTag -Tag 'div' {
            $Output
        }
    }
    if ($LineBreak) {
        New-HTMLTag -Tag 'br' -SelfClosing
    }
}