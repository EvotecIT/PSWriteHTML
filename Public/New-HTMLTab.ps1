function New-HTMLTab {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $HtmlData = $(Throw "No curly brace?)"),
        [alias('TabName')][Parameter(Mandatory, Position = 1)][String] $Name,
        [Parameter(Mandatory = $false, Position = 2)][String]$TabHeading

    )
    New-HTMLTag -Tag 'div' -Attributes @{ id = $Name; class = 'tabcontent' } {
        if (-not [string]::IsNullOrWhiteSpace($TabHeading)) {
            New-HTMLTag -Tag 'h7' {
                $TabHeading
            }
        }
        Invoke-Command -ScriptBlock $HtmlData
    }
    New-HTMLResourceJS -Content {
        #// Get the element with id="defaultOpen" and click on it
        'document.getElementById("defaultOpen").click();'
    }   
}