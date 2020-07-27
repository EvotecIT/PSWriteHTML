function New-TableColumnOption {
    <#
    .SYNOPSIS
        Allows for certain modification of options within DataTable's columnDefs parameter. You can set visibility, searchability, sortability, and width for specific columns
    .DESCRIPTION
        Allows for certain modification of options within DataTable's columnDefs parameter.
        See: https://datatables.net/reference/option/columnDefs

        New-HTMLTable has parameters for -ResponsivePriorityOrder and -ResponsivePriorityOrderIndex and these are set at a higher precedent than options specified here.
        See the DataTable reference section for conflict resolution.

        The New-TableColumnOption cmdlet will add entries to the columnDefs parameter in the order in which the cmdlets are ordered.
        If you use 2 or more New-TableColumnOption, the first cmdlet takes priority over the second cmdlet if they specify the same targets or overriding property values
        With this in mind, you should almost always specify -AllColumns last, since that will take priority over any commands issued later

    .EXAMPLE
        New-TableColumnOption -ColumnIndex (0..4) -Width 50
        The first 5 columns with have a width defined as 50, this may not be exact.
        See: https://datatables.net/reference/option/columns.width
    .EXAMPLE
        New-TableColumnOption -ColumnIndex 0,1,2 -Hidden $false
        New-TableColumnOption -ColumnIndex 1 -Sortable $true
        New-TableColumnOption -AllColumns -Hidden $true -Searchable $false -Sortable $false
        All columns will be hidden, not searchable, and not sortable
        However, since there is a option specified higher up, the first 3 columns will be visible
        Additionally the 2nd column will be sortable
    .INPUTS
        None. You cannot pipe objects to New-TableColumnOption
    .OUTPUTS
        PSCustomObject
    .NOTES
        The New-HTMLTable cmdlet has -ResponsivePriorityOrder and -ResponsivePriorityOrderIndex that also modifes the columnDefs option in DataTable
    #>
    [CmdletBinding(DefaultParameterSetName = 'ColumnIndex', SupportsShouldProcess = $false, PositionalBinding = $false, HelpUri = '', ConfirmImpact = 'Medium')]
    [Alias('EmailTableColumnOption', 'TableColumnOption', 'New-HTMLTableColumnOption')]
    [OutputType([PSCustomObject])]
    param(
        # Identifies specific columns that the properties should apply to
        [Parameter(ParameterSetName = "ColumnIndex", Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [alias('Targets')]
        [int[]]
        $ColumnIndex,

        # Uses the columnDef Target "_ALL" to indicate all columns / remaining columns
        [Parameter(ParameterSetName = "AllColumns", Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [alias('AllTargets', 'TargetAll')]
        [switch]
        $AllColumns,

        # Width for the column as a string
        [Parameter(ParameterSetName = "ColumnIndex")]
        [Parameter(ParameterSetName = "AllColumns")]
        [string]
        $Width,

        # Defines if a column is hidden. A hidden column can still be used by Conditional Formatting and can still be searchable
        [Parameter(ParameterSetName = "ColumnIndex")]
        [Parameter(ParameterSetName = "AllColumns")]
        [boolean]$Hidden,

        # Defines if a column is able to be searched
        [Parameter(ParameterSetName = "ColumnIndex")]
        [Parameter(ParameterSetName = "AllColumns")]
        [boolean]$Searchable,

        # Defines if a column can be sorted
        [Parameter(ParameterSetName = "ColumnIndex")]
        [Parameter(ParameterSetName = "AllColumns")]
        [boolean]$Sortable
    )

    # Create a hashtable property
    $TableColumnOptionProperty = @{
        targets = if ($AllColumns) { "_all" } else { $ColumnIndex };
    }

    # Check for the existence of parameters, if they are not null then we will set them in the properties
    # IF they are null, we don't want to include any values by default
    If ($null -ne $PSBoundParameters['Width']) { $TableColumnOptionProperty.width = $Width }
    If ($null -ne $PSBoundParameters['Hidden']) { $TableColumnOptionProperty.visible = !$Hidden }
    If ($null -ne $PSBoundParameters['Searchable']) { $TableColumnOptionProperty.searchable = $Searchable }
    If ($null -ne $PSBoundParameters['Sortable']) { $TableColumnOptionProperty.orderable = $Sortable }


    # Check that we just don't have the 'targets' set, if so, then we have properties and return a custom object
    If ($TableColumnOptionProperty.Keys.Count -gt 1) {
        [PSCustomObject] @{
            Type   = 'TableColumnOption'
            Output = [PSCustomObject]$TableColumnOptionProperty
        }
    } Else {
        Write-Warning "New-TableColumnOption did not have any additional arguments listed"
    }

}
