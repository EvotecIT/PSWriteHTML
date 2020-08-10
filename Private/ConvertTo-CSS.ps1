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
            ".$ClassName {"
        }
        foreach ($_ in $Attributes.Keys) {
            if ($null -ne $Attributes[$_]) {
                "$($_): $($Attributes[$_]);"
            }
        }
        '}'
        if ($Group) {
            '</style>'
        }
    ) -join "`n"
    $CSS
}