function ConvertTo-LimitedCSS {
    <#
    .SYNOPSIS
    Converts a dictionary of CSS attributes into a limited CSS string.

    .DESCRIPTION
    This function takes a dictionary of CSS attributes and converts them into a limited CSS string. It supports adding an ID, class name, and grouping the CSS attributes.

    .PARAMETER ID
    The ID to be used in the CSS selector.

    .PARAMETER ClassName
    The class name to be used in the CSS selector.

    .PARAMETER Attributes
    A dictionary containing the CSS attributes to be converted.

    .PARAMETER Group
    Switch parameter to indicate if the CSS should be grouped within <style> tags.

    .EXAMPLE
    ConvertTo-LimitedCSS -ID "myID" -ClassName "myClass" -Attributes @{ "color" = "red"; "font-size" = "12px" } -Group
    Generates the following CSS:
    #myID .myClass {
        color: red;
        font-size: 12px;
    }

    #>
    [CmdletBinding()]
    param(
        [string] $ID,
        [string] $ClassName,
        [System.Collections.IDictionary] $Attributes,
        [switch] $Group
    )
    if ($Attributes) {
        Remove-EmptyValue -Hashtable $Attributes
    }
    if ($Attributes.Count -eq 0) {
        # Means empty value after we removed all empty values
        return
    }
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