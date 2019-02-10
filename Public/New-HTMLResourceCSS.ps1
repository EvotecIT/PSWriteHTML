function New-HTMLResourceCSS {
    [alias('New-ResourceCSS', 'New-CSS')]
    [CmdletBinding()]
    param(
        [alias('ScriptContent')][Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content,
        [string] $Link,
        [string] $ResourceComment
    )
    "<!-- CSS $ResourceComment -->"
    if ($Content -eq '') {
        New-HTMlTag -Tag 'link' -Attributes @{ rel = "stylesheet"; type = "text/css"; href = $Link } 
    } else {
        New-HTMLTag -Tag 'style' -Attributes @{ type = 'text/css' } {
            $Content
        }
    }
    "<!-- CSS $ResourceComment END -->"
}