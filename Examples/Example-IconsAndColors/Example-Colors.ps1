Import-Module PSSharedGoods -Force
Import-Module PSWriteHTML -Force

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

$RGBColors = Get-Colors
$Count = 0
$Output = foreach ($Color1 in $RGBColors.Keys) {
    $Count++
    $CountInside = 0
    foreach ($Color2 in $Script:RGBColors.keys) {
        $CountInside++
        $RGB1 = ConvertFrom-Color -Color $Color1
        $RGB2 = ConvertFrom-Color -Color $Color2

        Write-Color -Text "[$Count/$($RGBColors.Keys.Count)]", " ", "[$CountInside/$($RGBColors.Keys.Count)]" -Color Yellow, Red, Gray
        Get-VisualIndicator -SkipNewLine -TextHeading "Color Text: $RGB1 ($Color1)" -Text "(ColorBackground $RGB2 ($Color2))" -ColorHeading $Color1 -ColorBackground $Color2
    }
}
Save-HTML -FilePath "$PSScriptRoot\Example-Colors.html" -HTML $Output -ShowHTML