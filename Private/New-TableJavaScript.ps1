function New-TableJavaScript {
    [cmdletBinding()]
    param(
        [string[]] $HeaderNames,
        [System.Collections.IDictionary] $Options,
        [System.Collections.IDictionary] $NewLineFormat
    )
    $Options['data'] = "markerForDataReplacement"
    [Array] $Options['columns'] = foreach ($Property in $HeaderNames) {
        @{ data = $Property.Replace('.', '\.').Replace([System.Environment]::NewLine, $NewLineFormat.NewLineCarriage).Replace("`n", $NewLineFormat.NewLine).Replace("`r", $NewLineFormat.Carriage) }
    }
    $Options['deferRender'] = $true
}