Function New-HTMLContent {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content = $(Throw "Open curly brace with Content"),
        [alias('ColumnCount', 'Columns')][ValidateSet('1', '2', '3', '4', '5 ', '6', '7', '8', '9', '10', '11', '12')][string] $Count = 1,
        [Parameter(Mandatory = $false)][string]$HeaderText,
        [RGBColors]$HeaderTextColor = [RGBColors]::White,
        [string][ValidateSet('center', 'left', 'right', 'justify')] $HeaderTextAlignment = 'center',
        [alias('BackgroundShade')][RGBColors]$BackgroundColor,
        [Parameter(Mandatory = $false)][switch] $CanCollapse,
        [Parameter(Mandatory = $false)][switch] $IsHidden,
        [int] $Height
    )
    $RandomNumber = Get-Random
    $TextHeaderColorFromRGB = ConvertFrom-Color -Color $HeaderTextColor
    if ($null -ne $BackgroundColor) {
        $BackGroundColorFromRGB = ConvertFrom-Color -Color $BackgroundColor
        $BGStyleColor = "background-color:$BackGroundColorFromRGB;"
    } else {
        $BGStyleColor = ''
    }
    if ($CanCollapse) {
        $Script:HTMLSchema.Features.HideSection = $true
        if ($IsHidden) {
            $ShowStyle = "color: $TextHeaderColorFromRGB;" # shows Show button
            $HideStyle = "color: $TextHeaderColorFromRGB; display:none;" # hides Hide button 
        } else {
            $ShowStyle = "color: $TextHeaderColorFromRGB; display:none;" # hides Show button
            $HideStyle = "color: $TextHeaderColorFromRGB;" # shows Hide button 
        }
    } else {
        if ($IsHidden) {
            $ShowStyle = "color: $TextHeaderColorFromRGB;" # shows Show button
            $HideStyle = "color: $TextHeaderColorFromRGB; display:none;" # hides Hide button 
        } else {
            $ShowStyle = "color: $TextHeaderColorFromRGB; display:none;"  # hides Show button 
            $HideStyle = "color: $TextHeaderColorFromRGB; display:none;" # hides Show button
        }
    }

    if ($Height -ne 0) { $StyleHeight = "height: $($Height)px" }    
    $StyleWidth = "width: calc(100% / $Count - 15px)"

    if ($IsHidden) {
        $DivContentStyle = "display:none; $BGStyleColor; $StyleWidth; $StyleHeight;"
    } else { 
        $DivContentStyle = "$BGStyleColor; $StyleWidth; $StyleHeight;"
    }

    $DivHeaderStyle = "text-align: $HeaderTextAlignment;"
    $HeaderStyle = "color: $TextHeaderColorFromRGB;"

    # return this HTML
    New-HTMLTag -Tag 'div' -Attributes @{ 'class' = "defaultSection defaultCard"; 'style' = $DivContentStyle } -Value {
        New-HTMLTag -Tag 'div' -Attributes @{ 'class' = "defaultHeader"; 'style' = $DivHeaderStyle  } -Value {
            New-HTMLAnchor -Name $HeaderText -Text $HeaderText -Style $HeaderStyle
            New-HTMLAnchor -Id "show_$RandomNumber" -Href '#' -OnClick "show('$RandomNumber');" -Style $ShowStyle -Text '(Show)' 
            New-HTMLAnchor -Id "hide_$RandomNumber" -Href '#' -OnClick "hide('$RandomNumber');" -Style $HideStyle -Text '(Hide)' 
        }

        New-HTMLTag -Tag 'div' -Attributes @{ class = 'collapsable'; id = $RandomNumber; } -Value {
            Invoke-Command -ScriptBlock $Content
        }
    }
}