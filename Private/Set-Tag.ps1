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
            $HTML.Add("$Property=`"$PropertyValue`"")
        }
    }
    if (($null -ne $HtmlObject.Value) -and ($HtmlObject.Value -ne '')) {
        $HTML.Add(">")
        foreach ($Entry in $HtmlObject.Value) {
            if ($Entry -is [System.Collections.IDictionary]) {
                [string] $NewObject = Set-Tag -HtmlObject ($Entry)
                $HTML.Add($NewObject)
            } else {
                $HTML.Add($Entry)
            }

        }
        $HTML.Add("</$($HtmlObject.Tag)>")
    } else {
        if ($HtmlObject.SelfClosing) {
            $HTML.Add("/>")
        } else {
            $HTML.Add("></$($HtmlObject.Tag)>")
        }
    }
    $HTML
}