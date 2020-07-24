function New-TableColumnOption {
    [alias('EmailTableColumnOption', 'TableColumnOption', 'New-HTMLTableColumnOption')]
    [CmdletBinding()]
    param(
        [alias('Targets')][int[]]$ColumnIndex,
        [alias('TargetAll')][switch]$AllColumns,
        [switch]$Hidden,
        [string]$Width,
        [switch]$DisableOrdering,
        [switch]$DisableSearch
    )

    If ($PSBoundParameters.ContainsKey('AllColumns') -and $PSBoundParameters.ContainsKey('ColumnIndex')) {
        throw "You cannot specify -AllColumns and -ColumnIndex inside the same TableColumnOption"
    }
    If (!$PSBoundParameters.ContainsKey('AllColumns') -and !$PSBoundParameters.ContainsKey('ColumnIndex')) { 
        throw "You must specify either -AllColumns or -ColumnIndex inside the TableColumnOption"
    }

    $TableColumnOption = $null

    # Create a hashtable property
    $TableColumnOptionProperty = @{
        targets         = if ($AllColumns) { "_all" } else { $ColumnIndex };
    }

    If ($Width) { $TableColumnOptionProperty.Add('width', $Width) }
    if ($Hidden) { $TableColumnOptionProperty.Add('visible', $false) }
    if ($DisableOrdering) { $TableColumnOptionProperty.Add('orderable', $false) }
    if ($DisableSearch) { $TableColumnOptionProperty.Add('searchable', $false)}

    # Check if we have properties set
    If ($TableColumnOptionProperty.Keys.Count -gt 1) { 
        $TableColumnOption = [PSCustomObject]$TableColumnOptionProperty
    }

    [PSCustomObject] @{
        Type   = 'TableColumnOption'
        Output = $TableColumnOption
    }
}
