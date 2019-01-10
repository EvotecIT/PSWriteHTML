function New-HtmlTab {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, Position = 0)][String] $TabName,
        [Parameter(Mandatory = $false, Position = 1)][ValidateNotNull()][ScriptBlock] $TabData = $(Throw "No curly brace?)"),
        [Parameter(Mandatory = $false, Position = 2)][String]$TabHeading

    )
    Begin {}
    Process {
        $HTML = New-GenericList -Type [string]
        $HTML.Add('<div id="' + $TabName + '" class="tabcontent">')
        if (-not [string]::IsNullOrWhiteSpace($TabHeading)) {
            $HTML.Add("<h7>$TabHeading</h7>")
        }
        $HTML.Add((Invoke-Command -ScriptBlock $TabData))
    }
    End {
        $HTML.Add('</div>')
        <#
        $HTML.Add(@"
                <script>
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
"@
        )
#>
        $HTML.Add((Get-JavaScript -FilePath "$PSScriptRoot\..\Resources\JS\Additional\LoadDefaultOpen.js"))
        return $HTML
    }
}