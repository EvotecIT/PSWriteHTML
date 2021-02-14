function New-HTMLCarousel {
    [cmdletBinding()]
    param(
        [scriptblock] $Slide
    )
    $Script:HTMLSchema.Features.MainFlex = $true
    $Script:HTMLSchema.Features.CarouselKineto = $true
    $Script:HTMLSchema.Features.jquery = $true
    if (-not $CarouselID) {
        $CarouselID = "Carousel-$(Get-RandomStringName -Size 8 -LettersOnly)"
    }

    $Options = [ordered] @{
        pagination = $true
        mode       = 'horizontal'
    }
    $Carousel = $Options | ConvertTo-JsonLiteral -Depth 0

    New-HTMLTag -Tag 'div' -Attributes @{ ID = $CarouselID; class = "carousel" } {
        if ($Slide) {
            & $Slide
        }
    }
    New-HTMLTag -Tag 'script' {
        "Kineto.create('#$CarouselID', $Carousel);"
    }
}