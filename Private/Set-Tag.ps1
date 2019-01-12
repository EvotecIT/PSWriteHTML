function Set-Tag {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $HtmlObject
    )
    $HTML = New-GenericList -Type [string]
    $HTML.Add("<$($HtmlObject.Tag)")
    foreach ($Property in $HtmlObject.Attributes.Keys) {
        $PropertyValue = $HtmlObject.Attributes[$Property]
        # skip adding properties that are empty
        if ($PropertyValue -ne '') {
            $HTML.Add("$Property = `"$PropertyValue`"")
        }
    }
    if (($null -ne $HtmlObject.Value) -and ($HtmlObject.Value -ne '')) {
        $HTML.Add(">")
        if ($HtmlObject.Value -is [System.Collections.IDictionary]) {
            [string] $NewObject = Set-Tag -HtmlObject ($HtmlObject.Value)
            $HTML.Add($NewObject)
        } else {
            $HTML.Add($HtmlObject.Value)
        }
        $HTML.Add("</$($HtmlObject.Tag)>")
    } else {
        $HTML.Add("/>")
    }
    $HTML
}