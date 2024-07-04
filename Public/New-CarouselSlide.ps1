function New-CarouselSlide {
    <#
    .SYNOPSIS
    Creates a new carousel slide with specified content, background color, and height.

    .DESCRIPTION
    This function creates a new carousel slide with the provided content, background color, and height. The slide content is specified using a script block, the background color is a string representing a color, and the height is a numerical value.

    .PARAMETER SlideContent
    The script block containing the content to be displayed on the slide.

    .PARAMETER BackgroundColor
    The background color of the slide specified as a string.

    .PARAMETER Height
    The height of the slide.

    .EXAMPLE
    New-CarouselSlide -SlideContent { "This is the content of the slide" } -BackgroundColor 'blue' -Height 200

    Creates a new carousel slide with the specified content, background color 'blue', and height of 200 pixels.

    #>
    [cmdletBinding()]
    param(
        [scriptblock] $SlideContent,
        [string] $BackgroundColor,
        $Height
    )
    $Style = @{
        'background-color' = ConvertFrom-Color -Color $BackgroundColor
        height             = $Height
    }
    Remove-EmptyValue -Hashtable $Style
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'slide'; style = $Style } {
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'flexElement' } {
            if ($SlideContent) {
                & $SlideContent
            }
        }
    }
}