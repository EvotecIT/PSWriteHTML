function Add-ConfigurationCSS {
    [cmdletBinding()]
    param(
        [System.Collections.IDictionary] $CSS,
        [string] $Name,
        [System.Collections.IDictionary] $Inject,
        [switch] $Overwrite
    )
    # Lets remove dead code
    if ($Inject) {
        Remove-EmptyValue -Hashtable $Inject
        if ($Css) {
            if ($CSS[$Name] -and (-not $Overwrite)) {
                # if exists and is not supposed to be overwritten
                # we just add or overwritte existing parts in $Inject
                foreach ($Key in $Inject.Keys) {
                    $CSS[$Name][$Key] = $Inject[$Key]
                }
            } else {
                $CSS[$Name] = $Inject
            }
        }
    }
}