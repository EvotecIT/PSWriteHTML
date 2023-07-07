function New-TableButtonColumnVisibility {
    [alias('TableButtonColumnVisibility', 'New-HTMLTableButtonColumnVisibility')]
    [CmdletBinding()]
    param(
        [string] $Title
    )
    $Script:HTMLSchema.Features.DataTablesButtons = $true
    $Script:HTMLSchema.Features.DataTablesButtonsColVis = $true
    $Output = @{}
    $Output['extend'] = 'colvis'
    if ($Title) {
        $Output['title'] = $title
    }
    $Output['collectionLayout'] = 'fixed columns'
    $Output['collectionTitle'] = 'Column visibility control'
    [PSCustomObject] @{
        Type   = 'TableButtonColumnVisibility'
        Output = $Output

    }
}