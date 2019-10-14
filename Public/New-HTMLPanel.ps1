Function New-HTMLPanel {
    [alias('New-HTMLColumn', 'Panel')]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content = $(Throw "Open curly brace with Content"),
        #[alias('ColumnCount', 'Columns')][ValidateSet('1', '2', '3', '4', '5 ', '6', '7', '8', '9', '10', '11', '12')][string] $Count = 1,
        [alias('BackgroundShade')][string]$BackgroundColor = "",
        [switch] $Invisible,
        [alias('flex-basis')][string] $Width,
        [string] $Margin #,
        # [int] $Height
    )
    #if ($Height -ne 0) {
    #     $StyleHeight = "height: $($Height)px"
    #}
    # $StyleWidth = "width: calc(100% / $Count - 10px)"

    if ($BackgroundColor -ne "") {
        $BackGroundColorFromRGB = ConvertFrom-Color -Color $BackgroundColor
        $DivColumnStyle = "background-color:$BackGroundColorFromRGB;"
    } else {
        $DivColumnStyle = ""
    }
    if ($Invisible) {
        $DivColumnStyle = "$DivColumnStyle box-shadow: unset !important;"
    }

    if ($Width -or $Margin) {
        [string] $ClassName = "flexPanel$(Get-RandomStringName -Size 8 -LettersOnly)"
        $Attributes = @{
            'flex-basis' = if ($Width) { $Width } else { '100%' }
            'margin'     = if ($Margin) { $Margin }
        }
        $Css = ConvertTo-CSS -ClassName $ClassName -Attributes $Attributes

        $Script:HTMLSchema.CustomCSS.Add($Css)
        [string] $Class = "$ClassName overflowHidden"
    } else {
        [string] $Class = 'flexPanel overflowHidden'
    }

    # New-HTMLTag -Tag 'div' -Attributes @{ class = "flexPanel roundedCorners"; style = $DivColumnStyle } {
    New-HTMLTag -Tag 'div' -Attributes @{ class = "$Class roundedCorners overflowHidden"; style = $DivColumnStyle } {
        Invoke-Command -ScriptBlock $Content
    }
}