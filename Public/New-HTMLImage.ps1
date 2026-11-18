function New-HTMLImage {
    <#
    .SYNOPSIS
    Creates IMG tag with image link or image bundled inline

    .DESCRIPTION
    Creates IMG tag with image link or image bundled inline

    .PARAMETER Source
    Link to an image or file path to an image

    .PARAMETER UrlLink
    Specifies the URL of the page the link goes to when user clicks an image

    .PARAMETER AlternativeText
    Specifies an alternate text for the image, if the image for some reason cannot be displayed

    .PARAMETER Class
    Overwrites default CSS settings for links

    .PARAMETER Target
    The target attribute specifies where to open the linked document.

    - _blank	Opens the linked document in a new window or tab
    - _self	Opens the linked document in the same frame as it was clicked (this is default)
    - _parent	Opens the linked document in the parent frame
    - _top	Opens the linked document in the full body of the window

    Additionally framename can be given. Default is _blank

    .PARAMETER Width
    Width of an image (optional)

    .PARAMETER Height
    Height of an image (optional)

    .PARAMETER Inline
    Inserts given Image URL/File directly into HTML

    .PARAMETER BackgroundColor
    Sets the image wrapper background. Use Transparent to let the surrounding background show through. Email clients may adjust colors in dark mode.

    .EXAMPLE
    New-HTMLImage -Source 'https://evotec.pl/image.png' -UrlLink 'https://evotec.pl/' -AlternativeText 'My other text' -Class 'otehr' -Width '100%'

    .NOTES
    General notes
    #>
    [alias('Image', 'EmailImage')]
    [CmdletBinding()]
    param(
        [string] $Source,
        [Uri] $UrlLink = '',
        [string] $AlternativeText = '',
        [string] $Class = 'logo',
        [string] $Target = '_blank',
        [object] $Width,
        [object] $Height,
        [switch] $Inline,
        [Parameter(DontShow)][switch] $DisableCache,
        [string] $BackgroundColor
    )
    $Script:HTMLSchema.Features.DefaultImage = $true

    if ($Inline) {
        # Cache makes sure that file is downloaded once and can be reused over and over until cache is reset
        # Resetting of cache is done automatically on module reload
        # This can be very useful when sending 3000 emails with same logo
        $BinaryImage = Convert-Image -Image $Source -Cache:(-not $DisableCache)
    }

    $Wrapper = @{ class = $Class.ToLower() }
    if ($BackgroundColor) {
        $Color = if ($BackgroundColor -eq 'Transparent') { 'transparent' } else { ConvertFrom-Color -Color $BackgroundColor }
        if ($Color -match '^[#\w.,()% +\-]+$') {
            $Wrapper.style = @{ 'background-color' = [Net.WebUtility]::HtmlEncode($Color) }
        }
    }
    New-HTMLTag -Tag 'div' -Attributes $Wrapper {
        $AAttributes = [ordered]@{
            'target' = $Target
            'href'   = $UrlLink.AbsoluteUri
        }
        New-HTMLTag -Tag 'a' -Attributes $AAttributes {
            if ($Inline) {
                $ImgAttributes = [ordered]@{
                    'src'    = "$BinaryImage"
                    'alt'    = "$AlternativeText"
                    'width'  = $Width #ConvertFrom-Size -Size $Width
                    'height' = $Height # ConvertFrom-Size -Size $Height
                }
            } else {
                $ImgAttributes = [ordered]@{
                    'src'    = "$Source"
                    'alt'    = "$AlternativeText"
                    'width'  = $Width #ConvertFrom-Size -Size $Width
                    'height' = $Height  #ConvertFrom-Size -Size $Height
                }
            }
            New-HTMLTag -Tag 'img' -Attributes $ImgAttributes
        }
    }
}

Register-ArgumentCompleter -CommandName New-HTMLImage -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLImage -ParameterName Target -ScriptBlock {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
    @('_blank', '_self', '_parent', '_top') | Where-Object { $_ -like "*$wordToComplete*" }
}
