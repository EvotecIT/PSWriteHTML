Function New-HTMLPanel {
    [alias('New-HTMLColumn', 'Panel')]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content = $(Throw "Open curly brace with Content"),
        [alias('BackgroundShade')][string]$BackgroundColor,
        [switch] $Invisible,
        [alias('flex-basis')][string] $Width,
        [string] $Margin,

        [string][ValidateSet('center', 'left', 'right', 'justify')] $AlignContentText,
        [ValidateSet('0px', '5px', '10px', '15px', '20px', '25px')][string] $BorderRadius,

        [string] $AnchorName,
        [System.Collections.IDictionary] $StyleSheetsConfiguration
    )
    # This is so we can support external CSS configuration
    if (-not $StyleSheetsConfiguration) {
        $StyleSheetsConfiguration = [ordered] @{
            Panel = "defaultPanel"
        }
    }
    # This takes care of starting dots in $StyleSheetsConfiguration
    Remove-DotsFromCssClass -Css $StyleSheetsConfiguration

    # This controls general panel style that overwrittes whatever is set globally
    $PanelStyle = [ordered] @{
        "background-color" = ConvertFrom-Color -Color $BackgroundColor
        'border-radius'    = $BorderRadius
    }
    if ($Invisible) {
        $PanelStyle['box-shadow'] = 'unset !important;'
    }

    # This controls content within panel if it's not 100% width such as text
    $ContentStyle = @{
        'text-align' = $AlignContentText
    }

    if ($Width -or $Margin) {
        [string] $ClassName = "flexPanel$(Get-RandomStringName -Size 8 -LettersOnly)"
        $Attributes = @{
            'flex-basis' = if ($Width) { $Width } else { '100%' }
            'margin'     = if ($Margin) { $Margin }
        }
        $Css = ConvertTo-LimitedCSS -ClassName $ClassName -Attributes $Attributes

        $Script:HTMLSchema.CustomHeaderCSS.Add($Css)
        [string] $Class = "$ClassName overflowHidden"
    } else {
        [string] $Class = 'flexPanel overflowHidden'
    }
    New-HTMLTag -Tag 'div' -Attributes @{ id = $AnchorName; class = "$Class $($StyleSheetsConfiguration.Panel)"; style = $PanelStyle } {
        New-HTMLTag -Tag 'div' -Attributes @{ style = $ContentStyle } {
            Invoke-Command -ScriptBlock $Content
        }
    }
}

Register-ArgumentCompleter -CommandName New-HTMLPanel -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors