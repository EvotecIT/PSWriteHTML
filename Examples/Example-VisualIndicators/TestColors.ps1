function Get-VisualIndicator {
    [CmdLetBinding()]
    param(
        [string] $TextHeading,
        [string] $Text,
        [string] $Color = "Black",
        [string] $ColorBackground = "DarkOrange",
        [string] $ColorBorder = "White",
        [string] $ColorHeading = "Black",
        [switch] $TextHeadingBold,
        [switch] $TextBold,
        [switch] $SkipNewLine,
        [switch] $Simplify
    )

    $RGBColorText = ConvertFrom-Color -Color $Color
    $RGBColorBorder = ConvertFrom-Color -Color $ColorBorder
    $RGBColorBackground = ConvertFrom-Color -Color $ColorBackground
    $RGBColorHeading = ConvertFrom-Color -Color $ColorHeading

    [string] $HTMLOutput = @(
        if ($Simplify) {

            $AttributesDiv = @{
                'style' = @{
                    'width'       = '100%'
                    'padding'     = '2pt'
                    'font-size'   = '11pt'
                    'line-height' = '12pt'
                    'font-family' = 'Calibri Light'
                    'color'       = $RGBColorText
                    'text-align'  = 'left'
                    'font-weight' = if ($TextBold) { 'bold' }
                }
            }

            $AttributesSpanHeading = @{
                'style' = @{
                    'color'       = $RGBColorHeading
                    'font-weight' = if ($TextHeadingBold) { 'bold' }
                }
            }

            New-HTMLTag -Tag 'div' -Attributes $AttributesDiv {
                New-HTMLTag -Tag 'span' -Attributes $AttributesSpanHeading {
                    $TextHeading
                }
                $Text
            }
            if (-not $SkipNewLine) {
                New-HTMLTag -Tag 'br' -SelfClosing
            }
        } else {

            $AttributesDiv = @{
                'style' = @{
                    'background-color' = $RGBColorBackground
                    'width'            = '100%'
                    'border-style'     = 'solid'
                    'border-color'     = $RGBColorBorder
                    'border-width'     = '1pt'
                    'padding'          = '2pt'
                    'font-size'        = '11pt'
                    'line-height'      = '12pt'
                    'font-family'      = 'Calibri Light'
                    'color'            = $RGBColorText
                    'text-align'       = 'left'
                    'font-weight'      = if ($TextBold) { 'bold' }
                }
            }

            $AttributesSpanHeading = @{
                'style' = @{
                    'color'       = $RGBColorHeading
                    'font-weight' = if ($TextHeadingBold) { 'bold' }
                }
            }

            New-HTMLTag -Tag 'div' -Attributes $AttributesDiv {
                New-HTMLTag -Tag 'span' -Attributes $AttributesSpanHeading {
                    $TextHeading
                }
                $Text

            }
            if (-not $SkipNewLine) {
                New-HTMLTag -Tag 'br' -SelfClosing
            }
        }
    )
    return $HTMLOutput
}

Import-Module PSWriteHTML

$Output = @(
    Get-VisualIndicator -TextHeading "WARNING:" -Text "The sender of this message could not be fully validated. The message may not be from the sender/domain displayed." -ColorBackground Orange
    Get-VisualIndicator -TextHeading 'Caution:' -Text 'This email originated from outside the organisation. Please be mindful when opening attachments and embedded links.' -ColorBackground Red

    Get-VisualIndicator -TextHeading "WARNING:" -Text "The sender of this message could not be fully validated. The message may not be from the sender/domain displayed." -ColorBackground Orange
    Get-VisualIndicator -TextHeading 'Caution:' -Text 'This email originated from outside the organisation. Please be mindful when opening attachments and embedded links.' -ColorBackground Red

    Get-VisualIndicator -TextHeading "WARNING:" -Text "The sender of this message could not be fully validated. The message may not be from the sender/domain displayed." -Simplify -Color Red -ColorHeading Red
    Get-VisualIndicator -TextHeading 'Caution:' -Text 'This email originated from outside the organisation. Please be mindful when opening attachments and embedded links.' -Simplify -Color Orange -ColorHeading Orange

    Get-VisualIndicator -TextHeading "WARNING:" -Text "The sender of this message could not be fully validated. The message may not be from the sender/domain displayed." -Simplify -Color Red -ColorHeading Red -TextHeadingBold
    Get-VisualIndicator -TextHeading 'Caution:' -Text 'This email originated from outside the organisation. Please be mindful when opening attachments and embedded links.' -Simplify -Color Orange -ColorHeading Orange -TextHeadingBold

    Get-VisualIndicator -TextHeading "WARNING:" -Text "The sender of this message could not be fully validated. The message may not be from the sender/domain displayed." -Simplify -Color Red -ColorHeading Red -TextHeadingBold -TextBold
    Get-VisualIndicator -TextHeading 'Caution:' -Text 'This email originated from outside the organisation. Please be mindful when opening attachments and embedded links.' -Simplify -Color Orange -ColorHeading Orange -TextHeadingBold -TextBold
)
Save-HTML -FilePath $PSScriptRoot\TestColors.html -HTML $Output -ShowHTML

$Output = foreach ($Color1 in $Script:RGBColors.keys) {
    foreach ($Color2 in $Script:RGBColors.keys) {
        $RGB1 = ConvertFrom-Color -Color $Color1
        $RGB2 = ConvertFrom-Color -Color $Color2
        Get-VisualIndicator -SkipNewLine -TextHeading "WARNING: (Color Heading: $RGB1 ($Color1)" -Text "The sender of this message could not be fully validated. The message may not be from the sender/domain displayed. (ColorBackground $RGB2 ($Color2))" -ColorHeading $Color1 -ColorBackground $Color2
    }
}
Save-HTML -FilePath $PSScriptRoot\TestColors147x2.html -HTML $Output -ShowHTML

<# Uncomment below if you dare - 147 x 147 x 147 colors.
$Time = Start-TimeLog
$Output = foreach ($Color1 in $Script:RGBColors.keys) {
    foreach ($Color2 in $Script:RGBColors.keys) {
        foreach ($Color3 in $Script:RGBColors.keys) {
            $RGB1 = ConvertFrom-Color -Color $Color1
            $RGB2 = ConvertFrom-Color -Color $Color2
            $RGB3 = ConvertFrom-Color -Color $Color3
            Get-VisualIndicator -SkipNewLine -TextHeading "WARNING:" -Text "The sender of this message could not be fully validated. The message may not be from the sender/domain displayed. (Color Heading: $RGB1 ($Color1), ColorBackground $RGB2 ($Color2), TextColor $RBG3 ($Color3))" -ColorHeading $RGB1 -ColorBackground $RGB2 -Color $RGB3
        }
    }
}

Save-HTML -FilePath $PSScriptRoot\TestColors147x3.html -HTML $Output #-ShowHTML
Stop-TimeLog -Time $Time -Option OneLiner
#>