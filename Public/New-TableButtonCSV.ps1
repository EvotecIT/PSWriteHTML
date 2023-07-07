function New-TableButtonCSV {
    [alias('TableButtonCSV', 'EmailTableButtonCSV', 'New-HTMLTableButtonCSV')]
    [CmdletBinding()]
    param(
        [string] $Title,
        [string] $ButtonName = 'CSV',
        [string] $Extension = '.csv',
        [string] $FileName,
        [switch] $DisableBOM,
        [string] $FieldSeparator = ';'
    )
    if (-not $Script:HTMLSchema['TableSimplify']) {
        $Script:HTMLSchema.Features.DataTablesButtons = $true
        $Script:HTMLSchema.Features.DataTablesButtonsHTML5 = $true
    }
    $Output = [ordered]@{
        extend         = 'csvHtml5'
        text           = $ButtonName
        charset        = 'utf-8'
        extension      = $Extension
        fieldSeparator = $FieldSeparator
        fieldBoundary  = ''
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