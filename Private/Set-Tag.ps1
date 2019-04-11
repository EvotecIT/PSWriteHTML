function Set-Tag {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $HtmlObject
    )
    $HTML = [System.Text.StringBuilder]::new()
    [void] $HTML.Append("<$($HtmlObject.Tag)")
    foreach ($Property in $HtmlObject.Attributes.Keys) {
        $PropertyValue = $HtmlObject.Attributes[$Property]
        # This checks if property has any subproperties  such as style having multiple options
        if ($PropertyValue -is [System.Collections.IDictionary]) {
            $OutputSubProperties = foreach ($SubAttributes in $PropertyValue.Keys) {
                $SubPropertyValue = $PropertyValue[$SubAttributes]
                # skip adding properties that are empty
                if ($null -ne $SubPropertyValue -and $SubPropertyValue -ne '') {
                    "$($SubAttributes):$($SubPropertyValue)"
                }
            }
            $MyValue = $OutputSubProperties -join ';'
            if ($MyValue.Trim() -ne '') {
                [void] $HTML.Append(" $Property=`"$MyValue`"")
            }
        } else {
            # skip adding properties that are empty
            if ($null -ne $PropertyValue -and $PropertyValue -ne '') {
                [void] $HTML.Append(" $Property=`"$PropertyValue`"")
            }
        }
    }
    if (($null -ne $HtmlObject.Value) -and ($HtmlObject.Value -ne '')) {
        [void] $HTML.Append(">")
        foreach ($Entry in $HtmlObject.Value) {
            if ($Entry -is [System.Collections.IDictionary]) {
                [string] $NewObject = Set-Tag -HtmlObject ($Entry)
                [void] $HTML.Append($NewObject)
            } else {
                [void] $HTML.AppendLine([string] $Entry)
            }

        }
        [void] $HTML.Append("</$($HtmlObject.Tag)>")
    } else {
        if ($HtmlObject.SelfClosing) {
            [void] $HTML.Append("/>")
        } else {
            [void] $HTML.Append("></$($HtmlObject.Tag)>")
        }
    }
    $HTML.ToString()
}