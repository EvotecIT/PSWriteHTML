function New-HTMLResourceJS {
    [alias('New-ResourceJS', 'New-JavaScript')]
    [CmdletBinding()]
    param(
        [alias('ScriptContent')][Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content,
        [string[]] $Link,
        [string] $ResourceComment,
        [string[]] $FilePath
    )   
    $Output = @(
        "<!-- JS $ResourceComment START -->"
        foreach ($File in $FilePath) {
            if ($File -ne '') {
                if (Test-Path -LiteralPath $File) {
                    New-HTMLTag -Tag 'script' -Attributes @{ type = 'text/javascript' } {            
                        Get-Content -LiteralPath $File          
                    }
                } else {
                    return
                }
            } 
        }
        foreach ($L in $Link) {        
            if ($L -ne '') {
                New-HTMlTag -Tag 'script' -Attributes @{ type = "text/javascript"; src = $L } 
            } else {
                return
            }
        }
        "<!-- JS $ResourceComment END -->"
    )
    if ($Output.Count -gt 2) {
        # Outputs only if more than comments
        $Output
    } 
}