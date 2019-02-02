function New-HTMLCanvas {
    [CmdletBinding()]
    param(
        [alias('Value')][Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content = $(Throw "Open curly brace with Content"),
        [string] $ID,
        [string] $Width,
        [string] $Height,
        [string] $Style
    )
    $Canvas = [Ordered] @{
        Tag         = 'canvas'
        Attributes  = [ordered]@{
            'id'     = $Id
            'width'  = $Width
            'height' = $Height
            'style'  = $Style
        }
        SelfClosing = $false
        Value       = Invoke-Command -ScriptBlock $Content
    }
    $HTML = Set-Tag -HtmlObject $Canvas
    return $HTML
}