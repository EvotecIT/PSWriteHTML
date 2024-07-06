function New-AccordionItem {
    <#
    .SYNOPSIS
    Creates a new accordion item with specified header text and panel text.

    .DESCRIPTION
    This function creates a new accordion item with the provided header text and panel text. The header text is displayed as a clickable button to toggle the visibility of the panel text.

    .PARAMETER HeaderText
    The text to be displayed as the header of the accordion item.

    .PARAMETER HeaderAlign
    The alignment of the header text. Accepted values are 'left', 'center', or 'right'.

    .PARAMETER PanelText
    The text to be displayed in the panel of the accordion item.

    .EXAMPLE
    New-AccordionItem -HeaderText "Header 1" -HeaderAlign "left" -PanelText "Panel 1 Text"

    Creates a new accordion item with the header text "Header 1" aligned to the left and panel text "Panel 1 Text".

    .EXAMPLE
    New-AccordionItem -HeaderText "Header 2" -HeaderAlign "center" -PanelText "Panel 2 Text"

    Creates a new accordion item with the header text "Header 2" aligned to the center and panel text "Panel 2 Text".
    #>
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