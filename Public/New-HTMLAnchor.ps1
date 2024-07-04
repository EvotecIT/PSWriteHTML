function New-HTMLAnchor {
    <#
    .SYNOPSIS
    Creates a new HTML anchor element.

    .DESCRIPTION
    This function creates a new HTML anchor element (<a>) with specified attributes.

    .PARAMETER Name
    The name of the anchor element.

    .PARAMETER Id
    The ID of the anchor element.

    .PARAMETER Target
    Specifies where to open the linked document.

    .PARAMETER Class
    The CSS class of the anchor element.

    .PARAMETER HrefLink
    The URL of the linked document.

    .PARAMETER OnClick
    JavaScript code to execute when the anchor element is clicked.

    .PARAMETER Style
    The CSS styles to apply to the anchor element.

    .PARAMETER Text
    The text to display within the anchor element.

    .EXAMPLE
    New-HTMLAnchor -Target _parent
    Creates an anchor element with the target attribute set to "_parent".

    New-HTMLAnchor -Id "show_$RandomNumber" -Href '#' -OnClick "show('$RandomNumber');" -Style "color: #ffffff; display:none;" -Text 'Show'
    Creates an anchor element with specified attributes and text.

    Output:
    <a id="show_$RandomNumber" class="" target="_parent" href="#" onclick="show('$RandomNumber');" style="color: #ffffff; display:none;">Show</a>

    .NOTES
    This function is part of a set of functions for generating HTML elements.
    #>
    [alias('New-HTMLLink')]
    [cmdletBinding()]
    param(
        [alias('AnchorName')][string] $Name,
        [string] $Id,
        [string] $Target, # "_blank|_self|_parent|_top|framename"
        [string] $Class,
        [alias('Url', 'Link', 'UrlLink', 'Href')][string] $HrefLink,
        [string] $OnClick,
        [System.Collections.IDictionary] $Style,
        [alias('AnchorText', 'Value')][string] $Text
    )
    $Attributes = [ordered]@{
        'id'      = $Id
        'name'    = $Name
        'class'   = $Class
        'target'  = $Target
        'href'    = $HrefLink
        'onclick' = $OnClick
        'style'   = $Style
    }
    New-HTMLTag -Tag 'a' -Attributes $Attributes {
        $Text
    }
}