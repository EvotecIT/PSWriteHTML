Function Get-HTMLCodeBlock {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $Code,
        [Parameter(Mandatory = $false)]
        [String]
        $Style = 'PowerShell'
    )
    $CodeBlock = @()
    switch ($Style) {
        'PowerShell' {
            $CodeBlock += '<pre class="PowerShell">'
        }
        'othercodestyleneedsACSSStyle' {
            $CodeBlock += '<pre class="PowerShell">'
        }
        default {
            $CodeBlock += '<pre>'
        }
    }

    $CodeBlock += $Code
    $CodeBlock += '</pre>'
    [string]$CodeBlock = $CodeBlock
    Write-Output $CodeBlock
}