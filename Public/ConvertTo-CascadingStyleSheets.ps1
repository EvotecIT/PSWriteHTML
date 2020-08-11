function ConvertTo-CascadingStyleSheets {
    [cmdletBinding()]
    param(
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)][System.Collections.IDictionary] $Css,
        [switch] $WithTags
    )
    Process {
        if ($Css) {
            Remove-EmptyValue -Hashtable $Css -Recursive
        }
        if ($Css.Count -eq 0) {
            # Means empty value after we removed all empty values
            return
        }

        $Output = foreach ($Key in $Css.Keys) {
            if ($Key.StartsWith('.') -or $Key.StartsWith('[') -or $Key.StartsWith('#')) {
                # This means it's already decided
                $Name = $Key
            } else {
                $Name = ".$Key"
            }
            "$Name {"
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
        if ($WithTags) {
            New-HTMLTag -Tag 'style' {
                $Output
            }
        } else {
            $Output
        }
    }
}