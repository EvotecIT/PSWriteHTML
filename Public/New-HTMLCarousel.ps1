function New-HTMLCarousel {
    <#
    .SYNOPSIS
    Creates a new HTML carousel element with customizable options.

    .DESCRIPTION
    This function creates a new HTML carousel element with the specified options such as slide content, mode (Horizontal/Vertical), alignment, number of slides per view, height, margin, looping, pagination, speed, starting slide, autoplay settings, arrow visibility, and more.

    .PARAMETER Slide
    Specifies the content of the carousel slide as a script block.

    .PARAMETER Mode
    Specifies the mode of the carousel (Horizontal/Vertical). Default is Horizontal.

    .PARAMETER Align
    Specifies the alignment of the carousel slides (center/start/end/justify).

    .PARAMETER PerView
    Specifies the number of slides per view.

    .PARAMETER Height
    Specifies the height of the carousel (adaptive/equal/auto).

    .PARAMETER Margin
    Specifies the margin between slides.

    .PARAMETER Loop
    Indicates whether the carousel should loop.

    .PARAMETER Pagination
    Indicates whether pagination should be enabled.

    .PARAMETER Speed
    Specifies the speed of the carousel animation.

    .PARAMETER MoveBy
    Specifies the number of slides to move at a time.

    .PARAMETER StartAt
    Specifies the index of the slide to start at.

    .PARAMETER MoveOnClick
    Indicates whether the carousel should move to the next slide on click.

    .PARAMETER AutoPlay
    Indicates whether autoplay is enabled.

    .PARAMETER AutoPlayEvery
    Specifies the interval for autoplay.

    .PARAMETER AutoPlayRewind
    Indicates whether autoplay should rewind.

    .PARAMETER AutoPlayPauseOnFocus
    Indicates whether autoplay should pause on focus.

    .PARAMETER AutoPlayPauseOnHover
    Indicates whether autoplay should pause on hover.

    .PARAMETER AutoPlaySyncID
    Specifies the ID to sync autoplay with.

    .PARAMETER DisableArrows
    Indicates whether the arrow navigation should be disabled.

    .PARAMETER ArrowTemplate
    Specifies custom arrow templates.

    .PARAMETER PaginationTemplate
    Specifies the pagination template ('default'/'index'/'custom').

    .PARAMETER Count
    Indicates whether slide count should be displayed.

    .PARAMETER CountTemplate
    Specifies the template for displaying slide count.

    .EXAMPLE
    New-HTMLCarousel -Slide { "Slide Content Here" } -Mode Horizontal -Align center -PerView 3 -Height adaptive -Margin '10px' -Loop -Pagination -Speed 500 -MoveBy 1 -StartAt 0 -MoveOnClick -AutoPlay -AutoPlayEvery 3000 -AutoPlayRewind -AutoPlayPauseOnFocus -AutoPlayPauseOnHover -AutoPlaySyncID 'carousel1' -DisableArrows -ArrowTemplate @('left-arrow', 'right-arrow') -PaginationTemplate 'index' -Count -CountTemplate 'Slide {index} of {total}'

    Creates a new HTML carousel with the specified options.

    #>
    [cmdletBinding()]
    param(
        [scriptblock] $Slide,
        [validateSet('Horizontal', 'Vertical')][string] $Mode = 'Horizontal',
        [validateSet('center', 'start', 'end', 'justify')][string] $Align,
        [object] $PerView,
        [validateSet('adaptive', 'equal', 'auto')][string] $Height,
        [string] $Margin,
        [switch] $Loop,
        [switch] $Pagination,
        [nullable[int]] $Speed,
        [nullable[int]] $MoveBy,
        [nullable[int]] $StartAt,
        [switch] $MoveOnClick,
        [alias('Stream')][switch] $AutoPlay,
        [alias('StreamEvery')][nullable[int]] $AutoPlayEvery,
        [alias('StreamRewind')][switch] $AutoPlayRewind,
        [alias('StreamPauseOnFocus')][switch] $AutoPlayPauseOnFocus,
        [alias('StreamPauseOnHover')][switch] $AutoPlayPauseOnHover,
        [alias('StreamSyncID')][string] $AutoPlaySyncID,
        [switch] $DisableArrows,
        [string[]] $ArrowTemplate,
        [string] $PaginationTemplate,
        [switch] $Count,
        [string] $CountTemplate
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
        moveBy  = $moveBy
        speed   = $Speed
    }
    if ($Pagination) {
        $Options['pagination'] = $true
    }
    if ($PaginationTemplate) {
        if ($PaginationTemplate -eq 'default') {
            $Options['paginationTemplate'] = $null
        } elseif ($PaginationTemplate -eq 'index') {
            $Options['paginationTemplate'] = '{{index}}'
        } else {
            $Options['paginationTemplate'] = $PaginationTemplate
        }
    }
    if ($Loop) {
        $Options['loop'] = $true
    }
    if ($MoveOnClick) {
        $Options['moveOnClick'] = $true
    }
    if ($AutoPlay) {
        $Options['stream'] = $true
        if ($AutoPlayEvery) {
            $Options['streamEvery'] = $AutoPlayEvery
        }
        if ($AutoPlayRewind) {
            $Options['streamRewind'] = $true
        }
        if ($AutoPlayPauseOnFocus) {
            $Options['pauseOnFocus'] = $true
        }
        if ($AutoPlayPauseOnHover) {
            $Options['pauseOnHover'] = $true
        }
        if ($AutoPlaySyncID) {
            $Options['syncId'] = $AutoPlaySyncID
        }
    }
    if ($DisableArrows) {
        $Options['arrows'] = $false
    }

    if ($ArrowTemplate) {
        $Options['arrows'] = $true
        if ($ArrowTemplate.Count -eq 1) {
            if ($ArrowTemplate -eq 'default') {
                $ArrowTemplate = $null
            } elseif ($ArrowTemplate -eq 'arrows') {
                $Options['arrowTemplate'] = @('←', '→')
            } else {
                $Options['arrowTemplate'] = $ArrowTemplate
            }
        } else {
            $Options['arrowTemplate'] = $ArrowTemplate
        }
    }
    if ($Count) {
        $Options['count'] = $true

        if ($CountTemplate) {
            if ($CountTemplate -eq 'default') {
                $CountTemplate = $null
            } elseif ($CountTemplate -eq 'count') {
                $CountTemplate = '{current}/{total}'
            } elseif ($CountTemplate -eq 'countBold') {
                $CountTemplate = '<em class="current">{{current}}</em> / {{total}}'
            } else {
                $CountTemplate = $CountTemplate
            }
            $Options['countTemplate'] = $CountTemplate
        }
    }

    Remove-EmptyValue -Hashtable $Options
    $Carousel = $Options | ConvertTo-JsonLiteral -Depth 1 -AdvancedReplace @{ '.' = '\.'; '$' = '\$' }

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


[scriptblock] $AutoCompleterCountTemplate = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
    'default', 'count', 'countBold' | Sort-Object | Where-Object { $_ -like "*$wordToComplete*" }
}
[scriptblock] $AutoCompleterArrowTemplate = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
    'default', 'arrows' | Sort-Object | Where-Object { $_ -like "*$wordToComplete*" }
}

Register-ArgumentCompleter -CommandName New-HTMLCarousel -ParameterName CountTemplate -ScriptBlock $AutoCompleterCountTemplate
Register-ArgumentCompleter -CommandName New-HTMLCarousel -ParameterName ArrowTemplate -ScriptBlock $AutoCompleterArrowTemplate

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