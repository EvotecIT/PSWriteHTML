function New-TableButtonColumnVisibility {
    <#
    .SYNOPSIS
    Creates a new table button for column visibility control.

    .DESCRIPTION
    This function creates a new table button for controlling the visibility of columns in a table. It allows customization of the button text, layout, and other properties.

    .PARAMETER ButtonName
    Specifies the text to display on the button.

    .PARAMETER CollectionTitle
    Specifies the title for the column visibility control collection. Default is 'Visibility control'.

    .PARAMETER CollectionPosition
    Specifies the position of the collection (fixed or dropdown). Default is 'dropdown'.

    .PARAMETER CollectionLayout
    Specifies the layout of the collection (columns, two-column, three-column, four-column). Default is 'columns'.

    .PARAMETER DropUp
    Indicates whether the collection should be displayed as a drop-up menu.

    .PARAMETER Fade
    Specifies the fade effect duration when toggling visibility.

    .EXAMPLE
    New-TableButtonColumnVisibility -ButtonName "Toggle Columns" -CollectionTitle "Column Visibility" -CollectionPosition "fixed" -CollectionLayout "two-column" -DropUp -Fade 500
    Creates a new table button with the specified properties.

    #>
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