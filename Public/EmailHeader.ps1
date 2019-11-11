function EmailHeader {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][ScriptBlock] $EmailHeader
    )
    $EmailHeaders = Invoke-Command -ScriptBlock $EmailHeader
    $EmailHeaders
}