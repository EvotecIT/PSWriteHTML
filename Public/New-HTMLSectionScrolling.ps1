function New-HTMLSectionScrolling {
    <#
    .SYNOPSIS
    Creates a new HTML section with scrolling functionality.

    .DESCRIPTION
    This function creates a new HTML section with scrolling functionality. It takes a script block as input, executes the script block, and generates HTML output for each SectionScrollingItem.

    .PARAMETER Content
    The script block containing the content to be displayed in the HTML section.

    .EXAMPLE
    New-HTMLSectionScrolling -Content {
        [PSCustomObject]@{
            Type = 'SectionScrollingItem'
            HTMLOutput = '<p>Section 1</p>'
            ListEntry = 'Section 1'
        }
        [PSCustomObject]@{
            Type = 'SectionScrollingItem'
            HTMLOutput = '<p>Section 2</p>'
            ListEntry = 'Section 2'
        }
    }

    .NOTES
    File Name      : New-HTMLSectionScrolling.ps1
    Prerequisite   : This function requires Enable-HTMLFeature to be run with the SectionScrolling feature enabled.
    #>
    [cmdletBinding()]
    param(
        [scriptblock]$Content
    )
    Enable-HTMLFeature -Feature SectionScrolling

    if ($Content) {
        $ContentExecuted = & $Content

        $HTMLListScrolling = [System.Collections.Generic.List[string]]::new()
        $HTMLData = foreach ($C in $ContentExecuted) {
            if ($C -is [PSCustomObject] -and $C.Type -eq 'SectionScrollingItem') {
                $C.HTMLOutput
                $HTMLListScrolling.Add($C.ListEntry)
            }
        }
        New-HTMLTag -Tag 'div' {
            New-HTMLTag -Tag 'div' {
                $HTMLData
            }
            New-HTMLTag -Tag 'nav' {
                New-HTMLTag -Tag 'ol' {
                    $HTMLListScrolling
                }
            } -Attributes @{ class = 'section-nav' }
        } -Attributes @{ class = 'sectionScrolling' }
    }
}