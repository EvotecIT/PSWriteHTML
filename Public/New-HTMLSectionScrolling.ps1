function New-HTMLSectionScrolling {
    [cmdletBinding()]
    param(
        [scriptblock]$Content
    )
    #Enable-HTMLFeature -Feature MainFlex, AccordionSummary
    Enable-HTMLFeature -Feature SectionScrolling

    if ($Content) {
        $ContentExecuted = & $Content

        $HTMLList = [System.Collections.Generic.List[string]]::new()
        $HTMLData = foreach ($C in $ContentExecuted) {
            if ($C -is [PSCustomObject] -and $C.Type -eq 'SectionScrollingItem') {
                $C.HTMLOutput
                $HTMLList.Add($C.ListEntry)
            }
        }
        New-HTMLTag -Tag 'div' {
            New-HTMLTag -Tag 'div' {
                $HTMLData
            }
            New-HTMLTag -Tag 'nav' {
                New-HTMLTag -Tag 'ol' {
                    $HTMLList
                }
            } -Attributes @{ class = 'section-nav' }
        } -Attributes @{ class = 'sectionScrolling' }
    }
}