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
        [string] $AnchorName
    )
    $Script:HTMLSchema.Features.MainFlex = $true
    if (-not $AnchorName) {
        $AnchorName = "anchor-$(Get-RandomStringName -Size 7)"
    }
    if ($Width -or $Margin) {
        [string] $ClassName = "flexElement$(Get-RandomStringName -Size 8 -LettersOnly)"
        $Attributes = @{
            'flex-basis' = ConvertFrom-Size -Size $Width
            'margin'     = if ($Margin) { $Margin }
        }
        $Css = ConvertTo-LimitedCSS -ClassName $ClassName -Attributes $Attributes -Group

        # $Script:HTMLSchema.CustomHeaderCSS.Add($Css)
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