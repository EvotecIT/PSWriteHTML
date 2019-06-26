function Add-TableMergedHeader {
    [CmdletBinding()]
    param(
        [System.Collections.Generic.List[PSCustomObject]] $HeaderRows,
        [string[]] $HeaderNames
    )
    if ($HeaderRows.Count -eq 0) {
        return
    }
    [Array] $MergeColumns = foreach ($Row in $HeaderRows) {
        $Index = foreach ($R in $Row.Names) {
            [array]::indexof($HeaderNames.ToUpper(), $R.ToUpper())
        }
        if ($Index -contains -1) {
            Write-Warning -Message "Table Header can't be processed properly. Names on the list to merge were not found in Table Header."
        } else {
            @{
                Index = $Index
                Title = $Row.Title
                Count = $Index.Count
                Used  = $false
            }
        }
    }
    $AddedHeader = @(
        $NewHeader = [System.Collections.Generic.List[string]]::new()
        New-HTMLTag -Tag 'tr' {
            for ($i = 0; $i -lt $HeaderNames.Count; $i++) {
                $Found = $false
                foreach ($_ in $MergeColumns) {
                    if ($_.Index -contains $i) {
                        if ($_.Used -eq $false) {
                            New-HTMLTag -Tag 'th' -Attributes @{ colspan = $_.Count; style = $_.Style } -Value { $_.Title }
                            $_.Used = $true
                            $Found = $true
                        } else {
                            $Found = $true
                            # Do Nothing
                        }
                    }
                }
                if (-not $Found) {
                    New-HTMLTag -Tag 'th' { $HeaderNames[$i] } -Attributes @{ rowspan = 2 }
                } else {
                    $Head = New-HTMLTag -Tag 'th' { $HeaderNames[$i] }
                    $NewHeader.Add($Head)
                }
            }
        }
        New-HTMLTag -Tag 'tr' {
            $NewHeader
        }
    )
    return $AddedHeader
}