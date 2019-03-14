function New-HTMLResourceJS {
    [alias('New-ResourceJS', 'New-JavaScript')]
    [CmdletBinding()]
    param(
        [alias('ScriptContent')][Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content,
        [string] $Link,
        [string] $ResourceComment,
        [string] $FilePath
    )   
    "<!-- JS $ResourceComment START -->"
    if ($FilePath -ne '') {
        New-HTMLTag -Tag 'script' -Attributes @{ type = 'text/javascript' } {
            if (Test-Path -LiteralPath $FilePath) {
                Get-Content -LiteralPath $FilePath
            }
        }
    } else {
        New-HTMlTag -Tag 'script' -Attributes @{ type = "text/javascript"; src = $Link } 
    }
    "<!-- JS $ResourceComment END -->"
}