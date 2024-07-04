function Set-Tag {
    <#
    .SYNOPSIS
    Sets HTML tags and attributes based on the provided HtmlObject.

    .DESCRIPTION
    This function generates HTML tags and attributes based on the provided HtmlObject. It constructs the HTML structure with the specified tag, attributes, and values.

    .PARAMETER HtmlObject
    Specifies the HtmlObject containing tag, attributes, and values to be set.

    .PARAMETER NewLine
    Specifies whether new lines are needed in the generated HTML code, useful for languages like JavaScript.

    .EXAMPLE
    $HtmlObject = @{
        Tag = 'div'
        Attributes = @{
            'class' = 'container'
            'style' = @{
                'color' = 'blue'
                'font-size' = '16px'
            }
        }
        Value = 'Hello, World!'
    }

    Set-Tag -HtmlObject $HtmlObject
    Generates the HTML tag <div class="container" style="color:blue;font-size:16px">Hello, World!</div>.

    .EXAMPLE
    $HtmlObject = @{
        Tag = 'ul'
        Attributes = @{
            'id' = 'list'
        }
        Value = @(
            @{
                Tag = 'li'
                Value = 'Item 1'
            }
            @{
                Tag = 'li'
                Value = 'Item 2'
            }
        )
    }

    Set-Tag -HtmlObject $HtmlObject -NewLine
    Generates the HTML structure:
    <ul id="list">
        <li>Item 1</li>
        <li>Item 2</li>
    </ul>
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $HtmlObject,
        [switch] $NewLine # This is needed if code requires new lines such as JavaScript
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

        if ($HtmlObject.Value.Count -eq 1) {
            if ($HtmlObject.Value -is [System.Collections.IDictionary]) {
                [string] $NewObject = Set-Tag -HtmlObject ($HtmlObject.Value)
                [void] $HTML.Append($NewObject)
            } else {
                [void] $HTML.Append([string] $HtmlObject.Value)
            }
        } else {
            foreach ($Entry in $HtmlObject.Value) {
                if ($Entry -is [System.Collections.IDictionary]) {
                    [string] $NewObject = Set-Tag -HtmlObject ($Entry)
                    [void] $HTML.Append($NewObject)
                } else {
                    # This is needed if code requires new lines such as JavaScript
                    if ($NewLine) {
                        [void] $HTML.AppendLine([string] $Entry)
                    } else {
                        [void] $HTML.Append([string] $Entry)
                    }
                }
            }
        }
        [void] $HTML.Append("</$($HtmlObject.Tag)>")
    } else {
        if ($HtmlObject.SelfClosing) {
            [void] $HTML.Append("/>")
        } elseif ($HtmlObject.NoClosing) {
            [void] $HTML.Append(">")
        } else {
            [void] $HTML.Append("></$($HtmlObject.Tag)>")
        }
    }
    $HTML.ToString()
}