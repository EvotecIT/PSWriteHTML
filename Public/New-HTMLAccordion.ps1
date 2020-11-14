function New-HTMLAccordion {
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