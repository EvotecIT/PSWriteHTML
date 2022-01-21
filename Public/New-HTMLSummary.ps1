function New-HTMLSummary {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER SummaryItems
    Parameter description

    .PARAMETER Title
    Parameter description

    .PARAMETER TitleRight
    Parameter description

    .EXAMPLE
    An example

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