function New-TablePluginCondition {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][pscustomobject] $Condition
    )

    # Map PSWriteHTML condition to plugin condition schema
    $plugin = [ordered]@{
        columnName       = $Condition.Name
        operator         = ($Condition.Operator | ForEach-Object { $_.ToLower() })
        type             = ($Condition.Type | ForEach-Object { $_.ToLower() })
        value            = $Condition.Value
        caseSensitive    = $Condition.CaseSensitive
        dateTimeFormat   = $Condition.DateTimeFormat
        reverseCondition = $Condition.ReverseCondition
    }

    if ($plugin.type -eq 'date' -and $null -ne $Condition.Value) {
        if ($Condition.Value -is [datetime]) {
            [void]$plugin.Remove('value')
            $plugin['valueDate'] = [ordered]@{
                year    = $Condition.Value.Year
                month   = $Condition.Value.Month
                day     = $Condition.Value.Day
                hours   = $Condition.Value.Hour
                minutes = $Condition.Value.Minute
                seconds = $Condition.Value.Second
            }
        } elseif ($Condition.Value -is [System.Collections.IEnumerable]) {
            [array] $dates = @(
                foreach ($dv in $Condition.Value) {
                    if ($dv -is [datetime]) {
                        [ordered]@{
                            year    = $dv.Year
                            month   = $dv.Month
                            day     = $dv.Day
                            hours   = $dv.Hour
                            minutes = $dv.Minute
                            seconds = $dv.Second
                        }
                    }
                }
            )
            if ($dates.Count -gt 0) {
                [void]$plugin.Remove('value')
                $plugin['valueDate'] = $dates
            }
        }
    }

    [pscustomobject]$plugin
}
