function Get-FeaturesInUse {
    <#
    .SYNOPSIS
    Defines which features will be used within HTML and in which order

    .DESCRIPTION
    Defines which features will be used within HTML and in which order

    .PARAMETER PriorityFeatures
    Define priority features - important for ordering when CSS or JS has to be processed in certain order

    .EXAMPLE
    Get-FeaturesInUse -PriorityFeatures 'Jquery', 'DataTables', 'Tabs', 'Test'

    .EXAMPLE
    Get-FeaturesInUse -PriorityFeatures 'Jquery', 'DataTables', 'Tabs', 'Test' -Email

    .NOTES
    General notes
    #>

    [CmdletBinding()]
    param(
        [string[]] $PriorityFeatures,
        [switch] $Email
    )
    [Array] $Features = @(
        $Script:HTMLSchema.Features.Keys
        $Script:GlobalSchema.Features.Keys
    )
    # This checks whether the features are for email or for normal HTML and allows or dissalows further processing
    [Array] $Features = foreach ($Key in $Features | Sort-Object -Unique) {
        if ($Script:CurrentConfiguration['Features'][$Key]) {
            if ($Email) {
                if ($Script:CurrentConfiguration['Features'][$Key]['Email'] -ne $true) {
                    continue
                }
            } else {
                if ($Script:CurrentConfiguration['Features'][$Key]['Default'] -ne $true) {
                    continue
                }
            }
            $Key
        }
    }
    [Array] $TopFeatures = foreach ($Feature in $PriorityFeatures) {
        if ($Features -contains $Feature) {
            $Feature
        }
    }
    [Array] $RemainingFeatures = foreach ($Feature in $Features) {
        if ($TopFeatures -notcontains $Feature) {
            $Feature
        }
    }
    [Array] $AllFeatures = $TopFeatures + $RemainingFeatures
    $AllFeatures
}