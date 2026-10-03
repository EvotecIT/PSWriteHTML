function Get-TableInlineStyles {
    <#
    .SYNOPSIS
    Evaluates inline conditions against complete source rows and styles visible cells.
    #>
    [CmdletBinding()]
    param(
        [Array] $Table,
        [string[]] $HeaderNames,
        [Array] $SourceRows,
        [System.Collections.Generic.List[PSCustomObject]] $Conditions
    )
    if ($Conditions.Count -eq 0) { return }
    $HeaderNames = @($HeaderNames | ForEach-Object { [Net.WebUtility]::HtmlDecode($_) })
    for ($RowIndex = 1; $RowIndex -lt $Table.Count; $RowIndex++) {
        $ConditionHeaders = $HeaderNames
        [Array] $Values = ($Table[$RowIndex] -replace '</td></tr>' -replace '<tr><td>' -split '</td><td>') | ForEach-Object { [System.Net.WebUtility]::HtmlDecode($_) }
        if ($SourceRows -and $SourceRows.Count -ge $RowIndex -and $SourceRows[$RowIndex - 1] -isnot [string] -and $SourceRows[$RowIndex - 1] -isnot [ValueType]) {
            $Source = $SourceRows[$RowIndex - 1]
            $ConditionHeaders = @($Source.PSObject.Properties.Name)
            $RenderedValues = $Values
            $Values = @(foreach ($Name in $ConditionHeaders) {
                $VisibleIndex = [array]::IndexOf($HeaderNames.ToUpper(), $Name.ToUpper())
                if ($VisibleIndex -ge 0 -and $Source.$Name -isnot [DateTime]) { , $RenderedValues[$VisibleIndex] } else { , $Source.$Name }
            })
        }
        foreach ($Condition in $Conditions) {
            $Rules = if ($Condition.ConditionType -eq 'Condition') { @($Condition) } else { @($Condition.Conditions.Output) }
            $Matches = @(foreach ($Rule in $Rules) {
                $Index = [array]::IndexOf($ConditionHeaders.ToUpper(), $Rule.Name.ToUpper())
                if ($Index -ge 0) {
                    New-TableConditionalFormattingInline -RowData $Values -ColumnCount $Index -ConditionalFormatting $Rule
                } else {
                    $false
                }
            })
            $Pass = if ($Condition.ConditionType -eq 'Condition') {
                $Matches[0]
            } elseif ($Condition.Logic -eq 'OR') {
                $Matches -contains $true
            } elseif ($Condition.Logic -eq 'NONE') {
                $Matches.Count -gt 0 -and $Matches -notcontains $true
            } else {
                $Matches.Count -gt 0 -and $Matches -notcontains $false
            }
            $Style = if ($Pass) { $Condition.Style } else { $Condition.FailStyle }
            if (-not $Style -or $Style.Count -eq 0) { continue }
            $Targets = if ($Condition.Row) {
                0..($HeaderNames.Count - 1)
            } elseif ($Condition.HighlightHeaders) {
                foreach ($Name in $Condition.HighlightHeaders) { [array]::IndexOf($HeaderNames.ToUpper(), $Name.ToUpper()) }
            } else {
                [array]::IndexOf($HeaderNames.ToUpper(), $Condition.Name.ToUpper())
            }
            foreach ($Target in $Targets) {
                if ($Target -ge 0) {
                    [PSCustomObject]@{ RowIndex = $RowIndex; ColumnIndex = $Target + 1; Style = $Style }
                }
            }
        }
    }
}
