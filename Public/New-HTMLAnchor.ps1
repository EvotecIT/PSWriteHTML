function New-HTMLAnchor {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER Name
    Parameter description

    .PARAMETER Target
    Target options: "_blank|_self|_parent|_top|framename"

    .PARAMETER Class

    .PARAMETER HrefLink
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
        [string] $Target,
        [string] $Class,
        [alias('Url', 'Link', 'UrlLink')][string] $HrefLink,
        [alias('AnchorText')][string] $Text
    )
    [System.Collections.IDictionary] $Anchor = [Ordered] @{
        Tag        = 'a'
        Attributes = [ordered]@{
            'name'   = $Name
            'class'  = $Class
            'target' = $Target
            'href'   = $HrefLink
        }
        Value      = $Text # if value is blank it will not be used
    }
    $HTML = Set-Tag -HtmlObject $Anchor
    return $HTML
}