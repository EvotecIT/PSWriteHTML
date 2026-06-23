function New-TableColumnGroup {
    <#
    .SYNOPSIS
    Creates a colgroup for table column widths.
    #>
    [CmdletBinding()]
    param(
        [string[]] $HeaderNames,
        [System.Collections.Generic.List[PSCustomObject]] $TableColumnOptions
    )

    if (-not $HeaderNames -or $TableColumnOptions.Count -eq 0) {
        return
    }

    $Widths = @{}
    foreach ($Option in $TableColumnOptions) {
        if (-not $Option.width) {
            continue
        }

        if ($Option.targets -eq '_all') {
            for ($Index = 0; $Index -lt $HeaderNames.Count; $Index++) {
                if (-not $Widths.ContainsKey($Index)) {
                    $Widths[$Index] = $Option.width
                }
            }
            continue
        }

        foreach ($Target in @($Option.targets)) {
            if ($Target -is [int] -and $Target -ge 0 -and $Target -lt $HeaderNames.Count -and -not $Widths.ContainsKey($Target)) {
                $Widths[$Target] = $Option.width
            }
        }
    }

    if ($Widths.Count -eq 0) {
        return
    }

    New-HTMLTag -Tag 'colgroup' {
        for ($Index = 0; $Index -lt $HeaderNames.Count; $Index++) {
            $Style = @{}
            if ($Widths.ContainsKey($Index)) {
                $Style.width = ConvertFrom-Size -Size $Widths[$Index]
            }
            New-HTMLTag -Tag 'col' -Attributes @{ style = $Style }
        }
    }
}
