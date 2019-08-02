Function New-HTMLPanel {
    [alias('New-HTMLColumn')]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content = $(Throw "Open curly brace with Content"),
        #[alias('ColumnCount', 'Columns')][ValidateSet('1', '2', '3', '4', '5 ', '6', '7', '8', '9', '10', '11', '12')][string] $Count = 1,
        [alias('BackgroundShade')][RGBColors]$BackgroundColor = [RGBColors]::None,
        [switch] $Invisible #,
        # [int] $Height
    )
    #if ($Height -ne 0) {
    #     $StyleHeight = "height: $($Height)px"
    #}
    # $StyleWidth = "width: calc(100% / $Count - 10px)"

    if ($BackgroundColor -ne [RGBColors]::None) {
        $BackGroundColorFromRGB = ConvertFrom-Color -Color $BackgroundColor
        $DivColumnStyle = "background-color:$BackGroundColorFromRGB;"
    } else {
        $DivColumnStyle = ""
    }
    if ($Invisible) {
        $DivColumnStyle = "$DivColumnStyle box-shadow: unset !important;"
    }
   # New-HTMLTag -Tag 'div' -Attributes @{ class = "flexPanel roundedCorners"; style = $DivColumnStyle } {
    New-HTMLTag -Tag 'div' -Attributes @{ class = "flexPanel roundedCorners overflowHidden"; style = $DivColumnStyle } {
        Invoke-Command -ScriptBlock $Content
    }
}