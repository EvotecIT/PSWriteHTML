function New-HTMLWinBox {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER HTML
    Parameter description

    .PARAMETER Title
    The window title.

    .PARAMETER BackgroundColor
    Set the background color for the title

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
    Open URL inside the window (loaded via iframe).

    .PARAMETER Modal
    Shows the window as modal.

    .PARAMETER Maximize
    Automatically toggles the window into maximized state when created.

    .PARAMETER Theme

    .PARAMETER NoAnimation
    Disables the windows transition animation

    .PARAMETER NoShadow
    Disables the windows drop shadow

    .PARAMETER NoHeader
    Hide the window header incl. title and toolbar

    .PARAMETER NoMinmizeIcon
    Hide the minimize icon

    .PARAMETER NoMaximizeIcon
    Hide the maximize icon

    .PARAMETER NoFullScreenIcon
    Hide the fullscreen icon

    .PARAMETER NoCloseIcon
    Hide the close icon

    .PARAMETER NoResizeCapability
    Disables the window resizing capability

    .PARAMETER NoMoveCapability
    Disables the window moving capability

    .EXAMPLE
    $Data = Get-Process | Select-Object -First 3

    New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example-WinBox01.html" {
        New-HTMLWinBox -Title 'This is a test Window' -BackgroundColor Red {
            New-HTMLText -Text 'This is a text within modal dialog'
            New-HTMLTable -DataTable $Data
        } -Width 50% -Height 50% -X center -Y center
    } -Online -ShowHTML


    .NOTES
    General notes
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