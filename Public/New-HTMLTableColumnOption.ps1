function New-TableColumnOption {
    [alias('EmailTableColumnOption', 'TableColumnOption', 'New-HTMLTableColumnOption')]
    [CmdletBinding()]
    param(
        [alias('Targets')][int[]]$ColumnIndex,
        [alias('TargetAll')][switch]$AllColumns,
        [string]$Width,
        [switch]$Visible,
        [switch]$Hidden,
        [switch]$EnableOrdering,
        [switch]$DisableOrdering,
        [switch]$DisableSearch,
        [switch]$EnableSearch
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

    If ($Width) { $TableColumnOptionProperty['width'] = $Width }

    If ($Visible) { $TableColumnOptionProperty['visible'] = $true }
    if ($Hidden) { 
        If ($Visible) { Write-Warning 'New-HTMLTableColumnOption - Hidden overrides Visible' }
        $TableColumnOptionProperty['visible'] = $false
    }

    If ($EnableOrdering) { $TableColumnOptionProperty['orderable'] = $true }
    if ($DisableOrdering) { 
        If ($EnableOrdering) { 
            Write-Warning 'New-HTMLTableColumnOption - Disabling ordering orverrides enabling ordering.'
        }
        $TableColumnOptionProperty['orderable'] = $false
    }
    if ($EnableSearch) { $TableColumnOptionProperty['searchable'] = $true }
    if ($DisableSearch) { 
        If ($EnableSearch) { 
            Write-Warning 'New-HTMLTableColumnOption - Disabling search overrides enabling search'
        }
        $TableColumnOptionProperty['searchable'] = $false
    }
    
    # Check if we have properties set
    If ($TableColumnOptionProperty.Keys.Count -gt 1) { 
        $TableColumnOption = [PSCustomObject]$TableColumnOptionProperty
    }

    [PSCustomObject] @{
        Type   = 'TableColumnOption'
        Output = $TableColumnOption
    }
}
