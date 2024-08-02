function New-HTMLSectionScrollingItem {
    <#
    .SYNOPSIS
    Creates a new HTML section with scrolling functionality.

    .DESCRIPTION
    This function creates a new HTML section with scrolling functionality. It allows you to define the content and title of the section.

    .PARAMETER Content
    The script block containing the content to be displayed within the section.

    .PARAMETER SectionTitle
    The title of the section.

    .EXAMPLE
    New-HTMLSectionScrollingItem -SectionTitle "Introduction" -Content {
        "This is the introduction section."
    }
    Creates a new HTML section with the title "Introduction" and the content "This is the introduction section."

    #>
    [cmdletBinding()]
    param(
        [scriptblock] $Content,
        [string] $SectionTitle
    )

    $Name = "scrolling-$(Get-RandomStringName -Size 8 -LettersOnly)"
    $NestedScrollingList = [System.Collections.Generic.List[string]]::new()

    $HTMLOutput = New-HTMLTag -Tag 'section' {
        New-HTMLTag -Tag 'h2' {
            $SectionTitle
        }
        New-HTMLTag -Tag 'div' {
            #  $Script:HTMLSectionScrollingItem = $true
            $ExecutedContent = if ($Content) {
                & $Content
            }
            foreach ($C in $ExecutedContent) {
                if ($C -is [PSCustomObject] -and $C.Type -eq 'SectionScrollingItem') {
                    $C.HTMLOutput
                    $NestedScrollingList.Add($C.ListEntry)
                } else {
                    $C
                }
            }
        }
    } -Attributes @{ 'id' = $Name }

    if ($NestedScrollingList.Count -gt 0) {
        $ListEntry = New-HTMLTag -Tag 'li' {
            New-HTMLTag -Tag 'a' {
                $SectionTitle
            } -Attributes @{ href = "#$Name" }
            New-HTMLTag -Tag 'ul' {
                $NestedScrollingList
            }
        }
    } else {
        $ListEntry = New-HTMLTag -Tag 'li' {
            New-HTMLTag -Tag 'a' {
                $SectionTitle
            } -Attributes @{ href = "#$Name" }
        }
    }
    [PSCustomObject] @{
        Type       = 'SectionScrollingItem'
        HTMLOutput = $HTMLOutput
        ListEntry  = $ListEntry
        Name       = $Name
        Level      = $Level
    }
}