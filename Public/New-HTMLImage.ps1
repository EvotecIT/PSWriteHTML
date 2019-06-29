function New-HTMLImage {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER Source
    Parameter description

    .PARAMETER UrlLink
    Parameter description

    .PARAMETER AlternativeText
    Parameter description

    .PARAMETER Class
    Parameter description

    .PARAMETER Target
    Parameter description

    .PARAMETER Width
    Parameter description

    .PARAMETER Height
    Parameter description

    .EXAMPLE
    New-HTMLImage -Source 'https://evotec.pl/image.png' -UrlLink 'https://evotec.pl/' -AlternativeText 'My other text' -Class 'otehr' -Width '100%'

    .NOTES
    General notes
    #>

    [CmdletBinding()]
    param(
        [string] $Source,
        [Uri] $UrlLink = '',
        [string] $AlternativeText = '',
        [string] $Class = 'Logo',
        [string] $Target = '_blank',
        [string] $Width,
        [string] $Height
    )

    New-HTMLTag -Tag 'div' -Attributes @{ class = $Class.ToLower() } {
        $AAttributes = [ordered]@{
            'target' = $Target
            'href'   = $UrlLink
        }
        New-HTMLTag -Tag 'a' -Attributes $AAttributes {
            $ImgAttributes = [ordered]@{
                'src'    = "$Source"
                'alt'    = "$AlternativeText"
                'width'  = "$Height"
                'height' = "$Width"
            }
            New-HTMLTag -Tag 'img' -Attributes $ImgAttributes
        }
    }
}