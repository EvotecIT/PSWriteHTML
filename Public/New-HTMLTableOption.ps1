function New-HTMLTableOption {
    [cmdletBinding()]
    param(
        [ValidateSet('HTML', 'JavaScript', 'AjaxJSON')][string] $DataStore
    )
    if ($DataStore -and $Script:HTMLSchema) {
        $Script:HTMLSchema['TableOptions']['DataStore'] = $DataStore
    }
}