function New-TableButtonSearchBuilder {
    <#
    .SYNOPSIS
    Creates a configuration object for a table button search builder.

    .DESCRIPTION
    This function creates a configuration object for a table button search builder with customizable options.

    .PARAMETER ButtonName
    The name of the button to be displayed.

    .PARAMETER DepthLimit
    The depth limit for the search builder.

    .PARAMETER DefaultLogic
    The default logic to be applied.

    .PARAMETER GreyScale
    Indicates if the search builder should be displayed in greyscale.

    .EXAMPLE
    New-TableButtonSearchBuilder -ButtonName "Search" -DepthLimit 3 -DefaultLogic "AND" -GreyScale
    Creates a search builder button named "Search" with a depth limit of 3, default logic set to "AND", and displayed in greyscale.

    .EXAMPLE
    New-TableButtonSearchBuilder -ButtonName "Filter" -DefaultLogic "OR"
    Creates a search builder button named "Filter" with default logic set to "OR".

    #>
    [alias('TableButtonSearchBuilder', 'EmailTableButtonSearchBuilder', 'New-HTMLTableButtonSearchBuilder')]
    [CmdletBinding()]
    param(
        [string] $ButtonName,
        [int] $DepthLimit = 2,
        [string] $DefaultLogic,
        [switch] $GreyScale
    )
    $Script:HTMLSchema.Features.DataTablesButtons = $true
    $Script:HTMLSchema.Features.DataTablesDateTime = $true
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