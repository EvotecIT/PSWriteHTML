function New-HTMLResourceJS {
    [alias('New-ResourceJS', 'New-JavaScript')]
    [CmdletBinding()]
    param(
        [alias('ScriptContent')][Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content,
        [string] $Link
    )   
    New-HTMlTag -Tag 'script' -Attributes @{ type = "text/javascript"; src = $Link } -Value $Content
}