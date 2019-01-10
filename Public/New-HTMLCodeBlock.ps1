Function New-HTMLCodeBlock {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)][String] $Code,
        [Parameter(Mandatory = $false)][String] $Style = 'PowerShell'
    )

    $CodeBlock = "<pre data-enlighter-language=`"$Style`">$Code</pre>"
    return $CodeBlock
}