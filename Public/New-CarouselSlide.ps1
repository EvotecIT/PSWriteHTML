function New-CarouselSlide {
    [cmdletBinding()]
    param(
        [scriptblock] $SlideContent
    )
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'slide' } {
        if ($SlideContent) {
            & $SlideContent
        }
    }
}