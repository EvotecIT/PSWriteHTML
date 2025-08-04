function New-HTMLContainer {
    <#
    .SYNOPSIS
    Creates a new HTML container element with customizable options.

    .DESCRIPTION
    This function creates a new HTML container element with the specified options such as content, width, margin, and anchor name.

    .PARAMETER HTML
    Specifies the content to be placed inside the container as a ScriptBlock.

    .PARAMETER Width
    Specifies the width of the container. Default is '100%'.

    .PARAMETER Margin
    Specifies the margin of the container.

    .PARAMETER AnchorName
    Specifies the anchor name for the container. If not provided, a random anchor name will be generated.

    .PARAMETER Density
    Specifies the density of the panel. This will automatically enable responsive wrapping for the panel.
    The options are: Spacious, Comfortable, Compact, Dense, VeryDense.

    .EXAMPLE
    New-HTMLContainer -HTML {
        // HTML content here
    } -Width '50%' -Margin '10px' -AnchorName 'myAnchor'

    Creates a new HTML container with custom HTML content, width of 50%, margin of 10px, and anchor name 'myAnchor'.

    .EXAMPLE
    New-HTMLContainer -HTML {
        // More HTML content
    }

    Creates a new HTML container with additional HTML content and default width and margin.

    #>
    [alias('Container')]
    [CmdletBinding()]
    param(
        [alias('Content')][Parameter(Mandatory = $false, Position = 0)][ScriptBlock] $HTML,
        [object] $Width = '100%',
        [string] $Margin,
        [ValidateSet('Spacious', 'Comfortable', 'Compact', 'Dense', 'VeryDense')][string] $Density,
        [string] $AnchorName
    )
    $Script:HTMLSchema.Features.MainFlex = $true
    if (-not $AnchorName) {
        $AnchorName = "anchor-$(Get-RandomStringName -Size 7)"
    }

    if ($Width -or $Margin -or $PSBoundParameters.ContainsKey('Density')) {
        [string] $ClassName = "flexElement$(Get-RandomStringName -Size 8 -LettersOnly)"
        $Attributes = @{
            'flex-basis' = ConvertFrom-Size -Size $Width
            'margin'     = if ($Margin) { $Margin }
        }

        if ($PSBoundParameters.ContainsKey('Density')) {
            # Enable responsive wrapping feature
            $Script:HTMLSchema.Features.ResponsiveWrap = $true

            # Use the responsive-wrap CSS classes with Density
            $ClassName += " responsive-wrap-container density-$($Density.ToLower())"
        }

        $Css = ConvertTo-LimitedCSS -ClassName $ClassName -Attributes $Attributes -Group

        $Script:HTMLSchema.CustomHeaderCSS[$AnchorName] = $Css
        [string] $Class = "$ClassName overflowHidden"
    } else {
        [string] $Class = 'flexElement overflowHidden'
    }
    New-HTMLTag -Tag 'div' -Attributes @{ class = $Class } {
        if ($HTML) {
            Invoke-Command -ScriptBlock $HTML
        }
    }
}