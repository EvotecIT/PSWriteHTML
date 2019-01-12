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
    $HTML.Add(">")
    $HTML.Add($HtmlObject.Value)
    $HTML.Add("</$($HtmlObject.Tag)>")
    return $HTML
}