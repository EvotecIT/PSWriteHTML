function Get-FeaturesInUse {
    [CmdletBinding()]
    param()
    foreach ($Key in $Script:HTMLSchema.Features.Keys) {
        if ($Script:HTMLSchema.Features[$Key]) {
            $Key
        }
    }
}
