function Set-Tag {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $HtmlObject
    )
    $HTML = [System.Text.StringBuilder]::new()
    [void] $HTML.Append("<$($HtmlObject.Tag)")
    foreach ($Property in $HtmlObject.Attributes.Keys) {
        $PropertyValue = $HtmlObject.Attributes[$Property]
        # skip adding properties that are empty
        if ($PropertyValue -ne '') {
            [void] $HTML.Append(" $Property=`"$PropertyValue`"")
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