Function New-HTMLContent {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content = $(Throw "Open curly brace with Content"),
        [Parameter(Mandatory = $false)][string]$HeaderText,
        [RGBColors]$HeaderTextColor = [RGBColors]::White,
        [string][ValidateSet('center', 'left', 'right', 'justify')] $HeaderTextAlignment = 'center',
        [alias('BackgroundShade')][RGBColors]$BackgroundColor,
        [Parameter(Mandatory = $false)][switch] $CanCollapse,
        [Parameter(Mandatory = $false)][switch]$IsHidden
    )
    Begin {}
    Process {
        $RandomNumber = Get-Random
        $TextHeaderColorFromRGB = ConvertFrom-Color -Color $HeaderTextColor
        if ($null -ne $BackgroundColor) {
            $BackGroundColorFromRGB = ConvertFrom-Color -Color $BackgroundColor
            $BGStyleColor = "background-color:$BackGroundColorFromRGB;"
        } else {
            $BGStyleColor = ''
        }
        if ($CanCollapse) {
            if ($IsHidden) {
                $ShowStyle = "color: $TextHeaderColorFromRGB" # shows Show button
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
                $ShowStyle = "color: $TextHeaderColorFromRGB; display:none"  # hides Show button 
                $HideStyle = "color: $TextHeaderColorFromRGB; display:none;" # hides Show button
            }
        }
        if ($IsHidden) {
            $DivContentStyle = "display:none;$BGStyleColor"
        } else { 
            $DivContentStyle = $BGStyleColor
        }

        $DivHeaderStyle = "text-align: $HeaderTextAlignment;"
        $HeaderStyle = "color: $TextHeaderColorFromRGB;"
        $Header = New-HTMLAnchor -Name $HeaderText -Text $HeaderText -Style $HeaderStyle
        $Show = New-HTMLAnchor -Id "show_$RandomNumber" -Href '#' -OnClick "show('$RandomNumber');" -Style $ShowStyle -Text '(Show)' 
        $Hide = New-HTMLAnchor -Id "hide_$RandomNumber" -Href '#' -OnClick "hide('$RandomNumber');" -Style $HideStyle -Text '(Hide)' 

        $DivHeader = [Ordered] @{
            Tag        = 'div'
            Attributes = [ordered]@{
                'class' = "header"
                'style' = $DivHeaderStyle
            }
            Value      = $Header, $Show, $Hide
        }
        <#
        $DivContent = [Ordered] @{
            Tag         = 'div'
            Attributes  = [ordered]@{
                'id'    = $RandomNumber
                'class' = "content card"
                'style' = $DivContentStyle 
            }
            Value       = Invoke-Command -ScriptBlock $Content
            SelfClosing = $false
        }
        #>
        $ScriptContent = Invoke-Command -ScriptBlock $Content

        $DivSection = [Ordered] @{
            Tag        = 'div'
            Attributes = [ordered]@{
                'class' = "section card"
                'style' = $DivContentStyle 
            }
            Value      = $DivHeader, $ScriptContent
        }
        $HTML = Set-Tag -HtmlObject $DivSection
        return $Html
    }
    
}