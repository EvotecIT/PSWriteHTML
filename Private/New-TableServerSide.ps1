function New-TableServerSide {
    [cmdletBinding()]
    param(
        [Array] $DataTable,
        [string] $DataTableID,
        [string[]] $HeaderNames,
        [System.Collections.IDictionary] $Options
    )
    $DataPath = [io.path]::Combine($Script:HTMLSchema['Hosted']['Folder'], 'data')
    $FilePath = [io.path]::Combine($Script:HTMLSchema['Hosted']['Folder'], 'data', "$DataTableID.json")

    $Data = @{
        data = $DataTable
    }
    if ($Script:HTMLSchema['Hosted']['Type'] -eq 'structured') {
        $Data | ConvertTo-Json -Depth 2 -Compress | Out-File -FilePath $FilePath
    } else {
        # not yet done
    }

    $null = New-Item -Path $DataPath -ItemType Directory -Force
    $Options['ajax'] = -join ('data', '\', "$DataTableID.json")
    $Options['columns'] = foreach ($Property in $HeaderNames) {
        @{ data = $Property }
    }
    $Options['deferRender'] = $true
}