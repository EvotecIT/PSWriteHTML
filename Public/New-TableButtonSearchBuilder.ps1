function New-TableButtonSearchBuilder {
    [alias('TableButtonSearchBuilder', 'EmailTableButtonSearchBuilder', 'New-HTMLTableButtonSearchBuilder')]
    [CmdletBinding()]
    param(
        [string] $ButtonName,
        [int] $DepthLimit = 2,
        [string] $DefaultLogic,
        [switch] $GreyScale
    )
    $Script:HTMLSchema.Features.DataTablesButtons = $true
    $Script:HTMLSchema.Features.DataTablesSearchBuilder = $true
    $Output = @{
        config = @{}
    }
    $Output['extend'] = 'searchBuilder'
    if ($GreyScale) {
        $Output['config']['greyscale'] = $true
    }
    if ($ButtonName) {
        $Output['text'] = $ButtonName
    }
    if ($DepthLimit) {
        $Output['config']['depthLimit'] = $DepthLimit
    }
    if ($DefaultLogic) {
        $Output['config']['logic'] = $DefaultLogic
    }
    [PSCustomObject] @{
        Type   = 'TableButtonSearchBuilder'
        Output = $Output
    }
}