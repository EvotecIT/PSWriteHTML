function New-HTMLHorizontalLine {
    <#
    .SYNOPSIS
    Creates a horizontal line in HTML.

    .DESCRIPTION
    The New-HTMLHorizontalLine function generates a horizontal line (<hr>) tag in HTML.

    .EXAMPLE
    New-HTMLHorizontalLine
    Generates a horizontal line in HTML.

    #>
    [CmdletBinding()]
    param()
    New-HTMLTag -Tag 'hr' -SelfClosing
}