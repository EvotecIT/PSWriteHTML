function New-HTMLPanel {
    <#
    .SYNOPSIS
    Creates a new HTML panel with customizable styling options.

    .DESCRIPTION
    The New-HTMLPanel function creates a new HTML panel with various styling options such as background color, width, margin, alignment, and more.

    .PARAMETER Content
    Specifies the content of the HTML panel as a ScriptBlock.

    .PARAMETER BackgroundColor
    Specifies the background color of the HTML panel.

    .PARAMETER Invisible
    Indicates whether the panel should be invisible.

    .PARAMETER Width
    Specifies the width of the panel.

    .PARAMETER Margin
    Specifies the margin of the panel.

    .PARAMETER AlignContentText
    Specifies the alignment of the content within the panel.

    .PARAMETER BorderRadius
    Specifies the border radius of the panel.

    .PARAMETER AnchorName
    Specifies the anchor name of the panel.

    .PARAMETER StyleSheetsConfiguration
    Specifies the style sheets configuration for the panel.

    .EXAMPLE
    New-HTMLPanel -Content { "This is the content of the panel" } -BackgroundColor "lightblue" -Width "50%" -Margin "10px" -AlignContentText "center" -BorderRadius "5px" -AnchorName "myPanel" -StyleSheetsConfiguration @{ Panel = "customPanel" }

    Creates a new HTML panel with specified content, background color, width, margin, alignment, border radius, anchor name, and custom style sheet configuration.

    #>
    [alias('New-HTMLColumn', 'Panel')]
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)][ValidateNotNull()][ScriptBlock] $Content,
        [alias('BackgroundShade')][string]$BackgroundColor,
        [switch] $Invisible,
        [alias('flex-basis')][string] $Width,
        [object] $Height,
        [string] $Margin,

        [string][ValidateSet('center', 'left', 'right', 'justify')] $AlignContentText,
        [ValidateSet('0px', '5px', '10px', '15px', '20px', '25px')][string] $BorderRadius,
        [string] $AnchorName,
        [System.Collections.IDictionary] $StyleSheetsConfiguration
    )
    $Script:HTMLSchema.Features.Main = $true
    $Script:HTMLSchema.Features.MainFlex = $true
    # This is so we can support external CSS configuration
    if (-not $StyleSheetsConfiguration) {
        $Script:HTMLSchema.Features.DefaultPanel = $true
        $StyleSheetsConfiguration = [ordered] @{
            Panel = "defaultPanel"
        }
    }
    # This takes care of starting dots in $StyleSheetsConfiguration
    Remove-DotsFromCssClass -Css $StyleSheetsConfiguration
    if (-not $AnchorName) {
        $AnchorName = "anchor-$(Get-RandomStringName -Size 7)"
    }

    # This controls general panel style that overwrittes whatever is set globally
    $PanelStyle = [ordered] @{
        "background-color" = ConvertFrom-Color -Color $BackgroundColor
        'border-radius'    = $BorderRadius
        'text-align'       = $AlignContentText # This controls content within panel if it's not 100% width such as text
        'height'           = ConvertFrom-Size -Size $Height
    }
    if ($Invisible) {
        #$PanelStyle['box-shadow'] = 'unset !important;'
        $StyleSheetsConfiguration.Panel = ''
        [string] $Class = "flexPanel overflowHidden $($StyleSheetsConfiguration.Panel)"
    } elseif ($Width -or $Margin) {
        $Attributes = @{
            'flex-basis' = if ($Width) { $Width } else { '100%' }
            'margin'     = if ($Margin) { $Margin }
        }
        [string] $ClassName = "defaultPanel$(Get-RandomStringName -Size 8 -LettersOnly)"
        $Css = ConvertTo-LimitedCSS -ClassName $ClassName -Attributes $Attributes -Group
        $Script:HTMLSchema.CustomHeaderCSS[$AnchorName] = $Css
        [string] $Class = "flexPanel overflowHidden $ClassName"
    } else {
        [string] $Class = "flexPanel overflowHidden $($StyleSheetsConfiguration.Panel)"
    }
    # New-HTMLTag -Tag 'div' -Attributes @{ class = 'flexParent' } {
    New-HTMLTag -Tag 'div' -Attributes @{ id = $AnchorName; class = $Class; style = $PanelStyle } {
        if ($Content) {
            Invoke-Command -ScriptBlock $Content
        }
    }
    # }
}

Register-ArgumentCompleter -CommandName New-HTMLPanel -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors