function New-HTMLAnchor {
    <#
    .SYNOPSIS
    Short description
    
    .DESCRIPTION
    Long description
    
    .PARAMETER Name
    Parameter description
    
    .PARAMETER Id
    Parameter description
    
    .PARAMETER Target
    Parameter description
    
    .PARAMETER Class
    Parameter description
    
    .PARAMETER HrefLink
    Parameter description
    
    .PARAMETER OnClick
    Parameter description
    
    .PARAMETER Style
    Parameter description
    
    .PARAMETER Text
    Parameter description
    
    .EXAMPLE
    New-HTMLAnchor -Target _parent

    Output:
    <a target = "_parent" />
    
    .NOTES
    General notes
    #>
    

    param(
        [alias('AnchorName')][string] $Name,
        [string] $Id,
        [string] $Target, # "_blank|_self|_parent|_top|framename"
        [string] $Class,
        [alias('Url', 'Link', 'UrlLink', 'Href')][string] $HrefLink,
        [string] $OnClick,
        [string] $Style,
        [alias('AnchorText', 'Value')][string] $Text
    )
    [System.Collections.IDictionary] $Anchor = [Ordered] @{
        Tag        = 'a'
        Attributes = [ordered]@{
            'id'      = $Id
            'name'    = $Name
            'class'   = $Class
            'target'  = $Target
            'href'    = $HrefLink
            'onclick' = $OnClick
            'style'   = $Style
        }
        Value      = $Text # if value is blank it will not be used
    }
    $HTML = Set-Tag -HtmlObject $Anchor
    return $HTML
}

#$Show = New-HTMLAnchor -Id "show_$RandomNumber" -Href '#' -OnClick "show('$RandomNumber');" -Style "color: #ffffff; display:none;" -Text 'Show' 
#$Show