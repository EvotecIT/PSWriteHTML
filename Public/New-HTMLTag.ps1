function New-HTMLTag {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][alias('Content')][ScriptBlock] $Value,
        [Parameter(Mandatory = $true, Position = 1)][string] $Tag,
        [System.Collections.IDictionary] $Attributes,
        [switch] $SelfClosing,
        [switch] $NewLine
    )
    $HTMLTag = [Ordered] @{
        Tag         = $Tag
        Attributes  = $Attributes
        Value       = if ($null -eq $Value) { '' } else { Invoke-Command -ScriptBlock $Value }
        SelfClosing = $SelfClosing
    }
    $HTML = Set-Tag -HtmlObject $HTMLTag -NewLine:$NewLine
    return $HTML
}