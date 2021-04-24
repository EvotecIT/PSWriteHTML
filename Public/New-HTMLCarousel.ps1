function New-HTMLCarousel {
    [cmdletBinding()]
    param(
        [scriptblock] $Slide,
        [validateSet('Horizontal', 'Vertical')][string] $Mode,
        [validateSet('center', 'start', 'end', 'justify')][string] $Align,
        [object] $PerView,
        [validateSet('adaptive', 'equal', 'auto')][string] $Height,
        [string] $Margin,
        [switch] $Loop,
        [switch] $Pagination,
        [nullable[int]] $StartAt
    )
    $Script:HTMLSchema.Features.MainFlex = $true
    $Script:HTMLSchema.Features.CarouselKineto = $true
    $Script:HTMLSchema.Features.jquery = $true

    if (-not $CarouselID) {
        $CarouselID = "Carousel-$(Get-RandomStringName -Size 8 -LettersOnly)"
    }

    $Options = [ordered] @{
        # layout
        mode    = $Mode.ToLower()
        align   = $Align
        perView = $perView
        height  = $Height
        margin  = $Margin
        startAt = $StartAt
    }
    if ($Pagination) {
        $Options['pagination'] = $true
    }
    if ($Loop) {
        $Options['loop'] = $true
    }


    Remove-EmptyValue -Hashtable $Options
    $Carousel = $Options | ConvertTo-JsonLiteral -Depth 0 -AdvancedReplace @{ '.' = '\.'; '$' = '\$' }

    New-HTMLTag -Tag 'div' -Attributes @{ ID = $CarouselID; class = "carousel" } {
        if ($Slide) {
            & $Slide
        }
    }
    $ScriptOutput = New-HTMLTag -Tag 'script' {
        "Kineto.create('#$CarouselID', $Carousel);"
    }

    $Script:HTMLSchema.Carousel.Add($ScriptOutput)
}

<#
{
  mode: 'horizontal',
  align: 'center',
  perView: 'auto',
  height: 'auto',
  margin: 10,
  loop: false,
  startAt: 0,
  moveBy: 1,
  speed: 600,
  easing: [0, 0, 0.2, 1],
  moveOnClick: false,
  waitAnimation: false,
  stream: false,
  streamEvery: 3000,
  streamRewind: true,
  pauseOnFocus: true,
  pauseOnHover: false,
  syncId: null,
  arrows: true,
  arrowsInto: null,
  arrowTemplate: null,
  count: false,
  countInto: null,
  countTemplate: null,
  pagination: true,
  paginationInto: null,
  paginationTemplate: null,
  touchSwipe: true,
  mouseSwipe: true,
  swipeThreshold: 3,
  swipeMultiplier: 1,
  swipeEdgeBounce: true,
  swipeEdgeFriction: 0.8,
  wheel: false,
  wheelTarget: null,
  wheelThrottle: 'auto',
  wheelEdgeRelease: true,
  aria: true,
  cssPrecision: 3,
  usePercent: false,
  responsive: true,
  responsiveDelay: 100,
  responsiveMode: 'mobile-first',
}
#>