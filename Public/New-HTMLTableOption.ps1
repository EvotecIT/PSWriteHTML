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

    .PARAMETER NewLineCarriage
    When JavaScript or AjaxJSON is used, one can configure NewLineCarriage. Default NewLineCarriage = '<br>'

    .PARAMETER NewLine
    When JavaScript or AjaxJSON is used, one can configure NewLine. Default value for NewLine = "\n"

    .PARAMETER Carriage
    When JavaScript or AjaxJSON is used, one can configure Carriage. Default value for Carriage = "\r"

    .PARAMETER ArrayJoin
    When JavaScript or AjaxJSON is used, forces any array to be a string regardless of depth level

    .PARAMETER ArrayJoinString
    Uses defined string or char for array join. By default it uses comma with a space when used.

    .EXAMPLE
    New-HTML {
        New-HTMLTableOption -DateTimeFormat "yyyy-MM-dd HH:mm:ss" -BoolAsString
        New-HTMLSection -Invisible {
            New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects' {
                New-HTMLTable -DataTable $DataTable1
            }
            New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects' {
                New-HTMLTable -DataTable $DataTable1 -DataStore JavaScript
            }
        }
    } -ShowHTML

    .NOTES
    General notes
    #>
    [alias('New-TableOption', 'TableOption', 'EmailTableOption')]
    [cmdletBinding()]
    param(
        [ValidateSet('HTML', 'JavaScript', 'AjaxJSON')][string] $DataStore,
        [switch] $BoolAsString,
        [switch] $NumberAsString,
        [string] $DateTimeFormat,
        [string] $NewLineCarriage,
        [string] $NewLine,
        [string] $Carriage,
        [switch] $ArrayJoin,
        [string] $ArrayJoinString = ', '
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
        if ($NewLineCarriage) {
            $Script:HTMLSchema['TableOptions']['DataStoreOptions'].NewLineFormat.NewLineCarriage = $NewLineCarriage
        }
        if ($NewLine) {
            $Script:HTMLSchema['TableOptions']['DataStoreOptions'].NewLineFormat.NewLine = $NewLine
        }
        if ($Carriage) {
            $Script:HTMLSchema['TableOptions']['DataStoreOptions'].NewLineFormat.Carriage = $Carriage
        }
        if ($ArrayJoin) {
            $Script:HTMLSchema['TableOptions']['DataStoreOptions'].ArrayJoin = $true
            $Script:HTMLSchema['TableOptions']['DataStoreOptions'].ArrayJoinString = $ArrayJoinString
        }
    }
}