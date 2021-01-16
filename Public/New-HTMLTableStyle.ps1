function New-HTMLTableStyle {
    [alias('EmailTableStyle', 'TableStyle', 'New-TableStyle')]
    [cmdletBinding()]
    param(
        [ValidateSet('Table', 'Header', 'Row', 'Footer', 'RowOdd', 'RowEven', 'RowSelected', 'RowSelectedEven', 'RowSelectedOdd', 'RowHover', 'RowHoverSelected', 'Button')][string] $Type = 'Table',
        [Parameter(ParameterSetName = 'Manual')][alias('TextSize')][string] $FontSize,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('normal', 'italic', 'oblique')][string] $FontStyle,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('normal', 'small-caps')][string] $FontVariant,
        [Parameter(ParameterSetName = 'Manual')][string] $FontFamily,
        [Parameter(ParameterSetName = 'Manual')][string] $BackgroundColor,
        [Parameter(ParameterSetName = 'Manual')][string] $TextColor,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('none', 'line-through', 'overline', 'underline')][string] $TextDecoration,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransform,
        [alias('FontAlign', 'Align')][Parameter(ParameterSetName = 'Manual')][ValidateSet('left', 'right', 'center', 'justify')][string] $TextAlign
    )
    $CssConfiguration = Get-ConfigurationCss -Feature 'DataTables' -Type 'HeaderAlways'
    #$Row = @(
    #    'table.dataTable tbody tr'
    #)
    $RowOdd = @(
        'table.dataTable.stripe tbody tr.odd, table.dataTable.display tbody tr.odd'
        'table.dataTable.display tbody tr.odd>.sorting_1, table.dataTable.order-column.stripe tbody tr.odd>.sorting_1'
        'table.dataTable.display tbody tr.odd>.sorting_2, table.dataTable.order-column.stripe tbody tr.odd>.sorting_2'
        'table.dataTable.display tbody tr.odd>.sorting_3, table.dataTable.order-column.stripe tbody tr.odd>.sorting_3'
    )
    $RowEven = @(
        'table.dataTable.stripe tbody tr.even, table.dataTable.display tbody tr.even'
        'table.dataTable.display tbody tr.even>.sorting_1, table.dataTable.order-column.stripe tbody tr.even>.sorting_1'
        'table.dataTable.display tbody tr.even>.sorting_2, table.dataTable.order-column.stripe tbody tr.even>.sorting_2'
        'table.dataTable.display tbody tr.even>.sorting_3, table.dataTable.order-column.stripe tbody tr.even>.sorting_3'
    )
    #$RowSelected = @(
    #    'table.dataTable tbody tr.selected'
    #)
    $RowSelectedOdd = @(
        'table.dataTable.stripe tbody tr.odd.selected, table.dataTable.display tbody tr.odd.selected'
        'table.dataTable.display tbody tr.odd.selected>.sorting_1, table.dataTable.order-column.stripe tbody tr.odd.selected>.sorting_1'
        'table.dataTable.display tbody tr.odd.selected>.sorting_2, table.dataTable.order-column.stripe tbody tr.odd.selected>.sorting_2'
        'table.dataTable.display tbody tr.odd.selected>.sorting_3, table.dataTable.order-column.stripe tbody tr.odd.selected>.sorting_3'
    )
    $RowSelectedEven = @(
        'table.dataTable.stripe tbody tr.even.selected, table.dataTable.display tbody tr.even.selected'
        'table.dataTable.order-column tbody tr.selected>.sorting_1, table.dataTable.order-column tbody tr.selected>.sorting_2, table.dataTable.order-column tbody tr.selected>.sorting_3, table.dataTable.display tbody tr.selected>.sorting_1, table.dataTable.display tbody tr.selected>.sorting_2, table.dataTable.display tbody tr.selected>.sorting_3'
        'table.dataTable.display tbody tr.even.selected>.sorting_1, table.dataTable.order-column.stripe tbody tr.even.selected>.sorting_1'
        'table.dataTable.display tbody tr.even.selected>.sorting_2, table.dataTable.order-column.stripe tbody tr.even.selected>.sorting_2'
        'table.dataTable.display tbody tr.even.selected>.sorting_3, table.dataTable.order-column.stripe tbody tr.even.selected>.sorting_3'
    )
    $RowHover = @(
        'table.dataTable.hover tbody tr:hover, table.dataTable.display tbody tr:hover'
        'table.dataTable.display tbody tr:hover>.sorting_1, table.dataTable.order-column.hover tbody tr:hover>.sorting_1'
        'table.dataTable.display tbody tr:hover>.sorting_2, table.dataTable.order-column.hover tbody tr:hover>.sorting_2'
        'table.dataTable.display tbody tr:hover>.sorting_3, table.dataTable.order-column.hover tbody tr:hover>.sorting_3'
    )
    $RowHoverSelected = @(
        'table.dataTable.hover tbody tr.odd:hover.selected, table.dataTable.display tbody tr.odd:hover.selected'
        'table.dataTable.hover tbody tr:hover.selected, table.dataTable.display tbody tr:hover.selected'
        'table.dataTable.display tbody tr:hover.selected>.sorting_1, table.dataTable.order-column.hover tbody tr:hover.selected>.sorting_1'
        'table.dataTable.display tbody tr:hover.selected>.sorting_2, table.dataTable.order-column.hover tbody tr:hover.selected>.sorting_2'
        'table.dataTable.display tbody tr:hover.selected>.sorting_3, table.dataTable.order-column.hover tbody tr:hover.selected>.sorting_3'
    )

    $TableStyle = [ordered] @{
        'text-align'       = $TextAlign
        'text-transform'   = $TextTransform
        'color'            = ConvertFrom-Color -Color $TextColor
        'background-color' = ConvertFrom-Color -Color $BackgroundColor
        'font-size'        = ConvertFrom-Size -TextSize $FontSize
        'font-weight'      = $FontWeight
        'font-style'       = $FontStyle
        'font-variant'     = $FontVariant
        'font-family'      = $FontFamily
        'text-decoration'  = $TextDecoration
    }

    # this will add configuration for all Tables as it already exists
    # any new elements will be added, any existing elements will be overwritten
    # any existing elements that are not defined will not be touched
    if ($Type -in 'Button') {
        $ButtonStyle = [ordered] @{}
        if ($TextColor) {
            $ButtonStyle['color'] = "$(ConvertFrom-Color -Color $TextColor) !important"
        }
        if ($BackgroundColor) {
            $ButtonStyle['background-color'] = "$(ConvertFrom-Color -Color $BackgroundColor) !important"
        }
        $ButtonCss = @(
            'td::before, td.sorting_1::before'
        )
        foreach ($Name in $ButtonCss) {
            Add-ConfigurationCSS -CSS $CssConfiguration -Name $Name -Inject $ButtonStyle
        }
    }
    if ($Type -in 'Header', 'Table') {
        Add-ConfigurationCSS -CSS $CssConfiguration -Name 'thead' -Inject $TableStyle
    }
    if ($Type -in 'Footer', 'Table') {
        Add-ConfigurationCSS -CSS $CssConfiguration -Name 'tfoot' -Inject $TableStyle
    }
    if ($Type -in 'RowOdd', 'Row', 'Table') {
        foreach ($Name in $RowOdd) {
            Add-ConfigurationCSS -CSS $CssConfiguration -Name $Name -Inject $TableStyle
        }
    }
    if ($Type -in 'RowEven', 'Row', 'Table') {
        foreach ($Name in $RowEven) {
            Add-ConfigurationCSS -CSS $CssConfiguration -Name $Name -Inject $TableStyle
        }
    }
    # Configures selected rows
    if ($Type -in 'RowSelected', 'RowSelectedOdd') {
        foreach ($Name in $RowSelectedOdd) {
            Add-ConfigurationCSS -CSS $CssConfiguration -Name $Name -Inject $TableStyle
        }
    }
    if ($Type -in 'RowSelected', 'RowSelectedEven') {
        foreach ($Name in $RowSelectedEven) {
            Add-ConfigurationCSS -CSS $CssConfiguration -Name $Name -Inject $TableStyle
        }
    }
    # Configure Rows on Hover
    if ($Type -in 'RowHover') {
        foreach ($Name in $RowHover) {
            Add-ConfigurationCSS -CSS $CssConfiguration -Name $Name -Inject $TableStyle
        }
    }
    # Configure Rows tha are Selected and hovered
    if ($Type -in 'RowHoverSelected') {
        foreach ($Name in $RowHoverSelected) {
            Add-ConfigurationCSS -CSS $CssConfiguration -Name $Name -Inject $TableStyle
        }
    }
}