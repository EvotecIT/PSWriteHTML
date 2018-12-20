Function Get-HTMLTab {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true, ParameterSetName = 'Open')][String] $TabName,
        [Parameter(Mandatory = $false, ParameterSetName = 'Open')][String]$TabHeading,
        [Parameter(Mandatory = $false, ParameterSetName = 'Open')][switch] $Open,
        [Parameter(Mandatory = $false, ParameterSetName = 'Close')][switch] $Close
    )
    $HTML = New-GenericList -Type [string]
    if ($Open) {
        $HTML.Add('<div id="' + $TabName + '" class="tabcontent">')

        if (-not [string]::IsNullOrWhiteSpace($TabHeading)) {
            $HTML.Add("<h7>$TabHeading</h7>")
        }

    }
    if ($Close) {
        $HTML.Add('</div>')
        $HTML.Add(@"
<script>
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
"@
        )
    }
    write-output $HTML
}