function Add-HTMLImage {
    <#
    .SYNOPSIS


    .DESCRIPTION
    Long description

    .PARAMETER Source
    Parameter description

    .PARAMETER UrlLink
    Parameter description

    .PARAMETER AlternativeText
    Parameter description

    .PARAMETER Class
    Parameter description

    .PARAMETER Target
    Parameter description

    .PARAMETER Width
    Parameter description

    .PARAMETER Height
    Parameter description

    .EXAMPLE
    Add-HTMLImage -Source 'https://evotec.pl/image.png' -UrlLink 'https://evotc.pl/' -AlternativeText 'My other text' -Class 'otehr' -Width '100%'

    .NOTES
    General notes
    #>

    [CmdletBinding()]
    param(
        [string] $Source,
        [Uri] $UrlLink = '',
        [string] $AlternativeText = '',
        [string] $Class = 'Logo',
        [string] $Target = '_blank',
        [string] $Width,
        [string] $Height
    )
    [System.Collections.IDictionary] $Image = [Ordered] @{
        Tag        = 'img'
        Attributes = [ordered]@{
            'src'    = "$Source"
            'alt'    = "$AlternativeText"
            'width'  = "$Height"
            'height' = "$Width"
        }
        Value      = '' # if value is blank it will not be used
    }

    [System.Collections.IDictionary] $A = [Ordered] @{
        Tag        = 'a'
        Attributes = [ordered]@{
            'target' = $Target
            'href'   = $UrlLink
        }
        Value      = $Image
    }

    [System.Collections.IDictionary] $Div = [Ordered] @{
        Tag        = 'div'
        Attributes = [ordered]@{
            'class' = "$Class".ToLower()
        }
        Value      = $A
    }
    $HTML = Set-Tag -HtmlObject $Div
    return $HTML

}