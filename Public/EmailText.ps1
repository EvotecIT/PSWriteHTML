function EmailText {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][ScriptBlock] $TextBlock,
        [string[]] $Text,
        [string[]] $Color = @(),
        [string[]] $BackGroundColor = @(),
        [alias('Size')][object[]] $FontSize = @(),
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string[]] $FontWeight = @(),
        [ValidateSet('normal', 'italic', 'oblique')][string[]] $FontStyle = @(),
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string[]] $TextDecoration = @(),
        [ValidateSet('normal', 'small-caps')][string[]] $FontVariant = @(),
        [string[]] $FontFamily = @(),
        [ValidateSet('left', 'center', 'right', 'justify')][string[]] $Alignment = @(),
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string[]] $TextTransform = @(),
        [ValidateSet('rtl')][string[]] $Direction = @(),
        [switch] $LineBreak,
        [switch] $SkipParagraph
    )
    if ($TextBlock) {
        $Text = (Invoke-Command -ScriptBlock $TextBlock)
        #if ($Text.Count) {
        #    $LineBreak = $false
        #}
    }

    $newHTMLTextSplat = @{
        Alignment       = $Alignment
        FontSize        = $FontSize
        TextTransform   = $TextTransform
        Text            = $Text
        Color           = $Color
        FontFamily      = $FontFamily
        Direction       = $Direction
        FontStyle       = $FontStyle
        TextDecoration  = $TextDecoration
        BackGroundColor = $BackGroundColor
        FontVariant     = $FontVariant
        FontWeight      = $FontWeight
        LineBreak       = $LineBreak
        SkipParagraph   = $SkipParagraph
    }

    New-HTMLText @newHTMLTextSplat
}
Register-ArgumentCompleter -CommandName EmailText -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName EmailText -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors