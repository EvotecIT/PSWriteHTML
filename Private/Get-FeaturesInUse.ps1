function Get-FeaturesInUse {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER PriorityFeatures
    Define priority features - important for ordering when CSS or JS has to be processed in certain order

    .EXAMPLE
    Get-FeaturesInUse -PriorityFeatures 'Jquery', 'DataTables', 'Tabs', 'Test'

    .NOTES
    General notes
    #>

    [CmdletBinding()]
    param(
        [string[]] $PriorityFeatures
    )
    [Array] $Features = foreach ($Key in $Script:HTMLSchema.Features.Keys) {
        if ($Script:HTMLSchema.Features[$Key]) {
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