function New-HTMLAccordion {
    <#
    .SYNOPSIS
    Creates a new HTML accordion element with customizable options.

    .DESCRIPTION
    This function creates a new HTML accordion element with the specified accordion item content, duration of animation, and option to collapse on click.

    .PARAMETER AccordionItem
    Specifies the content of the accordion item as a script block.

    .PARAMETER Duration
    Specifies the duration of the accordion animation in milliseconds.

    .PARAMETER CollapseOnClick
    Indicates whether the accordion should collapse when clicked.

    .EXAMPLE
    New-HTMLAccordion -AccordionItem { "Accordion Content Here" } -Duration 500 -CollapseOnClick
    Creates a new HTML accordion with the specified content, animation duration of 500 milliseconds, and collapses on click.

    #>
    [cmdletBinding()]
    param(
        [scriptBlock] $AccordionItem,
        [int] $Duration,
        [switch] $CollapseOnClick
    )
    # Implementation based on https://github.com/michu2k/Accordion
    # Make sure AccordionFAQ is added to source
    $Script:HTMLSchema.Features.AccordionFAQ = $true

    [string] $ID = "Accordion" + (Get-RandomStringName -Size 8)

    $Options = @{}
    if ($Duration) {
        $Options['duration'] = $Duration
    }
    if ($CollapseOnClick) {
        $Options['collapse'] = $true
    }
    $OptionsJSON = $Options | ConvertTo-Json

    if ($AccordionItem) {
        New-HTMLTag -Tag 'div' -Attributes @{ id = $Id ; class = "accordion-container flexElement" } {
            & $AccordionItem
        }
        New-HTMLTag -Tag 'script' {
            "new Accordion('#$Id', $OptionsJSON);"
        }
    }
}