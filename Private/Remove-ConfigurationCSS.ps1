function Remove-ConfigurationCSS {
    [cmdletBinding()]
    param(
        [System.Collections.IDictionary] $CSS,
        [string] $Name,
        [string] $Property
    )
    if ($CSS -and $Name -and $Property) {
        if ($Name.StartsWith('.') -or $Name.StartsWith('[') -or $Name.StartsWith('#')) {
            # This means it's already decided
        } else {
            $Name = ".$Name"
        }
        if ($Property) {
            $CSS[$Name].Remove($Property)
        }
    }
}