Function Get-HTMLTabContentOpen {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $TabName,
        [Parameter(Mandatory = $false)]
        [String]
        $TabHeading
    )
    $TabContent = @()
    $TabContent += '<div id="' + $TabName + '" class="tabcontent">'

    if (-not [string]::IsNullOrWhiteSpace($TabHeading)) {
        $TabContent += "<h7>$TabHeading</h7>"
    }
    write-output $TabContent
}