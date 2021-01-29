function New-TableServerSide {
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