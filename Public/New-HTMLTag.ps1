function New-HTMLTag {
    <#
    .SYNOPSIS
    Creates a new HTML tag with specified attributes and content.

    .DESCRIPTION
    The New-HTMLTag function creates a new HTML tag with the specified tag name, attributes, and content. It supports self-closing tags, custom attributes, and new line formatting.

    .PARAMETER Value
    Specifies the content of the HTML tag as a script block.

    .PARAMETER Tag
    Specifies the name of the HTML tag to create.

    .PARAMETER Attributes
    Specifies additional attributes for the HTML tag.

    .PARAMETER SelfClosing
    Indicates whether the HTML tag is self-closing.

    .PARAMETER NoClosing
    Indicates whether the HTML tag should not have a closing tag.

    .PARAMETER NewLine
    Indicates whether a new line should be added after the HTML tag.

    .EXAMPLE
    New-HTMLTag -Tag "div" -Attributes @{ class = "container" } -Value { "Hello, World!" }

    Creates a <div> tag with the class attribute set to "container" and the content "Hello, World!".

    .EXAMPLE
    New-HTMLTag -Tag "img" -Attributes @{ src = "image.jpg"; alt = "Image" } -SelfClosing

    Creates an <img> tag with the src and alt attributes set and is self-closing.

    #>
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
        $StackTraceList = $_.ScriptStackTrace -split [System.Environment]::NewLine
        foreach ($S in $StackTraceList | Select-Object -First 4) {
            Write-Warning -Message "New-HTMLTag - Review StackTrace: $S"
        }
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