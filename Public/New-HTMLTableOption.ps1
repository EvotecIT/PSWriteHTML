function New-HTMLTableOption {
    [alias('New-TableOption', 'TableOption')]
    [cmdletBinding()]
    param(
        [ValidateSet('HTML', 'JavaScript', 'AjaxJSON')][string] $DataStore
    )
    if ($DataStore -and $Script:HTMLSchema) {
        $Script:HTMLSchema['TableOptions']['DataStore'] = $DataStore
    }
}