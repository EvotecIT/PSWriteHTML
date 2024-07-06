function New-TableRowGrouping {
    <#
    .SYNOPSIS
    Creates a new table row grouping object with specified attributes.

    .DESCRIPTION
    This function creates a new table row grouping object with the provided attributes. It enables the feature for DataTablesRowGrouping in the HTML schema.

    .PARAMETER Name
    Specifies the name of the row grouping.

    .PARAMETER ColumnID
    Specifies the ID of the column to group rows by. Default value is -1.

    .PARAMETER SortOrder
    Specifies the sort order for the grouped rows. Valid values are 'Ascending' or 'Descending'. Default is 'Ascending'.

    .PARAMETER Color
    Specifies the color for the row grouping.

    .PARAMETER BackgroundColor
    Specifies the background color for the row grouping.

    .EXAMPLE
    New-TableRowGrouping -Name "Group A" -ColumnID 1 -SortOrder 'Ascending' -Color 'Red' -BackgroundColor 'LightGray'
    Creates a new table row grouping object for Group A, grouping by column ID 1 in ascending order with red text and light gray background.

    .EXAMPLE
    New-TableRowGrouping -Name "Group B" -ColumnID 2 -SortOrder 'Descending' -Color 'Blue' -BackgroundColor 'White'
    Creates a new table row grouping object for Group B, grouping by column ID 2 in descending order with blue text and white background.
    #>
    [alias('TableRowGrouping', 'EmailTableRowGrouping', 'New-HTMLTableRowGrouping')]
    [CmdletBinding()]
    param(
        [alias('ColumnName')][string] $Name,
        [int] $ColumnID = -1,
        [ValidateSet('Ascending', 'Descending')][string] $SortOrder = 'Ascending',
        [string] $Color,
        [string] $BackgroundColor
    )
    $Script:HTMLSchema.Features.DataTablesRowGrouping = $true

    $Object = [PSCustomObject] @{
        Type   = 'TableRowGrouping'
        Output = [ordered] @{
            Name       = $Name
            ColumnID   = $ColumnID
            Sorting    = if ('Ascending') { 'asc' } else { 'desc' }
            Attributes = @{
                'color'            = ConvertFrom-Color -Color $Color
                'background-color' = ConvertFrom-Color -Color $BackgroundColor
            }
        }
    }
    Remove-EmptyValue -Hashtable $Object.Output
    $Object
}

Register-ArgumentCompleter -CommandName New-TableRowGrouping -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TableRowGrouping -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors