function New-HTMLTableStyle {
    <#
    .SYNOPSIS
    Apply new style for HTML Table

    .DESCRIPTION
    Apply new style for HTML Table. Currently only works with DataTables (javascript). It doesn't affect CSS only tables (emails, etc). Keep in mind this affects all tables, not just one.

    .PARAMETER Type
    Choose type to apply style on. You can choose from: 'Content', 'Table', 'Header', 'Row', 'Footer', 'RowOdd', 'RowEven', 'RowSelected', 'RowSelectedEven', 'RowSelectedOdd', 'RowHover', 'RowHoverSelected', 'Button'. Content is duplicate to Row.

    .PARAMETER FontSize
    Set font size for the text.

    .PARAMETER FontWeight
    Set font weight for the text. Allowed options: 'normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900'

    .PARAMETER FontStyle
    Set different font styles to be used for text. Allowed styles: 'normal', 'italic', 'oblique'

    .PARAMETER FontVariant
    Set different font variant to be used for text. Allowed variants: 'normal', 'small-caps'. In a small-caps font, all lowercase letters are converted to uppercase letters. However, the converted uppercase letters appears in a smaller font size than the original uppercase letters in the text.

    .PARAMETER FontFamily
    Specify the font to be used for text.

    .PARAMETER BackgroundColor
    Set the background color. Choose one of the 800 colors or provide a hex value.

    .PARAMETER TextColor
    Set the text color. Choose one of the 800 colors or provide a hex value.

    .PARAMETER TextDecoration
    Set different font decoration. Allowed options are: 'none', 'line-through', 'overline', 'underline'

    .PARAMETER TextTransform
    Set different text transform. Allowed options are: 'uppercase', 'lowercase', 'capitalize'

    .PARAMETER TextAlign
    Set the text alignment. Allowed options are: 'left', 'right', 'center', 'justify'

    .PARAMETER BorderTopStyle
    Set the border style for the top border. Allowed options are: 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'

    .PARAMETER BorderTopColor
    Set the border color for the top border

    .PARAMETER BorderTopWidthSize
    Set the border width for the top border

    .PARAMETER BorderBottomStyle
    Set the border style for the bottom border. Allowed options are: 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'

    .PARAMETER BorderBottomColor
    Set the border color for the bottom border

    .PARAMETER BorderBottomWidthSize
    Set the border width for the bottom border

    .PARAMETER BorderLeftStyle
    Set the border style for the left border. Allowed options are: 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'

    .PARAMETER BorderLeftColor
    Set the border color for the left border

    .PARAMETER BorderLeftWidthSize
    Set the border width for the left border

    .PARAMETER BorderRightStyle
    Set the border style for the right border. Allowed options are: 'none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset'

    .PARAMETER BorderRightColor
    Set the border color for the right border

    .PARAMETER BorderRightWidthSize
    Set the border width for the right border

    .EXAMPLE
    $Table = Get-Process | Select-Object -First 3

    New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Yellow -TextColor Aquamarine -TextAlign center -Type RowOdd
    New-HTMLTableStyle -BackgroundColor Red -TextColor Aquamarine -Type Button
    New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor DarkSlateGray -TextColor Aquamarine -TextAlign center -Type RowEven
    New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor DarkSlateGray -TextColor Aquamarine -TextAlign center -Type Row
    New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor DarkSlateGray -TextColor Aquamarine -TextAlign center -Type Header
    New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Orange -TextColor Aquamarine -TextAlign center -Type Footer
    New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Orange -TextColor Aquamarine -TextAlign center -Type RowSelectedEven
    New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Green -TextColor Aquamarine -TextAlign center -Type RowSelectedOdd
    New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Yellow -TextColor Aquamarine -TextAlign center -Type RowHover
    New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Red -TextColor Aquamarine -TextAlign center -Type RowHoverSelected
    New-HTMLTableStyle -Type Header -BorderLeftStyle dashed -BorderLeftColor Red -BorderLeftWidthSize 1px
    New-HTMLTableStyle -Type Footer -BorderLeftStyle dotted -BorderLeftColor Red -BorderleftWidthSize 1px
    New-HTMLTableStyle -Type Footer -BorderTopStyle none -BorderTopColor Red -BorderTopWidthSize 5px -BorderBottomColor Yellow -BorderBottomStyle solid
    New-HTMLTableStyle -Type Footer -BorderTopStyle none -BorderTopColor Red -BorderTopWidthSize 5px -BorderBottomColor Yellow -BorderBottomStyle solid
    New-HTMLTableStyle -Type Footer -BorderTopStyle none -BorderTopColor Red -BorderTopWidthSize 5px -BorderBottomColor Yellow -BorderBottomStyle none

    New-HTML -ShowHTML -HtmlData {
        New-HTMLTable -DataTable $table -HideButtons {

        } -DisablePaging
    } -FilePath $PSScriptRoot\Example7_TableStyle.html -Online

    .NOTES
    General notes
    #>
    [alias('EmailTableStyle', 'TableStyle', 'New-TableStyle')]
    [cmdletBinding(DefaultParameterSetName = 'Manual')]
    param(
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('Content', 'Table', 'Header', 'Row', 'Footer', 'RowOdd', 'RowEven', 'RowSelected', 'RowSelectedEven', 'RowSelectedOdd', 'RowHover', 'RowHoverSelected', 'Button')][string] $Type = 'Table',
        [Parameter(ParameterSetName = 'Manual')][alias('TextSize')][string] $FontSize,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('normal', 'italic', 'oblique')][string] $FontStyle,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('normal', 'small-caps')][string] $FontVariant,
        [Parameter(ParameterSetName = 'Manual')][string] $FontFamily,
        [Parameter(ParameterSetName = 'Manual')][string] $BackgroundColor,
        [Parameter(ParameterSetName = 'Manual')][string] $TextColor,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('none', 'line-through', 'overline', 'underline')][string] $TextDecoration,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransform,
        [Parameter(ParameterSetName = 'Manual')][alias('FontAlign', 'Align')][ValidateSet('left', 'right', 'center', 'justify')][string] $TextAlign,

        [Parameter(ParameterSetName = 'Manual')][ValidateSet('none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset')] $BorderTopStyle,
        [Parameter(ParameterSetName = 'Manual')][string] $BorderTopColor,
        [Parameter(ParameterSetName = 'Manual')][string] $BorderTopWidthSize,

        [Parameter(ParameterSetName = 'Manual')][ValidateSet('none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset')] $BorderBottomStyle,
        [Parameter(ParameterSetName = 'Manual')][string] $BorderBottomColor,
        [Parameter(ParameterSetName = 'Manual')][string] $BorderBottomWidthSize,

        [Parameter(ParameterSetName = 'Manual')][ValidateSet('none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset')] $BorderLeftStyle,
        [Parameter(ParameterSetName = 'Manual')][string] $BorderLeftColor,
        [Parameter(ParameterSetName = 'Manual')][string] $BorderLeftWidthSize,

        [Parameter(ParameterSetName = 'Manual')][ValidateSet('none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset')] $BorderRightStyle,
        [Parameter(ParameterSetName = 'Manual')][string] $BorderRightColor,
        [Parameter(ParameterSetName = 'Manual')][string] $BorderRightWidthSize
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
        'text-align'          = $TextAlign
        'text-transform'      = $TextTransform
        'color'               = ConvertFrom-Color -Color $TextColor
        'background-color'    = ConvertFrom-Color -Color $BackgroundColor
        'font-size'           = ConvertFrom-Size -TextSize $FontSize
        'font-weight'         = $FontWeight
        'font-style'          = $FontStyle
        'font-variant'        = $FontVariant
        'font-family'         = $FontFamily
        'text-decoration'     = $TextDecoration

        'border-top-width'    = ConvertFrom-Size -TextSize $BorderTopWidth
        'border-top-style'    = $BorderTopStyle
        'border-top-color'    = ConvertFrom-Color -Color $BorderTopColor

        'border-bottom-width' = ConvertFrom-Size -TextSize $BorderBottomWidth
        'border-bottom-style' = $BorderBottomStyle
        'border-bottom-color' = "$(ConvertFrom-Color -Color $BorderBottomColor) !important"

        'border-left-width'   = ConvertFrom-Size -TextSize $BorderLeftWidth
        'border-left-style'   = $BorderLeftStyle
        'border-left-color'   = ConvertFrom-Color -Color $BorderLeftColor

        'border-right-width'  = ConvertFrom-Size -TextSize $BorderRightWidth
        'border-right-style'  = $BorderRightStyle
        'border-right-color'  = ConvertFrom-Color -Color $BorderRightColor
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
        Add-ConfigurationCSS -CSS $CssConfiguration -Name 'table.dataTable thead th, table.dataTable thead td' -Inject $TableStyle
    }
    if ($Type -in 'Footer', 'Table') {
        Add-ConfigurationCSS -CSS $CssConfiguration -Name 'table.dataTable tfoot th, table.dataTable tfoot td' -Inject $TableStyle
    }
    if ($Type -in 'RowOdd', 'Row', 'Table', 'Content') {
        foreach ($Name in $RowOdd) {
            Add-ConfigurationCSS -CSS $CssConfiguration -Name $Name -Inject $TableStyle
        }
    }
    if ($Type -in 'RowEven', 'Row', 'Table', 'Content') {
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

Register-ArgumentCompleter -CommandName New-HTMLTableStyle -ParameterName BorderBottomColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTableStyle -ParameterName BorderTopColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTableStyle -ParameterName BorderRightColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTableStyle -ParameterName BorderLeftColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTableStyle -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTableStyle -ParameterName TextColor -ScriptBlock $Script:ScriptBlockColors