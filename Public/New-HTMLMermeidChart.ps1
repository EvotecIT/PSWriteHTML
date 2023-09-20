function New-HTMLMermeidChart {
    [alias('New-HTMLMermeid')]
    [CmdletBinding()]
    param(
        [scriptblock] $Markdown
    )

    $Script:HTMLSchema.Features.Mermaid = $true

    $Data = & $Markdown
    if ($Data -is [string]) {
        $Data = $Data
    } else {
        $Data = $Data -join "`r`n"
    }

    New-HTMLTag -Tag 'div' -Attributes @{ class = 'mermaid' } {
        $Data
    }
}