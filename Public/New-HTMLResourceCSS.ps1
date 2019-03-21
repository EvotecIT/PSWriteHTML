function New-HTMLResourceCSS {
    [alias('New-ResourceCSS', 'New-CSS')]
    [CmdletBinding()]
    param(
        [alias('ScriptContent')][Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content,
        [string] $Link,
        [string] $ResourceComment,
        [string] $FilePath
    
    )
    $Output = @(
        "<!-- CSS $ResourceComment START -->"
        foreach ($File in $FilePath) {
            if ($File -ne '') {
                if (Test-Path -LiteralPath $File) {                
                    New-HTMLTag -Tag 'style' -Attributes @{ type = 'text/css' } {    
                        Write-Verbose "New-HTMLResourceCSS - Reading file from $File"        
                        Get-Content -LiteralPath $File           
                    }
                } 
            }
        }
        foreach ($L in $Link) {   
            if ($L -ne '') {
                Write-Verbose "New-HTMLResourceCSS - Adding link $L"   
                New-HTMlTag -Tag 'link' -Attributes @{ rel = "stylesheet"; type = "text/css"; href = $L } -SelfClosing
            }
        }
        "<!-- CSS $ResourceComment END -->"
    )
    if ($Output.Count -gt 2) {
        # Outputs only if more than comments
        $Output
    } 
}