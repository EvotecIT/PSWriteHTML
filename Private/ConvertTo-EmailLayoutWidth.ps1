function ConvertTo-EmailLayoutWidth {
    <#
    .SYNOPSIS
    Converts an email layout width into CSS and an optional legacy HTML width.
    .DESCRIPTION
    Unitless and pixel widths use a numeric HTML attribute; percentages retain
    their unit. Other CSS lengths remain in CSS without an invalid HTML width.
    #>
    [CmdletBinding()]
    param(
        [string] $Width
    )

    $CssWidth = ConvertFrom-Size -Size $Width
    $HtmlWidth = $null
    if ($Width -match '^\s*(\d+(?:\.\d+)?)\s*(px|%)?\s*$') {
        $HtmlWidth = $Matches[1]
        if ($Matches[2] -eq '%') {
            $HtmlWidth += '%'
            $CssWidth = $HtmlWidth
        } else {
            $CssWidth = "$($Matches[1])px"
        }
    }

    [pscustomobject]@{
        Css  = $CssWidth
        Html = $HtmlWidth
    }
}
