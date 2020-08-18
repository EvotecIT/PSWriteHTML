function Remove-ConfigurationCSS {
    [cmdletBinding()]
    param(
        [Parameter(ParameterSetName = 'Default')]
        [Parameter(ParameterSetName = 'Section')]
        [System.Collections.IDictionary] $CSS,

        [Parameter(ParameterSetName = 'Default')][string] $Name,

        [Parameter(ParameterSetName = 'Default')][string] $Property,

        [Parameter(ParameterSetName = 'Section')][string[]] $Section,

        [Parameter(ParameterSetName = 'Section')][switch] $Not
    )

    if ($CSS -and $Name -and $Property) {
        # remove single property
        if ($CSS[$Name]) {
            if ($Property) {
                if ($CSS[$Name][$Property]) {
                    $CSS[$Name].Remove($Property)
                }
            }
        }
    }
    if ($Section -and -not $Not) {
        # Remove requested sections
        foreach ($S in $Section) {
            if ($CSS[$S]) {
                $CSS.Remove($S)
            }
        }
    } elseif ($Section) {
        # Remove all sections not defined in requested Sections
        foreach ($S in [string[]] $CSS.Keys) {
            if ($S -notin $Section) {
                $CSS.Remove($S)
            }
        }
    }
}