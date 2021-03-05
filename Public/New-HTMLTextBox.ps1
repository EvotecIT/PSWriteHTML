function New-HTMLTextBox {
    <#
    .SYNOPSIS
    Adds text to HTML where each line in TextBlock is treated as next line (adds BR to each line)

    .DESCRIPTION
    Adds text to HTML where each line in TextBlock is treated as next line (adds BR to each line).
    Automatic line breaks are main feature that differentiate New-HTMLTextBox from New-HTMLText
    where TextBlock is treated as single line of text unless LineBreak switch is used.

    .PARAMETER TextBlock
    ScriptBlock of one or more strings

    .PARAMETER Color
    Color of Text to set. Choose one or more colors from up to 800 defined colors. Alternatively provide your own Hex value

    .PARAMETER BackGroundColor
    Color of Background for a Text to set. Choose one or more colors from up to 800 defined colors. Alternatively provide your own Hex value

    .PARAMETER FontSize
    Choose FontSize. You can provide just int value which will assume pixels or string value with any other size value.

    .PARAMETER FontWeight
    Parameter description

    .PARAMETER FontStyle
    Parameter description

    .PARAMETER TextDecoration
    Parameter description

    .PARAMETER FontVariant
    Parameter description

    .PARAMETER FontFamily
    Parameter description

    .PARAMETER Alignment
    Chhoose Alignment

    .PARAMETER TextTransform
    Parameter description

    .PARAMETER Direction
    Parameter description

    .PARAMETER LineBreak
    Parameter description

    .EXAMPLE
    New-HTMLTextBox {
        "Hello $UserNotify,"
        ""
        "Your password is due to expire in $PasswordExpiryDays days."
        ""
        'To change your password: '
        '- press CTRL+ALT+DEL -> Change a password...'
        ''
        'If you have forgotten your password and need to reset it, you can do this by clicking here. '
        "In case of problems please contact the HelpDesk by visiting [Evotec Website](https://evotec.xyz) or by sending an email to Help Desk."
        ''
        'Alternatively you can always call Help Desk at +48 22 00 00 00'
        ''
        'Kind regards,'
        'Evotec IT'
    }

    .NOTES
    General notes
    #>
    [alias('EmailTextBox')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][ScriptBlock] $TextBlock,
        [string[]] $Color = @(),
        [string[]] $BackGroundColor = @(),
        [alias('Size')][int[]] $FontSize = @(),
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string[]] $FontWeight = @(),
        [ValidateSet('normal', 'italic', 'oblique')][string[]] $FontStyle = @(),
        [ValidateSet('none', 'line-through', 'overline', 'underline')][string[]] $TextDecoration = @(),
        [ValidateSet('normal', 'small-caps')][string[]] $FontVariant = @(),
        [string[]] $FontFamily = @(),
        [ValidateSet('left', 'center', 'right', 'justify')][string[]] $Alignment = @(),
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string[]] $TextTransform = @(),
        [ValidateSet('rtl')][string[]] $Direction = @(),
        [switch] $LineBreak
    )
    if ($TextBlock) {
        $Text = (Invoke-Command -ScriptBlock $TextBlock)
        if ($Text.Count) {
            $LineBreak = $true
        }
    }
    $Span = foreach ($T in $Text) {
        $newHTMLTextSplat = @{
            Alignment       = $Alignment
            FontSize        = $FontSize
            TextTransform   = $TextTransform
            Text            = $T
            Color           = $Color
            FontFamily      = $FontFamily
            Direction       = $Direction
            FontStyle       = $FontStyle
            TextDecoration  = $TextDecoration
            BackGroundColor = $BackGroundColor
            FontVariant     = $FontVariant
            FontWeight      = $FontWeight
            LineBreak       = $LineBreak
        }
        New-HTMLText @newHTMLTextSplat -SkipParagraph
    }
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'defaultText' } {
        $Span
    }
}
Register-ArgumentCompleter -CommandName New-HTMLTextBox -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTextBox -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors