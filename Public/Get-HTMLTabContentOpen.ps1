Function Get-HTMLTabContentOpen {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $TabName,
        [Parameter(Mandatory = $true)]
        [String]
        $TabHeading
    )
    $TabContent = @()
    $TabContent += '<div id="' + $TabName + '" class="tabcontent">'

    $TabContent += "<h7>$TabHeading</h7>"
    write-output $TabContent
}