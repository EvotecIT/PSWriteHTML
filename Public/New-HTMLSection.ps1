Function New-HTMLSection {
    [alias('New-HTMLContent', 'Section')]
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content = $(Throw "Open curly brace"),
        [alias('Name')][Parameter(Mandatory = $false)][string]$HeaderText,
        [alias('TextColor')][string]$HeaderTextColor = "White",
        [alias('TextAlignment')][string][ValidateSet('center', 'left', 'right', 'justify')] $HeaderTextAlignment = 'center',
        [alias('TextBackGroundColor')][string]$HeaderBackGroundColor = "DeepSkyBlue",
        [alias('BackgroundShade')][string]$BackgroundColor = "",
        [alias('Collapsable')][Parameter(Mandatory = $false)][switch] $CanCollapse,
        [Parameter(Mandatory = $false)][switch] $IsHidden,
        [switch] $Collapsed,
        [int] $Height,
        [switch] $Invisible,
        # Following are based on https://css-tricks.com/snippets/css/a-guide-to-flexbox/
        [string][ValidateSet('wrap', 'nowrap', 'wrap-reverse')] $Wrap,
        [string][ValidateSet('row', 'row-reverse', 'column', 'column-reverse')] $Direction,
        [string][ValidateSet('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch')] $AlignContent,
        [string][ValidateSet('stretch', 'flex-start', 'flex-end', 'center', 'baseline')] $AlignItems

    )
    $RandomNumber = Get-Random
    $TextHeaderColorFromRGB = ConvertFrom-Color -Color $HeaderTextColor

    $HiddenDivStyle = @{ }

    if ($CanCollapse) {
        $Script:HTMLSchema.Features.HideSection = $true
        if ($IsHidden) {
            $ShowStyle = "color: $TextHeaderColorFromRGB;" # shows Show button
            $HideStyle = "color: $TextHeaderColorFromRGB; display:none;" # hides Hide button
        } else {
            if ($Collapsed) {
                $HideStyle = "color: $TextHeaderColorFromRGB; display:none;" # hides Show button
                $ShowStyle = "color: $TextHeaderColorFromRGB;" # shows Hide button
                # $HiddenDivStyle = 'display:none; '
                $HiddenDivStyle['display'] = 'none'
            } else {
                $ShowStyle = "color: $TextHeaderColorFromRGB; display:none;" # hides Show button
                $HideStyle = "color: $TextHeaderColorFromRGB;" # shows Hide button
            }
        }
    } else {
        if ($IsHidden) {
            $ShowStyle = "color: $TextHeaderColorFromRGB;" # shows Show button
            $HideStyle = "color: $TextHeaderColorFromRGB; display:none;" # hides Hide button
        } else {
            $ShowStyle = "color: $TextHeaderColorFromRGB; display:none;" # hides Show button
            $HideStyle = "color: $TextHeaderColorFromRGB; display:none;" # hides Show button
        }
    }
    if ($IsHidden) {
        $DivContentStyle = @{
            "display"          = 'none'
            #"width"            = "calc(100% / $Count - 15px)"
            #"height"           = if ($Height -ne 0) { "$($Height)px" } else { '' }
            "background-color" = ConvertFrom-Color -Color $BackgroundColor
        }
    } else {
        $DivContentStyle = @{
            # "width"            = "calc(100% / $Count - 15px)"
            #"height"           = if ($Height -ne 0) { "$($Height)px" } else { '' }
            "background-color" = ConvertFrom-Color -Color $BackgroundColor
        }
    }

    $HiddenDivStyle['height'] = if ($Height -ne 0) { "$($Height)px" } else { '' }

    <#
    .flexParent {
        display: flex;
        flex-wrap: nowrap;
        justify-content: space-between;
        padding: 2px;
        /*
        overflow: hidden;
        overflow-x: hidden;
        overflow-y: hidden;
        */
    }
    #>

    if ($Wrap -or $Direction) {
        [string] $ClassName = "flexParent$(Get-RandomStringName -Size 8 -LettersOnly)"
        $Attributes = @{
            'display'        = 'flex'
            'flex-wrap'      = if ($Wrap) { $Wrap } else { }
            'flex-direction' = if ($Direction) { $Direction } else { }
            'align-content'  = if ($AlignContent) { $AlignContent } else { }
            'align-items'    = if ($AlignItems) { $AlignItems } else { }
        }
        $Css = ConvertTo-CSS -ClassName $ClassName -Attributes $Attributes

        $Script:HTMLSchema.CustomCSS.Add($Css)
    } else {
        [string] $ClassName = 'flexParent'
    }

    $DivHeaderStyle = @{
        "text-align"       = $HeaderTextAlignment
        "background-color" = ConvertFrom-Color -Color $HeaderBackGroundColor
    }
    $HeaderStyle = "color: $TextHeaderColorFromRGB;"
    if ($Invisible) {
        #New-HTMLTag -Tag 'div' -Attributes @{ class = 'flexParentInvisible' } -Value {
        New-HTMLTag -Tag 'div' -Attributes @{ class = $ClassName } -Value {
            New-HTMLTag -Tag 'div' -Attributes @{ class = "$ClassName flexElement overflowHidden" } -Value {
                # New-HTMLTag -Tag 'div' -Attributes @{ class = 'flexParentInvisible flexElement' } -Value {
                $Object = Invoke-Command -ScriptBlock $Content
                if ($null -ne $Object) {
                    $Object
                }
            }
        }
    } else {
        # return this HTML
        New-HTMLTag -Tag 'div' -Attributes @{ 'class' = "defaultSection roundedCorners overflowHidden"; 'style' = $DivContentStyle } -Value {
            New-HTMLTag -Tag 'div' -Attributes @{ 'class' = "defaultHeader"; 'style' = $DivHeaderStyle } -Value {
                New-HTMLAnchor -Name $HeaderText -Text "$HeaderText " -Style $HeaderStyle
                New-HTMLAnchor -Id "show_$RandomNumber" -Href 'javascript:void(0)' -OnClick "show('$RandomNumber');" -Style $ShowStyle -Text '(Show)'
                New-HTMLAnchor -Id "hide_$RandomNumber" -Href 'javascript:void(0)' -OnClick "hide('$RandomNumber');" -Style $HideStyle -Text '(Hide)'
            }
            New-HTMLTag -Tag 'div' -Attributes @{ class = "$ClassName overflowHidden"; id = $RandomNumber; Style = $HiddenDivStyle } -Value {
                New-HTMLTag -Tag 'div' -Attributes @{ class = "$ClassName flexElement collapsable overflowHidden"; id = $RandomNumber; } -Value {
                    $Object = Invoke-Command -ScriptBlock $Content
                    if ($null -ne $Object) {
                        $Object
                    }
                }
            }
        }
    }
}
