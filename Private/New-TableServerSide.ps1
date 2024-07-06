function New-TableServerSide {
    <#
    .SYNOPSIS
    Creates a new server-side table with customizable options.

    .DESCRIPTION
    This function generates a new server-side table with the specified data, table ID, header names, and options. It allows customization of the data source, data storage, and column definitions.

    .PARAMETER DataTable
    Specifies the data to be displayed in the table.

    .PARAMETER DataTableID
    Specifies the unique identifier for the table data.

    .PARAMETER HeaderNames
    Specifies an array of header names for the table columns.

    .PARAMETER Options
    Specifies a dictionary of options for configuring the server-side table.

    .EXAMPLE
    New-TableServerSide -DataTable @($Row1, $Row2, $Row3) -DataTableID "Table1" -HeaderNames @('Name', 'Age', 'Location') -Options @{ 'paging' = $true; 'searching' = $true }
    Creates a new server-side table with data rows, unique ID 'Table1', headers 'Name', 'Age', 'Location', paging enabled, and searching enabled.

    #>
    [cmdletBinding()]
    param(
        [Array] $DataTable,
        [string] $DataTableID,
        [string[]] $HeaderNames,
        [System.Collections.IDictionary] $Options
    )
    if ($Script:HTMLSchema['TableOptions']['Type'] -eq 'structured') {
        $DataPath = [io.path]::Combine($Script:HTMLSchema['TableOptions']['Folder'], 'data')
        $FilePath = [io.path]::Combine($DataPath, "$DataTableID.json")
        $null = New-Item -Path $DataPath -ItemType Directory -Force
        $Data = @{
            data = $DataTable
        }

        $Data | ConvertTo-JsonLiteral -Depth 1 `
            -NumberAsString:$Script:HTMLSchema['TableOptions']['DataStoreOptions'].NumberAsString `
            -BoolAsString:$Script:HTMLSchema['TableOptions']['DataStoreOptions'].BoolAsString `
            -DateTimeFormat $Script:HTMLSchema['TableOptions']['DataStoreOptions'].DateTimeFormat | Out-File -FilePath $FilePath
        $Options['ajax'] = -join ('data', '\', "$DataTableID.json")
    } else {
        # there is possibility for array without column names, not sure if it's worth the time
    }
    [Array] $Options['columns'] = foreach ($Property in $HeaderNames) {
        #@{ data = $Property }
        @{ data = $Property.Replace('.', '\.') }
    }
    $Options['deferRender'] = $true
}