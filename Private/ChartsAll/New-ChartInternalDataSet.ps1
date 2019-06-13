function New-ChartInternalDataSet {
    [CmdletBinding()]
    param(
        [Array] $Data,
        [Array] $DataNames
    )

    if ($null -ne $Data -and $null -ne $DataNames) {
        if ($Data[0] -is [System.Collections.ICollection]) {
            # If it's array of Arrays
            if ($Data[0].Count -eq $DataNames.Count) {
                for ($a = 0; $a -lt $Data.Count; $a++) {
                    [ordered] @{
                        name = $DataNames[$a]
                        data = $Data[$a]
                    }
                }
            } elseif ($Data.Count -eq $DataNames.Count) {
                for ($a = 0; $a -lt $Data.Count; $a++) {
                    [ordered] @{
                        name = $DataNames[$a]
                        data = $Data[$a]
                    }
                }
            } else {
                # rerun with just data (so it checks another if)
                New-ChartInternalDataSet -Data $Data
            }

        } else {
            if ($null -ne $DataNames) {
                # If it's just int in Array
                [ordered] @{
                    name = $DataNames
                    data = $Data
                }
            } else {
                [ordered]  @{
                    data = $Data
                }
            }
        }

    } elseif ($null -ne $Data) {
        # No names given
        if ($Data[0] -is [System.Collections.ICollection]) {
            # If it's array of Arrays
            foreach ($D in $Data) {
                [ordered] @{
                    data = $D
                }
            }
        } else {
            # If it's just int in Array
            [ordered] @{
                data = $Data
            }
        }
    } else {
        Write-Warning -Message "New-ChartInternalDataSet - No Data provided. Unabled to create dataset."
        return [ordered] @{ }
    }
}