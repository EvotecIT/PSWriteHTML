function New-TableJavaScript {
    <#
    .SYNOPSIS
    Creates a new JavaScript table with customizable options.

    .DESCRIPTION
    This function generates a new JavaScript table with the specified header names and options. It allows customization of the data marker, column data formatting, and deferred rendering.

    .PARAMETER HeaderNames
    Specifies an array of header names for the table.

    .PARAMETER Options
    Specifies a dictionary of options for configuring the table.

    .PARAMETER NewLineFormat
    Specifies a dictionary containing newline formatting characters.

    .EXAMPLE
    New-TableJavaScript -HeaderNames @('Name', 'Age', 'Location') -Options @{ 'paging' = $true; 'searching' = $true } -NewLineFormat @{ 'NewLineCarriage' = '\r\n'; 'NewLine' = '\n'; 'Carriage' = '\r' }
    Creates a new JavaScript table with headers 'Name', 'Age', 'Location', paging enabled, searching enabled, and custom newline formatting.

    #>
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