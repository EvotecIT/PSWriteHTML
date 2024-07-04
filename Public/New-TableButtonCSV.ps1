function New-TableButtonCSV {
    <#
    .SYNOPSIS
    Creates a new table button for exporting data to CSV with customizable options.

    .DESCRIPTION
    This function creates a new table button for exporting data to CSV with customizable options. It allows users to specify the button title, file name, and other settings for CSV export.

    .PARAMETER Title
    The title to be displayed when hovering over the button.

    .PARAMETER ButtonName
    The text to be displayed on the button. Default value is 'CSV'.

    .PARAMETER Extension
    The file extension for the exported CSV file. Default value is '.csv'.

    .PARAMETER FileName
    The name of the exported CSV file.

    .PARAMETER DisableBOM
    Switch to disable Byte Order Mark (BOM) in the exported CSV file.

    .PARAMETER FieldSeparator
    The separator character for fields in the CSV file. Default value is ';'.

    .PARAMETER FieldBoundary
    The character used to enclose fields in the CSV file. Default value is '"'.

    .EXAMPLE
    New-TableButtonCSV -Title "Export to CSV" -FileName "data" -FieldSeparator "," -FieldBoundary "'"

    Description
    -----------
    Creates a new table button with the title "Export to CSV", exports data to a CSV file named "data.csv" with comma as the field separator and single quote as the field boundary.

    #>
    [alias('TableButtonCSV', 'EmailTableButtonCSV', 'New-HTMLTableButtonCSV')]
    [CmdletBinding()]
    param(
        [string] $Title,
        [string] $ButtonName = 'CSV',
        [string] $Extension = '.csv',
        [string] $FileName,
        [switch] $DisableBOM,
        [string] $FieldSeparator = ';',
        [string] $FieldBoundary = '"'
    )
    if (-not $Script:HTMLSchema['TableSimplify']) {
        $Script:HTMLSchema.Features.DataTablesButtons = $true
        $Script:HTMLSchema.Features.DataTablesButtonsHTML5 = $true
    }
    if ($FileName) {
        $Split = $FileName.Split('.')
        if ($Split.Count -gt 1) {
            $Extension = '.' + $Split[-1]
        }
        $FileName = $Split[0]
    }
    $Output = [ordered]@{
        extend         = 'csvHtml5'
        text           = $ButtonName
        charset        = 'utf-8'
        extension      = $Extension
        fieldSeparator = $FieldSeparator
        fieldBoundary  = $FieldBoundary
        bom            = -not $DisableBOM.IsPresent
    }
    if ($FileName) {
        $Output['filename'] = $FileName
    }
    if ($Title) {
        $Output['title'] = $title
    }
    [PSCustomObject] @{
        Type   = 'TableButtonCSV'
        Output = $Output
    }
}