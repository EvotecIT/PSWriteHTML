function New-AccordionItem {
    [cmdletBinding()]
    param(
        [string] $HeaderText,
        [string] $HeaderAlign,
        [string] $PanelText
    )

    New-HTMLTag -Tag 'div' -Attributes @{ class = 'ac' } {
        New-HTMLTag -Tag 'h2' -Attributes @{ class = 'ac-header'; } {
            # text-align: left;
            # font: bold 16px Arial,sans-serif;
            New-HTMLTag -Tag 'button' -Attributes @{ class = 'ac-trigger' } {
                $HeaderText
            }
        }
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'ac-panel' } {
            New-HTMLTag -Tag 'p' -Attributes @{ class = 'ac-text' } {
                # font: 15px/24px Arial, sans-serif;
                # color: #111;
                $PanelText
            }
        }
    }
}