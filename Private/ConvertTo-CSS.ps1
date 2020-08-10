function ConvertTo-CSS {
    [CmdletBinding()]
    param(
        [string] $ID,
        [string] $ClassName,
        [System.Collections.IDictionary] $Attributes,
        [switch] $Group
    )
    [string] $Css = @(
        if ($Group) {
            '<style>'
        }
        if ($ID) {
            "#$ID $ClassName {"
        } else {
            if ($ClassName.StartsWith('.')) {
                "$ClassName {"
            } elseif ($ClassName.StartsWith('[')) {
                "$ClassName {"
            } else {
                ".$ClassName {"
            }
        }
        foreach ($_ in $Attributes.Keys) {
            if ($null -ne $Attributes[$_]) {
                # we remove empty chars because sometimes there cab be multiple lines similar to each other
                $Property = $_.Replace(' ', '')
                "    $Property`: $($Attributes[$_]);"
            }
        }
        '}'
        if ($Group) {
            '</style>'
        }
    ) -join "`n"
    $CSS
}