Function New-HTMLPanel {
    [alias('New-HTMLColumn', 'Panel')]
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)][ValidateNotNull()][ScriptBlock] $Content,
        [alias('BackgroundShade')][string]$BackgroundColor,
        [switch] $Invisible,
        [alias('flex-basis')][string] $Width,
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
        $Css = ConvertTo-LimitedCSS -ClassName $ClassName -Attributes $Attributes
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