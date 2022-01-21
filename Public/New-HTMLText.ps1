function New-HTMLText {
    <#
    .SYNOPSIS
    This function provides ability to add new text to the HTML file.

    .DESCRIPTION
    This function provides ability to add new text to the HTML file, with colors, fonts and other styling features.
    It is used to add text to the HTML file with proper styling and formatting.
    Please keep in mind that if parameter is not provided the defaults will be used.
    The defaults can be from the body itself, or from section or other parts of HTML depending on where the text is added.

    .PARAMETER TextBlock
    Defines ability to use text block instead of array

    .PARAMETER Text
    Provide text or text array to be added to the HTML file.

    .PARAMETER Color
    Pick one of the 800 colors or provide a hex color code.

    .PARAMETER BackGroundColor
    Pick one of the 800 colors or provide a hex color code.

    .PARAMETER FontSize
    Provide font size. When skipped the default font size will be used.

    .PARAMETER LineHeight
    Provide line height. When skipped the default line height will be used.

    .PARAMETER FontWeight
    Provide font weight. When skipped the default font weight will be used. Options are: 'normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900'

    .PARAMETER FontStyle
    Provide font style. When skipped the default font style will be used. Options are: 'normal', 'italic', 'oblique'

    .PARAMETER FontVariant
    Provide font variant. When skipped the default font variant will be used. Options are: 'normal', 'small-caps'

    .PARAMETER FontFamily
    Provide font family. When skipped the default font family will be used.

    .PARAMETER Alignment
    Provide alignment. When skipped the default alignment will be used. Options are: 'left', 'right', 'center', 'justify'

    .PARAMETER TextDecoration
    Provide text decoration. When skipped the default text decoration will be used. Options are: 'none', 'line-through', 'overline', 'underline'

    .PARAMETER TextTransform
    Provide text transform. When skipped the default text transform will be used. Options are: 'uppercase', 'lowercase', 'capitalize'

    .PARAMETER Direction
    Provide direction. When skipped the direction will not be changed. Options are: 'rtl','ltr'. By default it's 'ltr'.

    .PARAMETER LineBreak
    Decides whether to add line break at the end of the text or not.

    .PARAMETER SkipParagraph
    Skips adding div tag to make sure text is not wrapped in it. By default it wraps all text in div tag.

    .PARAMETER Display
    Allows configuring CSS display property. The display property specifies the display behavior (the type of rendering box) of an element.
    Options are: 'none', 'inline', 'block', 'inline-block', 'contents','flex', 'grid', 'inline-flex', 'inline-grid', 'inline-table', 'list-item', 'run-in',
    'table', 'table-caption', 'table-column-group', 'table-header-group', 'table-footer-group', 'table-row-group', 'table-cell', 'table-column', 'table-row'

    .PARAMETER Opacity
    The opacity property sets the opacity level for an element. Value between 0 and 1. 1 is default.

    .EXAMPLE
    New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example34_01.html" {
        New-HTMLHeader {
            New-HTMLText -Text "Date of this report $(Get-Date)" -Color Blue -Alignment right
        }
        New-HTMLMain {
            New-HTMLTab -TabName 'Test' {
                New-HTMLSection -HeaderText '0 section' {
                    New-HTMLPanel {
                        New-HTMLTable -DataTable $Processes -HideFooter
                    }
                    New-HTMLPanel {
                        New-HTMLTable -DataTable $Processes -HideFooter
                    }
                    New-HTMLPanel {
                        New-HTMLTable -DataTable $Processes -HideFooter -Simplify
                    }
                    New-HTMLPanel {
                        New-HTMLTable -DataTable $Processes -HideFooter
                    }
                }
            }
            New-HTMLTab -TabName 'Test5' {
                New-HTMLSection -HeaderText '1 section' {
                    New-HTMLPanel {
                        New-HTMLTable -DataTable $Processes -HideFooter
                    }
                    New-HTMLPanel {
                        New-HTMLTable -DataTable $Processes -HideFooter
                        # New-HTMLTable -DataTable $Processes -HideFooter
                    }
                    New-HTMLPanel {
                        New-HTMLTable -DataTable $Processes -HideFooter
                    }
                }
            }
        }
        New-HTMLFooter {
            New-HTMLText -Text "Date of this report $(Get-Date)" -Color Blue -Alignment right
        }
    } -Online -ShowHTML

    .EXAMPLE

    .NOTES
    General notes
    #>
    [alias('HTMLText', 'Text', 'EmailText')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][ScriptBlock] $TextBlock,
        [string[]] $Text,
        [string[]] $Color = @(),
        [string[]] $BackGroundColor = @(),
        [alias('Size')][object[]] $FontSize = @(),
        [string[]] $LineHeight = @(),
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string[]] $FontWeight = @(),
        [ValidateSet('normal', 'italic', 'oblique')][string[]] $FontStyle = @(),
        [ValidateSet('normal', 'small-caps')][string[]] $FontVariant = @(),
        [string[]] $FontFamily = @(),
        [ValidateSet('left', 'center', 'right', 'justify')][string[]] $Alignment = @(),
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string[]] $TextDecoration = @(),
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string[]] $TextTransform = @(),
        [ValidateSet('rtl', 'ltr')][string[]] $Direction = @(),
        [switch] $LineBreak,
        [switch] $SkipParagraph,
        [ValidateSet(
            'none', 'inline', 'block', 'inline-block', 'contents',
            'flex', 'grid', 'inline-flex', 'inline-grid', 'inline-table', 'list-item', 'run-in',
            'table', 'table-caption', 'table-column-group', 'table-header-group', 'table-footer-group',
            'table-row-group', 'table-cell', 'table-column', 'table-row'
        )][string[]] $Display = @(),
        [double[]] $Opacity = @()#,
        #[string] $Margin = '5px'
    )
    $Script:HTMLSchema.Features.DefaultText = $true

    if ($TextBlock) {
        $Text = (Invoke-Command -ScriptBlock $TextBlock)
    }

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
    $DefaultLineHeight = if ($null -eq $LineHeight[0]) { '' } else { $LineHeight[0] }
    $DefaultDisplay = if ($null -eq $Display[0]) { '' } else { $Display[0] }
    $DefaultOpacity = if ($null -eq $Opacity[0]) { '' } else { $Opacity[0] }

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
        if ($null -eq $LineHeight[$i]) {
            $ParamLineHeight = $DefaultLineHeight
        } else {
            $ParamLineHeight = $LineHeight[$i]
        }
        if ($null -eq $Display[$i]) {
            $ParamDisplay = $DefaultDisplay
        } else {
            $ParamDisplay = $Display[$i]
        }
        if ($null -eq $Opacity[$i]) {
            $ParamOpacity = $DefaultOpacity
        } else {
            $ParamOpacity = $Opacity[$i]
        }

        $newSpanTextSplat = @{ }
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
        if ($ParamLineHeight -ne '') {
            $newSpanTextSplat.LineHeight = $ParamLineHeight
        }
        if ($ParamDisplay) {
            $newSpanTextSplat.display = $ParamDisplay
        }
        if ($ParamOpacity) {
            $newSpanTextSplat.opacity = $ParamOpacity
        }

        $newSpanTextSplat.LineBreak = $LineBreak
        New-HTMLSpanStyle @newSpanTextSplat {
            $FindMe = [regex]::Matches($Text[$i], "\[[^\]]+\]\(\S+\)")
            if ($FindMe) {
                foreach ($find in $FindMe) {
                    $LinkName = ([regex]::Match($Find.value, "[^\[]+(?=\])")).Value
                    $LinkURL = ([regex]::Match($Find.value, "(?<=\().+(?=\))")).Value
                    $Link = New-HTMLAnchor -HrefLink $LinkURL -Text $LinkName
                    $Text[$i] = $Text[$i].Replace($find.value, $Link)
                }
                $Text[$i]
            } else {
                # Default
                $Text[$i]
            }
            # Replaces code above -> JustinWGrote made it -> complains go to him
            #$markdownRegex = '\[(?<title>[^\]]+)\]\((?<uri>https?.+?)\)[\s\r\n$]'
            #$Text[$i] -replace $markdownRegex, '<a href="$2">$1</a>'

            <#
            if ($Text[$i] -match "\[[^\]]+\]\([^)]+\)") {
                # Covers markdown LINK  "[somestring](https://evotec.xyz)"

                $RegexBrackets1 = [regex] '\[[^\]]+\]\([^)]+\)'

                $RegexBrackets1 = [regex] "\[([^\[]*)\]" # catch 'sometstring'
                $RegexBrackets2 = [regex] "\(([^\[]*)\)" # catch link
                $RegexBrackets3 = [regex] "\[([^\[]*)\)" # catch both somestring and link
                $Text1 = $RegexBrackets1.match($Text[$i]).Groups[1].value
                #$Text2 = $RegexBrackets2.match($Text[$i]).Groups[1].value
                $Text3 = $RegexBrackets3.match($Text[$i]).Groups[0].value
                if ($Text1 -ne '' -and $Text2 -ne '') {
                    $Link = New-HTMLAnchor -HrefLink $Text2 -Text $Text1
                    $Text[$i].Replace($Text3, $Link)
                }
            } else {
                # Default
                $Text[$i]
                # if ($NewLine[$i]) {
                #    '<br>'
                #}
            }
            #>
        }
    }

    if ($SkipParagraph) {
        $Output -join ''
    } else {
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'defaultText' } {
            #    New-HTMLTag -Tag 'div' -Attributes @{ style = @{ 'margin' = ConvertFrom-Size -Size $Margin } } {
            $Output
        }
    }
    if ($LineBreak) {
        New-HTMLTag -Tag 'br' -SelfClosing
    }
}

Register-ArgumentCompleter -CommandName New-HTMLText -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLText -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors