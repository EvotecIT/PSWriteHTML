function New-TableColumnGroup {
    <#
    .SYNOPSIS
    Creates a colgroup for table column widths.
    #>
    [CmdletBinding()]
    param(
        [int] $ColumnCount,
        [hashtable] $Widths
    )

    if ($Widths.Count -eq 0) {
        return
    }
    New-HTMLTag -Tag 'colgroup' {
        for ($Index = 0; $Index -lt $ColumnCount; $Index++) {
            $Style = @{}
            if ($Widths.ContainsKey($Index)) {
                $Style.width = ConvertFrom-Size -Size $Widths[$Index]
            }
            New-HTMLTag -Tag 'col' -Attributes @{ style = $Style }
        }
    }
}

function Get-TableColumnWidths {
    <#
    .SYNOPSIS
    Resolves width options by zero-based column index. The first match wins.
    #>
    [CmdletBinding()]
    param(
        [int] $ColumnCount,
        [System.Collections.Generic.List[PSCustomObject]] $TableColumnOptions
    )
    $Widths = @{}
    foreach ($Option in $TableColumnOptions) {
        if (-not $Option.width) {
            continue
        }

        if ($Option.targets -eq '_all') {
            for ($Index = 0; $Index -lt $ColumnCount; $Index++) {
                if (-not $Widths.ContainsKey($Index)) {
                    $Widths[$Index] = $Option.width
                }
            }
            continue
        }

        foreach ($Target in @($Option.targets)) {
            if ($Target -is [int] -and $Target -ge 0 -and $Target -lt $ColumnCount -and -not $Widths.ContainsKey($Target)) {
                $Widths[$Target] = $Option.width
            }
        }
    }

    $Widths
}
