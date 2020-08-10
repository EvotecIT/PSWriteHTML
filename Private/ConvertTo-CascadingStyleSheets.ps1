function ConvertTo-CascadingStyleSheets {
    [cmdletBinding()]
    param(
        [System.Collections.IDictionary] $Css
    )

    foreach ($Key in $Css.Keys) {
        "$Key {"
        foreach ($_ in $Css[$Key].Keys) {
            if ($null -ne $Css[$Key][$_]) {
                # we remove empty chars because sometimes there cab be multiple lines similar to each other
                $Property = $_.Replace(' ', '')
                "    $Property`: $($Css[$Key][$_]);"
            }
        }
        "}"
        ''
    }
}