function New-HTMLSummary {
    <#
    .SYNOPSIS
    Creates a new HTML summary section with customizable content.

    .DESCRIPTION
    The New-HTMLSummary function creates an HTML summary section with customizable content. It allows you to display a summary with a title, additional information, and summary items.

    .PARAMETER SummaryItems
    Specifies the script block containing the summary items to be displayed within the summary section.

    .PARAMETER Title
    Specifies the title of the summary section.

    .PARAMETER TitleRight
    Specifies the additional information to be displayed on the right side of the title.

    .EXAMPLE
    New-HTMLSummary -SummaryItems {
        "Summary Item 1"
        "Summary Item 2"
    } -Title "Summary Title" -TitleRight "Additional Info"

    Creates a new HTML summary section with the title "Summary Title", displaying "Summary Item 1" and "Summary Item 2" as summary items, and additional information "Additional Info" on the right side of the title.

    .NOTES
    Based on https://codepen.io/banik/pen/exjLzB by Tony Banik
    #>
    [cmdletBinding()]
    param(
        [scriptblock] $SummaryItems,
        [string] $Title,
        [string] $TitleRight
    )

    Enable-HTMLFeature -Feature MainFlex, AccordionSummary

    New-HTMLTag -Tag 'container' {
        New-HTMLTag -Tag 'h2' {
            $Title
            New-HTMLTag -Tag 'span' {
                $TitleRight
            } -Attributes @{ 'class' = 'summary-end' }
        } -Attributes @{ class = 'summary-title' }
        & $SummaryItems
    }
}