function New-HTMLTag {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][alias('Content')][ScriptBlock] $Value,
        [Parameter(Mandatory = $true, Position = 1)][string] $Tag,
        [System.Collections.IDictionary] $Attributes,
        [switch] $SelfClosing,
        [switch] $NoClosing,
        [switch] $NewLine
    )
    # It's really hard to debug problems with this, lets see if this helps
    try {
        $ScriptBlockResult = if ($null -eq $Value) { '' } else { Invoke-Command -ScriptBlock $Value -ErrorAction Stop }
    } catch {
        Write-Warning -Message "New-HTMLTag - Error: $($_.Exception.Message). Failed value: $($Value.ToString())"
        $ScriptBlockResult = ''
    }
    $HTMLTag = [Ordered] @{
        Tag         = $Tag
        Value       = $ScriptBlockResult
        Attributes  = $Attributes
        SelfClosing = $SelfClosing
        NoClosing   = $NoClosing
    }
    Set-Tag -HtmlObject $HTMLTag -NewLine:$NewLine
}