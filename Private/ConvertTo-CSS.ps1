function ConvertTo-CSS {
    [CmdletBinding()]
    param(
        [string] $ClassName,
        [System.Collections.IDictionary] $Attributes
    )
    $Css = @(
        ".$ClassName {"
        foreach ($_ in $Attributes.Keys) {
            if ($null -ne $Attributes[$_]) {
                "$($_): $($Attributes[$_]);"
            }
        }
        '}'
    ) -join "`n"
    $CSS
}