Function New-HtmlPage {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 0)][string] $Name,
        [Parameter(Position = 1)][ValidateNotNull()][ScriptBlock] $ServiceData = $(Throw "No test script block is provided. (Have you put the open curly brace on the next line?)"),
        [switch] $UseCssLinks,
        [switch] $UseStyleLinks
    )
    Begin {}
    Process {
        $HTML = "<HTML>"
        $HTML += Add-HTMLHead -UseStyleLinks:$UseStyleLinks -UseCssLinks:$UseCssLinks
        $HTML += "<BODY>"
        $HTML += Invoke-Command -ScriptBlock $ServiceData
        $HTML += Get-JavaScript -FilePath "$PSScriptRoot\..\Resources\JS\Additional\LoadEnlighter.js"
        $HTML += "</BODY>"
    }
    End {
        $HTML += "</HTML>"
        return $HTML
    }
}