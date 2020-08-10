function ConvertTo-CascadingStyleSheets {
    [cmdletBinding()]
    param(
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)][System.Collections.IDictionary] $Css
    )
    Process {
        if ($Css) {
            Remove-EmptyValue -Hashtable $Css -Recursive
        }
        if ($Css.Count -eq 0) {
            # Means empty value after we removed all empty values
            return
        }
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
}