function New-HTMLResourceCSS {
    [alias('New-ResourceCSS', 'New-CSS')]
    [CmdletBinding()]
    param(
        [alias('ScriptContent')][Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content,
        [string] $Link,
        [string] $ResourceComment,
        [string] $FilePath
    )
    "<!-- CSS $ResourceComment START -->"
    if ($FilePath -ne '') {
        New-HTMLTag -Tag 'style' -Attributes @{ type = 'text/css' } {
            if (Test-Path -LiteralPath $FilePath) {
                Get-Content -LiteralPath $FilePath
            }
        }
    } else {
        New-HTMlTag -Tag 'link' -Attributes @{ rel = "stylesheet"; type = "text/css"; href = $Link } 
    }
    "<!-- CSS $ResourceComment END -->"
}