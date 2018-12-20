Function Get-HTMLColumn {
    [CmdletBinding()]
    param
    (

        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [int]$ColumnNumber = 1,
        [Parameter(Mandatory = false, ParameterSetName = 'open')]
        [int]$ColumnCount = 1,
        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [switch] $Open,
        [Parameter(Mandatory = $false, ParameterSetName = 'close')]
        [switch] $Close
    )
    $HTML = New-GenericList -Type [string]
    if ($Open) {
        $ColumnItem = [string]$ColumnNumber + "of" + [string]$ColumnCount
        Write-Verbose $ColumnItem
        $ColumnItem = $ColumnItem.replace('1', 'one').replace('2', 'two').replace('3', 'three').replace('4', 'four').replace('5', 'five').replace('6', 'six')
        Write-Verbose $ColumnItem
        $HTML.Add('<div class="' + $ColumnItem + ' column">')
    }
    if ($Close) {
        $HTML.Add('</div>')
    }
    return $HTML
}