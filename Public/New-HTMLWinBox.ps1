function New-HTMLWinBox {
    <#
    .SYNOPSIS
    Creates a customizable HTML window box with various options for styling and functionality.

    .DESCRIPTION
    This function allows you to create an HTML window box with customizable features such as title, background color, initial position, size, URL content, modal display, theme, and more.

    .PARAMETER HTML
    Specifies the HTML content to be displayed within the window box.

    .PARAMETER Title
    Specifies the title of the window box.

    .PARAMETER BackgroundColor
    Specifies the background color of the window box title.

    .PARAMETER Index
    Set the initial z-index of the window to this value (could be increased automatically when unfocused/focused).

    .PARAMETER Border
    Set the border width of the window (supports all css units, like px, %, em, rem, vh, vmax).

    .PARAMETER Height
    Set the initial width/height of the window (supports units "px" and "%").

    .PARAMETER Width
    Set the initial width/height of the window (supports units "px" and "%").

    .PARAMETER X
    Set the initial position of the window (supports: "right" for x-axis, "bottom" for y-axis, "center" for both, units "px" and "%" for both).

    .PARAMETER Y
    Set the initial position of the window (supports: "right" for x-axis, "bottom" for y-axis, "center" for both, units "px" and "%" for both).

    .PARAMETER Top
    Set or limit the viewport of the window's available area (supports units "px" and "%").

    .PARAMETER Right
    Set or limit the viewport of the window's available area (supports units "px" and "%").

    .PARAMETER Bottom
    Set or limit the viewport of the window's available area (supports units "px" and "%").

    .PARAMETER Left
    Set or limit the viewport of the window's available area (supports units "px" and "%").

    .PARAMETER Url
    Specifies the URL content to be loaded inside the window box via iframe.

    .PARAMETER Modal
    Indicates whether the window box should be displayed as a modal window.

    .PARAMETER Maximize
    Automatically maximizes the window box when created.

    .PARAMETER Theme
    Specifies the theme of the window box.

    .PARAMETER NoAnimation
    Disables transition animations for the window box.

    .PARAMETER NoShadow
    Disables the drop shadow effect for the window box.

    .PARAMETER NoHeader
    Hides the header of the window box, including the title and toolbar.

    .PARAMETER NoMinmizeIcon
    Hides the minimize icon in the window box.

    .PARAMETER NoMaximizeIcon
    Hides the maximize icon in the window box.

    .PARAMETER NoFullScreenIcon
    Hides the fullscreen icon in the window box.

    .PARAMETER NoCloseIcon
    Hides the close icon in the window box.

    .PARAMETER NoResizeCapability
    Disables the resizing capability of the window box.

    .PARAMETER NoMoveCapability
    Disables the moving capability of the window box.

    .EXAMPLE
    $Data = Get-Process | Select-Object -First 3

    New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example-WinBox01.html" {
        New-HTMLWinBox -Title 'This is a test Window' -BackgroundColor Red {
            New-HTMLText -Text 'This is a text within modal dialog'
            New-HTMLTable -DataTable $Data
        } -Width 50% -Height 50% -X center -Y center
    } -Online -ShowHTML


    .NOTES
    This function provides a flexible way to create interactive and styled window boxes in HTML.
    #>
    [cmdletBinding()]
    param(
        [scriptblock] $HTML,
        [string] $Title,
        [string] $BackgroundColor,
        [nullable[int]] $Index,
        [string] $Border,
        [string] $Height,
        [string] $Width,
        [string] $X,
        [string] $Y,
        [string] $Top,
        [string] $Right,
        [string] $Bottom,
        [string] $Left,
        [alias('Uri')][uri] $Url,
        [switch] $Modal,
        [switch] $Maximize,
        [ValidateSet('modern', 'white')][string] $Theme,

        [switch] $NoAnimation,
        [switch] $NoShadow,
        [switch] $NoHeader,
        [switch] $NoMinmizeIcon,
        [switch] $NoMaximizeIcon,
        [switch] $NoFullScreenIcon,
        [switch] $NoCloseIcon,
        [switch] $NoResizeCapability,
        [switch] $NoMoveCapability
    )
    $WinBoxHidden = "WinBoxModal-$(Get-RandomStringName -Size 8 -LettersOnly)"
    $WinBoxID = "WinBox-$(Get-RandomStringName -Size 8 -LettersOnly)"

    $Script:HTMLSchema.Features.WinBox = $true
    $Script:HTMLSchema.Features.MainFlex = $true

    [Array] $Class = @(
        if ($NoAnimation) {
            'no-animation'
        }
        if ($NoShadow) {
            'no-shadow'
        }
        if ($NoHeader) {
            'no-header'
        }
        if ($NoMinmizeIcon) {
            'no-min'
        }
        if ($NoMaximizeIcon) {
            'no-max'
        }
        if ($NoFullScreenIcon) {
            'no-full'
        }
        if ($NoCloseIcon) {
            'no-close'
        }
        if ($NoResizeCapability) {
            'no-resize'
        }
        if ($NoMoveCapability) {
            'no-move'
        }
    )

    $Options = [ordered] @{
        id         = $WinBoxID
        class      = if ($Class.Count -gt 0) { $Class } else { $null }
        title      = $Title
        background = ConvertFrom-Color -Color $BackgroundColor
        height     = $Height
        width      = $Width
        top        = $Top
        left       = $Left
        right      = $Right
        bottom     = $Bottom
        x          = $X
        y          = $Y
        url        = $Url
        index      = $Index
        theme      = $Theme
    }
    if ($Maximize) {
        $Options['max'] = $true
    }
    if ($Modal) {
        $Options['modal'] = $true
    }
    # Since converting to json will not work correctly with mount option we need to cheat later on
    if ($HTML) {
        $Options['mount'] = 'replaceHTMLme'
        New-HTMLTag -Tag 'div' -Attributes @{ style = @{ "display" = "none" } } {
            New-HTMLTag -Tag 'div' -Attributes @{ id = $WinBoxHidden; } {
                & $HTML
            }
        }
    }

    Remove-EmptyValue -Hashtable $Options
    $OptionsJSON = $Options | ConvertTo-JsonLiteral

    # We cheat and replace the string with proper element id
    if ($HTML) {
        $OptionsJSON = $OptionsJSON.Replace('"replaceHTMLme"', "document.getElementById('$WinBoxHidden')")
    }

    New-HTMLTag -Tag 'script' {
        "new WinBox($OptionsJSON);"
    }
}

Register-ArgumentCompleter -CommandName New-HTMLWinbox -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors