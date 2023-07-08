function New-TableButtonColumnVisibility {
    [alias('TableButtonColumnVisibility', 'New-HTMLTableButtonColumnVisibility')]
    [CmdletBinding()]
    param(
        # [string] $Title,
        [string] $ButtonName,
        #[string[]] $Columns,
        [string] $CollectionTitle = 'Visibility control',
        [ValidateSet('fixed', 'dropdown')][string] $CollectionPosition = 'dropdown',
        [ValidateSet('columns', 'two-column', 'three-column', 'four-column')][string] $CollectionLayout = 'columns',
        [switch] $DropUp,
        [int] $Fade
    )
    $Script:HTMLSchema.Features.DataTablesButtons = $true
    $Script:HTMLSchema.Features.DataTablesButtonsColVis = $true
    $Output = @{
        extend = 'colvis'
    }
    if ($ButtonName) {
        $Output['text'] = $ButtonName
    }
    $Output['collectionLayout'] = "$CollectionPosition $CollectionLayout"
    $Output['popoverTitle'] = $CollectionTitle
    if ($DropUp) {
        $Output['dropup'] = $true
    }
    if ($PSBoundParameters.ContainsKey('Fade')) {
        $Output['fade'] = $Fade
    }
    if ($Columns) {
        # this requires more work, especially implementation of columnDefs
        # this may need to coexist with other features
        # https://datatables.net/extensions/buttons/examples/column_visibility/columns.html
        $Output['columns'] = @(
            foreach ($Column in $Columns) {
                @{ name = $Column }
            }
        )
    }
    [PSCustomObject] @{
        Type   = 'TableButtonColumnVisibility'
        Output = $Output
    }
}