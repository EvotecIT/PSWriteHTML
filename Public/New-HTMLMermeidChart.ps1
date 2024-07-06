function New-HTMLMermeidChart {
    <#
    .SYNOPSIS
    Creates a new HTML Mermaid chart.

    .DESCRIPTION
    This function creates a new HTML Mermaid chart based on the provided Markdown scriptblock.

    .PARAMETER Markdown
    The Markdown scriptblock containing the Mermaid chart definition.

    .EXAMPLE
    New-HTMLMermeidChart -Markdown { @"
    graph TD;
        A-->B;
        A-->C;
        B-->D;
        C-->D;
    "@ }

    This example creates a simple flowchart with nodes A, B, C, and D connected by arrows.

    #>
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