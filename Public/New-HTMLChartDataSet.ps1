function New-HTMLChartDataSet {
    [CmdletBinding()]
    param(
        [Array] $Data,
        [Array] $DataNames
    )

    if ($null -ne $Data -and $null -ne $DataNames) {
        if ($Data[0] -is [Array]) {
            # If it's array of Arrays
            if ($Data[0].Count -eq $DataNames.Count) {
                for ($a = 0; $a -lt $Data.Count; $a++) {
                    @{
                        name = $DataNames[$a]
                        data = $Data[$a]
                    }
                }
            } elseif ($Data.Count -eq $DataNames.Count) {
                for ($a = 0; $a -lt $Data.Count; $a++) {
                    @{
                        name = $DataNames[$a]
                        data = $Data[$a]
                    }
                }
            } else {
                # rerun with just data (so it checks another if)
                New-HTMLChartDataSet -Data $Data
            }

        } else {
            if ($null -ne $DataNames) {
                # If it's just int in Array
                @{
                    name = $DataNames
                    data = $Data
                }
            } else {
                @{
                    data = $Data
                }
            }
        }

    } elseif ($null -ne $Data) {
        # No names given
        if ($Data[0] -is [Array]) {
            # If it's array of Arrays
            foreach ($D in $Data) {
                @{
                    data = $D
                }
            }
        } else {
            # If it's just int in Array
            @{
                data = $Data
            }
        }
    } else {
        Write-Warning -Message "New-HTMLChartDataSet - No Data provided. Unabled to create dataset."
        return @{}
    }
}