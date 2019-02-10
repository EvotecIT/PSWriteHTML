function New-HTMLHorizontalLine {
    [CmdletBinding()]
    param()
    New-HTMLTag -Tag 'hr' -SelfClosing
}