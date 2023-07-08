function New-TableButtonCSV {
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