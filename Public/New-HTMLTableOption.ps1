function New-HTMLTableOption {
    <#
    .SYNOPSIS
    Configures New-HTMLTable options

    .DESCRIPTION
    Configures New-HTMLTable options

    .PARAMETER DataStore
    Choose how Data is stored for all tables HTML, JavaScript or AjaxJSON (external file)

    .PARAMETER BoolAsString
    When JavaScript or AjaxJSON is used, forces bool to string

    .PARAMETER NumberAsString
    When JavaScript or AjaxJSON is used, forces number to string

    .PARAMETER DateTimeFormat
    When JavaScript or AjaxJSON is used, one can configure DateTimeFormat (in PowerShell way)

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [alias('New-TableOption', 'TableOption')]
    [cmdletBinding()]
    param(
        [ValidateSet('HTML', 'JavaScript', 'AjaxJSON')][string] $DataStore,
        [switch] $BoolAsString,
        [switch] $NumberAsString,
        [string] $DateTimeFormat
    )
    if ($Script:HTMLSchema) {
        if ($DataStore ) {
            $Script:HTMLSchema['TableOptions']['DataStore'] = $DataStore
        }
        if ($BoolAsString.IsPresent) {
            $Script:HTMLSchema['TableOptions']['DataStoreOptions'].BoolAsString = $BoolAsString.IsPresent
        }
        if ($NumberAsString.IsPresent) {
            $Script:HTMLSchema['TableOptions']['DataStoreOptions'].NumberAsString = $NumberAsString.IsPresent
        }
        if ($DateTimeFormat) {
            $Script:HTMLSchema['TableOptions']['DataStoreOptions'].DateTimeFormat = $DateTimeFormat
        }
    }
}