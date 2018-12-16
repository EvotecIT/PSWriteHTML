Function Get-HTMLTabHeader {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true)]
        [Array]
        $TabNames
    )

    $TabHeader = @()
    $TabHeader += '<ul class="tab">'
    $FirstTab = $true
    Foreach ($TabName in $TabNames) {
        if ($FirstTab) {
            $TabHeader += '		<li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, ''' + $TabName + ''')" id="defaultOpen">' + $TabName + '</a></li>'
            $FirstTab = $false
        } else {
            $TabHeader += '		<li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, ''' + $TabName + ''')">' + $TabName + '</a></li>'
        }

    }
    $TabHeader += '</ul>'
    Set-Variable -Scope global -Name TabHeaderCreated -Value $true
    Write-output $TabHeader
}
