function New-CarouselSlide {
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